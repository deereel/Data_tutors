<?php
/**
 * Data Tutors - Database Connection & Helpers
 * Extended database functionality
 */

class DatabaseConnection {
    private static $instance = null;
    private $pdo;
    
    private function __construct() {
        try {
            $dsn = "mysql:host=" . DB_HOST . ";dbname=" . DB_NAME . ";charset=" . DB_CHARSET;
            $options = [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                PDO::ATTR_EMULATE_PREPARES => false
            ];
            $this->pdo = new PDO($dsn, DB_USER, DB_PASS, $options);
        } catch (PDOException $e) {
            die("Database connection failed: " . $e->getMessage());
        }
    }
    
    public static function getInstance() {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance->pdo;
    }
    
    public static function query($sql, $params = []) {
        $stmt = self::getInstance()->prepare($sql);
        $stmt->execute($params);
        return $stmt;
    }
    
    public static function fetch($sql, $params = []) {
        $stmt = self::query($sql, $params);
        return $stmt->fetch();
    }
    
    public static function fetchAll($sql, $params = []) {
        $stmt = self::query($sql, $params);
        return $stmt->fetchAll();
    }
    
    public static function fetchColumn($sql, $params = []) {
        $stmt = self::query($sql, $params);
        return $stmt->fetchColumn();
    }
    
    public static function insert($table, $data) {
        $columns = implode(', ', array_keys($data));
        $placeholders = ':' . implode(', :', array_keys($data));
        
        $sql = "INSERT INTO {$table} ({$columns}) VALUES ({$placeholders})";
        self::query($sql, $data);
        
        return self::getInstance()->lastInsertId();
    }
    
    public static function update($table, $data, $where, $whereParams = []) {
        $sets = [];
        foreach (array_keys($data) as $column) {
            $sets[] = "{$column} = :{$column}";
        }
        
        $sql = "UPDATE {$table} SET " . implode(', ', $sets) . " WHERE {$where}";
        self::query($sql, array_merge($data, $whereParams));
        
        return true;
    }
    
    public static function delete($table, $where, $params = []) {
        $sql = "DELETE FROM {$table} WHERE {$where}";
        self::query($sql, $params);
        
        return true;
    }
    
    public static function count($table, $where = '1=1', $params = []) {
        $sql = "SELECT COUNT(*) FROM {$table} WHERE {$where}";
        return self::fetchColumn($sql, $params);
    }
    
    public static function exists($table, $where, $params = []) {
        return self::count($table, $where, $params) > 0;
    }
}

// Course Model
class Course {
    public static function getAll($filters = []) {
        $sql = "SELECT * FROM courses WHERE published = 1";
        $params = [];
        
        if (!empty($filters['category'])) {
            $sql .= " AND category = :category";
            $params['category'] = $filters['category'];
        }
        
        if (!empty($filters['level'])) {
            $sql .= " AND level = :level";
            $params['level'] = $filters['level'];
        }
        
        if (!empty($filters['featured'])) {
            $sql .= " AND featured = 1";
        }
        
        $sql .= " ORDER BY created_at DESC";
        
        return DatabaseConnection::fetchAll($sql, $params);
    }
    
    public static function getById($id) {
        return DatabaseConnection::fetch("SELECT * FROM courses WHERE id = ?", [$id]);
    }
    
    public static function getBySlug($slug) {
        return DatabaseConnection::fetch("SELECT * FROM courses WHERE slug = ?", [$slug]);
    }
    
    public static function getFeatured() {
        return DatabaseConnection::fetchAll("SELECT * FROM courses WHERE published = 1 AND featured = 1 ORDER BY created_at DESC LIMIT 3");
    }
    
    public static function getModules($courseId) {
        return DatabaseConnection::fetchAll("SELECT * FROM modules WHERE course_id = ? AND is_published = 1 ORDER BY order_index", [$courseId]);
    }
    
    public static function getLessonCount($courseId) {
        return DatabaseConnection::fetchColumn("SELECT COUNT(*) FROM lessons l JOIN modules m ON l.module_id = m.id WHERE m.course_id = ? AND l.is_published = 1", [$courseId]);
    }
}

// Module Model
class Module {
    public static function getById($id) {
        return DatabaseConnection::fetch("SELECT * FROM modules WHERE id = ?", [$id]);
    }
    
    public static function getLessons($moduleId) {
        return DatabaseConnection::fetchAll("SELECT * FROM lessons WHERE module_id = ? AND is_published = 1 ORDER BY order_index", [$moduleId]);
    }
    
    // Admin methods for module management
    public static function getAllByCourse($courseId) {
        return DatabaseConnection::fetchAll("SELECT * FROM modules WHERE course_id = ? ORDER BY order_index", [$courseId]);
    }
    
    public static function create($data) {
        return DatabaseConnection::insert('modules', $data);
    }
    
    public static function update($id, $data) {
        return DatabaseConnection::update('modules', $data, 'id = :id', ['id' => $id]);
    }
    
    public static function delete($id) {
        return DatabaseConnection::delete('modules', 'id = ?', [$id]);
    }
    
    public static function getMaxOrderIndex($courseId) {
        return DatabaseConnection::fetchColumn("SELECT COALESCE(MAX(order_index), 0) FROM modules WHERE course_id = ?", [$courseId]);
    }
    
    public static function getLessonCount($moduleId) {
        return DatabaseConnection::fetchColumn("SELECT COUNT(*) FROM lessons WHERE module_id = ?", [$moduleId]);
    }
    
    public static function updateOrder($id, $orderIndex) {
        return DatabaseConnection::update('modules', ['order_index' => $orderIndex], 'id = :id', ['id' => $id]);
    }
}

// Lesson Model
class Lesson {
    public static function getById($id) {
        return DatabaseConnection::fetch("SELECT * FROM lessons WHERE id = ?", [$id]);
    }
    
    public static function getBySlug($moduleId, $slug) {
        return DatabaseConnection::fetch("SELECT * FROM lessons WHERE module_id = ? AND slug = ?", [$moduleId, $slug]);
    }
    
    public static function getResources($lessonId) {
        return DatabaseConnection::fetchAll("SELECT * FROM lesson_resources WHERE lesson_id = ?", [$lessonId]);
    }
    
    public static function getNext($currentLessonId, $moduleId) {
        return DatabaseConnection::fetch(
            "SELECT * FROM lessons WHERE module_id = ? AND order_index > (SELECT order_index FROM lessons WHERE id = ?) ORDER BY order_index LIMIT 1",
            [$moduleId, $currentLessonId]
        );
    }
    
    public static function getPrevious($currentLessonId, $moduleId) {
        return DatabaseConnection::fetch(
            "SELECT * FROM lessons WHERE module_id = ? AND order_index < (SELECT order_index FROM lessons WHERE id = ?) ORDER BY order_index DESC LIMIT 1",
            [$moduleId, $currentLessonId]
        );
    }
    
    // Admin methods for lesson management
    public static function create($data) {
        return DatabaseConnection::insert('lessons', $data);
    }
    
    public static function update($id, $data) {
        return DatabaseConnection::update('lessons', $data, 'id = :id', ['id' => $id]);
    }
    
    public static function delete($id) {
        return DatabaseConnection::delete('lessons', 'id = ?', [$id]);
    }
    
    public static function getAllByModule($moduleId) {
        return DatabaseConnection::fetchAll("SELECT * FROM lessons WHERE module_id = ? ORDER BY order_index", [$moduleId]);
    }
    
    public static function getMaxOrderIndex($moduleId) {
        return DatabaseConnection::fetchColumn("SELECT COALESCE(MAX(order_index), 0) FROM lessons WHERE module_id = ?", [$moduleId]);
    }
}

// Resource Model for lesson content
class LessonResource {
    public static function getById($id) {
        return DatabaseConnection::fetch("SELECT * FROM lesson_resources WHERE id = ?", [$id]);
    }
    
    public static function getByLesson($lessonId) {
        return DatabaseConnection::fetchAll("SELECT * FROM lesson_resources WHERE lesson_id = ? ORDER BY created_at", [$lessonId]);
    }
    
    public static function create($data) {
        return DatabaseConnection::insert('lesson_resources', $data);
    }
    
    public static function delete($id) {
        return DatabaseConnection::delete('lesson_resources', 'id = ?', [$id]);
    }
    
    public static function update($id, $data) {
        return DatabaseConnection::update('lesson_resources', $data, 'id = :id', ['id' => $id]);
    }
}

// User Model
class User {
    public static function getById($id) {
        return DatabaseConnection::fetch("SELECT id, name, username, email, phone, avatar, role, status, email_verified, bio, created_at FROM users WHERE id = ?", [$id]);
    }
    
    public static function getByEmail($email) {
        return DatabaseConnection::fetch("SELECT * FROM users WHERE email = ?", [$email]);
    }
    
    public static function getByUsername($username) {
        return DatabaseConnection::fetch("SELECT * FROM users WHERE username = ?", [$username]);
    }
    
    public static function create($data) {
        $data['password'] = password_hash($data['password'], PASSWORD_DEFAULT);
        $data['email_token'] = generateToken();
        return DatabaseConnection::insert('users', $data);
    }
    
    public static function update($id, $data) {
        if (isset($data['password'])) {
            $data['password'] = password_hash($data['password'], PASSWORD_DEFAULT);
        }
        return DatabaseConnection::update('users', $data, 'id = :id', ['id' => $id]);
    }
    
    public static function verifyPassword($email, $password) {
        $user = DatabaseConnection::fetch("SELECT * FROM users WHERE email = ?", [$email]);
        if ($user && password_verify($password, $user['password'])) {
            return $user;
        }
        return false;
    }
    
    public static function verifyPasswordByUsername($username, $password) {
        $user = DatabaseConnection::fetch("SELECT * FROM users WHERE username = ?", [$username]);
        if ($user && password_verify($password, $user['password'])) {
            return $user;
        }
        return false;
    }
}

// Enrollment Model
class Enrollment {
    public static function isEnrolled($userId, $courseId) {
        return DatabaseConnection::exists('enrollments', 'user_id = ? AND course_id = ?', [$userId, $courseId]);
    }
    
    public static function enroll($userId, $courseId) {
        if (self::isEnrolled($userId, $courseId)) {
            return false;
        }
        
        DatabaseConnection::insert('enrollments', [
            'user_id' => $userId,
            'course_id' => $courseId
        ]);
        
        // Initialize course progress
        $totalLessons = Course::getLessonCount($courseId);
        DatabaseConnection::insert('user_course_progress', [
            'user_id' => $userId,
            'course_id' => $courseId,
            'total_lessons' => $totalLessons
        ]);
        
        return true;
    }
    
    public static function getEnrolledCourses($userId) {
        $sql = "SELECT c.*, e.enrolled_at, e.completed_at, ucp.progress_percentage
                FROM enrollments e
                JOIN courses c ON e.course_id = c.id
                LEFT JOIN user_course_progress ucp ON e.user_id = ucp.user_id AND e.course_id = ucp.course_id
                WHERE e.user_id = ?
                ORDER BY e.enrolled_at DESC";
        
        return DatabaseConnection::fetchAll($sql, [$userId]);
    }
}

// Progress Model
class Progress {
    public static function getLessonProgress($userId, $lessonId) {
        return DatabaseConnection::fetch("SELECT * FROM user_lesson_progress WHERE user_id = ? AND lesson_id = ?", [$userId, $lessonId]);
    }
    
    public static function markLessonComplete($userId, $lessonId) {
        $lesson = Lesson::getById($lessonId);
        if (!$lesson) return false;
        
        $module = Module::getById($lesson['module_id']);
        $courseId = $module['course_id'];
        
        DatabaseConnection::query(
            "INSERT INTO user_lesson_progress (user_id, lesson_id, is_completed, completed_at) 
             VALUES (?, ?, 1, NOW()) 
             ON DUPLICATE KEY UPDATE is_completed = 1, completed_at = NOW()",
            [$userId, $lessonId]
        );
        
        // Update course progress
        self::recalculateCourseProgress($userId, $courseId);
        
        return true;
    }
    
    public static function recalculateCourseProgress($userId, $courseId) {
        $totalLessons = Course::getLessonCount($courseId);
        $completedLessons = DatabaseConnection::fetchColumn(
            "SELECT COUNT(*) FROM user_lesson_progress ulp
             JOIN lessons l ON ulp.lesson_id = l.id
             JOIN modules m ON l.module_id = m.id
             WHERE ulp.user_id = ? AND m.course_id = ? AND ulp.is_completed = 1",
            [$userId, $courseId]
        );
        
        $percentage = $totalLessons > 0 ? ($completedLessons / $totalLessons) * 100 : 0;
        
        DatabaseConnection::query(
            "UPDATE user_course_progress 
             SET total_lessons = ?, total_lessons_completed = ?, progress_percentage = ?
             WHERE user_id = ? AND course_id = ?",
            [$totalLessons, $completedLessons, $percentage, $userId, $courseId]
        );
    }
    
    public static function getLastAccessedLesson($userId, $courseId) {
        return DatabaseConnection::fetch(
            "SELECT l.* FROM lessons l
             JOIN user_course_progress ucp ON l.id = ucp.last_lesson_id
             WHERE ucp.user_id = ? AND ucp.course_id = ?",
            [$userId, $courseId]
        );
    }
}

// Quiz Model
class Quiz {
    public static function getById($id) {
        return DatabaseConnection::fetch("SELECT * FROM quizzes WHERE id = ?", [$id]);
    }
    
    public static function getByLesson($lessonId) {
        return DatabaseConnection::fetch("SELECT * FROM quizzes WHERE lesson_id = ? AND published = 1", [$lessonId]);
    }
    
    public static function getByModule($moduleId) {
        return DatabaseConnection::fetchAll("SELECT * FROM quizzes WHERE module_id = ? ORDER BY created_at", [$moduleId]);
    }
    
    public static function getByCourse($courseId) {
        return DatabaseConnection::fetchAll("SELECT * FROM quizzes WHERE course_id = ? ORDER BY order_index", [$courseId]);
    }
    
    public static function getQuestions($quizId) {
        return DatabaseConnection::fetchAll("SELECT * FROM quiz_questions WHERE quiz_id = ? ORDER BY order_index", [$quizId]);
    }
    
    public static function getOptions($questionId) {
        return DatabaseConnection::fetchAll("SELECT * FROM quiz_options WHERE question_id = ? ORDER BY order_index", [$questionId]);
    }
    
    public static function saveResult($userId, $quizId, $score, $totalPoints, $percentage, $passed, $timeTaken, $attemptNumber, $answers) {
        return DatabaseConnection::insert('quiz_results', [
            'user_id' => $userId,
            'quiz_id' => $quizId,
            'score' => $score,
            'total_points' => $totalPoints,
            'percentage' => $percentage,
            'passed' => $passed,
            'time_taken' => $timeTaken,
            'attempt_number' => $attemptNumber,
            'answers' => json_encode($answers),
            'started_at' => date('Y-m-d H:i:s', strtotime("-{$timeTaken} seconds")),
            'completed_at' => date('Y-m-d H:i:s')
        ]);
    }
    
    public static function getResults($userId, $quizId) {
        return DatabaseConnection::fetchAll("SELECT * FROM quiz_results WHERE user_id = ? AND quiz_id = ? ORDER BY completed_at DESC", [$userId, $quizId]);
    }
    
    // Admin methods for quiz management
    public static function create($data) {
        // Set order index if not provided
        if (!isset($data['order_index']) || empty($data['order_index'])) {
            $courseId = $data['course_id'];
            $maxOrder = DatabaseConnection::fetchColumn("SELECT COALESCE(MAX(order_index), 0) FROM quizzes WHERE course_id = ?", [$courseId]);
            $data['order_index'] = $maxOrder + 1;
        }
        return DatabaseConnection::insert('quizzes', $data);
    }
    
    public static function update($id, $data) {
        return DatabaseConnection::update('quizzes', $data, 'id = :id', ['id' => $id]);
    }
    
    public static function delete($id) {
        return DatabaseConnection::delete('quizzes', 'id = ?', [$id]);
    }
    
    // Quiz Questions Admin Methods
    public static function createQuestion($data) {
        return DatabaseConnection::insert('quiz_questions', $data);
    }
    
    public static function updateQuestion($id, $data) {
        return DatabaseConnection::update('quiz_questions', $data, 'id = :id', ['id' => $id]);
    }
    
    public static function deleteQuestion($id) {
        return DatabaseConnection::delete('quiz_questions', 'id = ?', [$id]);
    }
    
    public static function getQuestionById($id) {
        return DatabaseConnection::fetch("SELECT * FROM quiz_questions WHERE id = ?", [$id]);
    }
    
    // Quiz Options Admin Methods
    public static function createOption($data) {
        return DatabaseConnection::insert('quiz_options', $data);
    }
    
    public static function deleteOptions($questionId) {
        return DatabaseConnection::delete('quiz_options', 'question_id = ?', [$questionId]);
    }
    
    public static function getResultsByQuiz($quizId) {
        return DatabaseConnection::fetchAll(
            "SELECT qr.*, u.name as user_name, u.email as user_email 
             FROM quiz_results qr 
             JOIN users u ON qr.user_id = u.id 
             WHERE qr.quiz_id = ? 
             ORDER BY qr.completed_at DESC",
            [$quizId]
        );
    }
    
    public static function getAverageScore($quizId) {
        return DatabaseConnection::fetchColumn(
            "SELECT AVG(percentage) FROM quiz_results WHERE quiz_id = ?",
            [$quizId]
        );
    }
    
    public static function getPassRate($quizId) {
        return DatabaseConnection::fetchColumn(
            "SELECT COUNT(*) * 100.0 / NULLIF(COUNT(*), 0) FROM quiz_results WHERE quiz_id = ? AND passed = 1",
            [$quizId]
        );
    }
    
    public static function updateResult($resultId, $data) {
        return DatabaseConnection::update('quiz_results', $data, 'id = :id', ['id' => $resultId]);
    }
    
    public static function getResultById($resultId) {
        return DatabaseConnection::fetch("SELECT * FROM quiz_results WHERE id = ?", [$resultId]);
    }
    
    public static function getResultWithAnswers($resultId) {
        $result = DatabaseConnection::fetch("SELECT * FROM quiz_results WHERE id = ?", [$resultId]);
        if (!$result) return null;
        
        $quiz = self::getById($result['quiz_id']);
        $questions = self::getQuestions($result['quiz_id']);
        
        // Parse the answers from JSON
        $answers = json_decode($result['answers'], true) ?? [];
        
        // Add questions and their options to the result
        $result['questions'] = [];
        foreach ($questions as $question) {
            $question['options'] = self::getOptions($question['id']);
            $question['user_answer'] = null;
            $question['is_correct'] = false;
            
            // Get user's answer for this question from the stored results
            if (isset($answers[$question['id']])) {
                $question['user_answer'] = $answers[$question['id']]['selected'] ?? null;
                $question['is_correct'] = $answers[$question['id']]['correct'] ?? false;
            }
            
            $result['questions'][] = $question;
        }
        
        $result['quiz'] = $quiz;
        return $result;
    }
    
    public static function hasPassed($userId, $quizId) {
        return DatabaseConnection::exists('quiz_results', 'user_id = ? AND quiz_id = ? AND passed = 1', [$userId, $quizId]);
    }
    
    // Reordering methods
    public static function updateOrder($id, $orderIndex) {
        return DatabaseConnection::update('quizzes', ['order_index' => $orderIndex], 'id = :id', ['id' => $id]);
    }
    
    public static function updateQuestionOrder($id, $orderIndex) {
        return DatabaseConnection::update('quiz_questions', ['order_index' => $orderIndex], 'id = :id', ['id' => $id]);
    }
}

// Forum Model
class Forum {
    public static function getCategories() {
        return DatabaseConnection::fetchAll("SELECT * FROM forum_categories ORDER BY name");
    }
    
    public static function getQuestions($filters = []) {
        $sql = "SELECT fq.*, u.name as author_name, u.avatar as author_avatar,
                       (SELECT COUNT(*) FROM forum_answers WHERE question_id = fq.id) as answer_count,
                       (SELECT COUNT(*) FROM forum_votes WHERE question_id = fq.id AND vote_type = 'up') - 
                       (SELECT COUNT(*) FROM forum_votes WHERE question_id = fq.id AND vote_type = 'down') as vote_count
                FROM forum_questions fq
                JOIN users u ON fq.user_id = u.id
                WHERE fq.is_deleted = 0";
        $params = [];
        
        if (!empty($filters['course_id'])) {
            $sql .= " AND fq.course_id = ?";
            $params[] = $filters['course_id'];
        }
        
        if (!empty($filters['category_id'])) {
            $sql .= " AND fq.category_id = ?";
            $params[] = $filters['category_id'];
        }
        
        if (!empty($filters['resolved'])) {
            $sql .= " AND fq.is_resolved = 1";
        }
        
        $sql .= " ORDER BY fq.is_pinned DESC, fq.created_at DESC";
        
        return DatabaseConnection::fetchAll($sql, $params);
    }
    
    public static function getQuestionById($id) {
        return DatabaseConnection::fetch(
            "SELECT fq.*, u.name as author_name, u.avatar as author_avatar
             FROM forum_questions fq
             JOIN users u ON fq.user_id = u.id
             WHERE fq.id = ? AND fq.is_deleted = 0",
            [$id]
        );
    }
    
    public static function createQuestion($userId, $data) {
        return DatabaseConnection::insert('forum_questions', array_merge([
            'user_id' => $userId
        ], $data));
    }
    
    public static function getAnswers($questionId) {
        $sql = "SELECT fa.*, u.name as author_name, u.avatar as author_avatar,
                       (SELECT COUNT(*) FROM forum_votes WHERE answer_id = fa.id AND vote_type = 'up') - 
                       (SELECT COUNT(*) FROM forum_votes WHERE answer_id = fa.id AND vote_type = 'down') as vote_count
                FROM forum_answers fa
                JOIN users u ON fa.user_id = u.id
                WHERE fa.question_id = ? AND fa.is_deleted = 0
                ORDER BY fa.is_accepted DESC, vote_count DESC, fa.created_at ASC";
        
        return DatabaseConnection::fetchAll($sql, [$questionId]);
    }
    
    public static function createAnswer($userId, $data) {
        return DatabaseConnection::insert('forum_answers', array_merge([
            'user_id' => $userId
        ], $data));
    }
}

// Certificate Model
class Certificate {
    public static function generate($userId, $courseId) {
        $user = User::getById($userId);
        $course = Course::getById($courseId);
        
        if (!$user || !$course) {
            return false;
        }
        
        $certificateId = 'DT-' . strtoupper(uniqid());
        
        return DatabaseConnection::insert('certificates', [
            'user_id' => $userId,
            'course_id' => $courseId,
            'certificate_id' => $certificateId,
            'student_name' => $user['name'],
            'course_name' => $course['title'],
            'completion_date' => date('Y-m-d'),
            'verification_url' => APP_URL . '/verify.php?id=' . $certificateId
        ]);
    }
    
    public static function verify($certificateId) {
        return DatabaseConnection::fetch("SELECT * FROM certificates WHERE certificate_id = ?", [$certificateId]);
    }
    
    public static function getByUser($userId) {
        return DatabaseConnection::fetchAll("SELECT * FROM certificates WHERE user_id = ? ORDER BY issued_at DESC", [$userId]);
    }
}
