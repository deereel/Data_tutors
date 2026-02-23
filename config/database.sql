-- Data Tutors - Database Schema
-- Complete database structure for the online learning platform
-- Run this SQL to create all tables in your MySQL database

-- Create Database (if not exists)
-- CREATE DATABASE IF NOT EXISTS data_tutors;
-- USE data_tutors;

-- ============================================
-- TABLE: Users
-- ============================================
CREATE TABLE IF NOT EXISTS users (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NULL,
    avatar VARCHAR(255) NULL DEFAULT NULL,
    role ENUM('student', 'instructor', 'admin') DEFAULT 'student' NOT NULL,
    status ENUM('active', 'inactive', 'blocked') DEFAULT 'active' NOT NULL,
    email_verified TINYINT(1) DEFAULT 0 NOT NULL,
    email_token VARCHAR(100) NULL,
    password_token VARCHAR(100) NULL,
    bio TEXT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    last_login TIMESTAMP NULL,
    
    INDEX idx_email (email),
    INDEX idx_role (role),
    INDEX idx_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- TABLE: Courses
-- ============================================
CREATE TABLE IF NOT EXISTS courses (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    slug VARCHAR(200) NOT NULL UNIQUE,
    description TEXT NOT NULL,
    short_description VARCHAR(500) NULL,
    category ENUM('excel', 'data-analysis', 'automation') NOT NULL,
    level ENUM('beginner', 'intermediate', 'advanced') DEFAULT 'beginner' NOT NULL,
    thumbnail VARCHAR(255) NULL,
    preview_video VARCHAR(255) NULL,
    price DECIMAL(10, 2) DEFAULT 0.00 NOT NULL,
    currency VARCHAR(3) DEFAULT 'USD' NOT NULL,
    duration_hours DECIMAL(5, 2) NULL,
    instructor_id INT UNSIGNED NULL,
    featured TINYINT(1) DEFAULT 0 NOT NULL,
    published TINYINT(1) DEFAULT 0 NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (instructor_id) REFERENCES users(id) ON DELETE SET NULL,
    INDEX idx_category (category),
    INDEX idx_level (level),
    INDEX idx_featured (featured),
    INDEX idx_published (published),
    INDEX idx_slug (slug)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- TABLE: Modules
-- ============================================
CREATE TABLE IF NOT EXISTS modules (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    course_id INT UNSIGNED NOT NULL,
    title VARCHAR(200) NOT NULL,
    description TEXT NULL,
    order_index INT UNSIGNED DEFAULT 0 NOT NULL,
    is_published TINYINT(1) DEFAULT 0 NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    INDEX idx_course_id (course_id),
    INDEX idx_order (order_index)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- TABLE: Lessons
-- ============================================
CREATE TABLE IF NOT EXISTS lessons (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    module_id INT UNSIGNED NOT NULL,
    title VARCHAR(200) NOT NULL,
    slug VARCHAR(200) NOT NULL,
    description TEXT NULL,
    content TEXT NULL,
    video_url VARCHAR(500) NULL,
    video_duration INT UNSIGNED NULL COMMENT 'Duration in seconds',
    order_index INT UNSIGNED DEFAULT 0 NOT NULL,
    is_free TINYINT(1) DEFAULT 0 NOT NULL,
    is_published TINYINT(1) DEFAULT 0 NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (module_id) REFERENCES modules(id) ON DELETE CASCADE,
    INDEX idx_module_id (module_id),
    INDEX idx_order (order_index),
    INDEX idx_slug (slug),
    UNIQUE KEY unique_lesson_slug (module_id, slug)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- TABLE: Lesson Resources
-- ============================================
CREATE TABLE IF NOT EXISTS lesson_resources (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    lesson_id INT UNSIGNED NOT NULL,
    title VARCHAR(200) NOT NULL,
    file_path VARCHAR(500) NOT NULL,
    file_type VARCHAR(50) NULL,
    file_size INT UNSIGNED NULL,
    download_count INT UNSIGNED DEFAULT 0 NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (lesson_id) REFERENCES lessons(id) ON DELETE CASCADE,
    INDEX idx_lesson_id (lesson_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- TABLE: Enrollments
-- ============================================
CREATE TABLE IF NOT EXISTS enrollments (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    course_id INT UNSIGNED NOT NULL,
    enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    completed_at TIMESTAMP NULL,
    certificate_issued TINYINT(1) DEFAULT 0 NOT NULL,
    certificate_id VARCHAR(50) NULL,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    UNIQUE KEY unique_enrollment (user_id, course_id),
    INDEX idx_user_id (user_id),
    INDEX idx_course_id (course_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- TABLE: User Course Progress
-- ============================================
CREATE TABLE IF NOT EXISTS user_course_progress (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    course_id INT UNSIGNED NOT NULL,
    last_lesson_id INT UNSIGNED NULL,
    total_lessons_completed INT UNSIGNED DEFAULT 0 NOT NULL,
    total_lessons INT UNSIGNED DEFAULT 0 NOT NULL,
    progress_percentage DECIMAL(5, 2) DEFAULT 0.00 NOT NULL,
    started_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_accessed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    FOREIGN KEY (last_lesson_id) REFERENCES lessons(id) ON DELETE SET NULL,
    UNIQUE KEY unique_user_course_progress (user_id, course_id),
    INDEX idx_progress_percentage (progress_percentage)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- TABLE: User Lesson Progress
-- ============================================
CREATE TABLE IF NOT EXISTS user_lesson_progress (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    lesson_id INT UNSIGNED NOT NULL,
    is_completed TINYINT(1) DEFAULT 0 NOT NULL,
    completed_at TIMESTAMP NULL,
    time_spent INT UNSIGNED DEFAULT 0 COMMENT 'Time spent in seconds',
    last_position INT UNSIGNED DEFAULT 0 COMMENT 'Video position in seconds',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (lesson_id) REFERENCES lessons(id) ON DELETE CASCADE,
    UNIQUE KEY unique_user_lesson (user_id, lesson_id),
    INDEX idx_lesson_id (lesson_id),
    INDEX idx_is_completed (is_completed)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- TABLE: Quizzes
-- ============================================
CREATE TABLE IF NOT EXISTS quizzes (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    course_id INT UNSIGNED NULL,
    module_id INT UNSIGNED NULL,
    lesson_id INT UNSIGNED NULL,
    title VARCHAR(200) NOT NULL,
    description TEXT NULL,
    order_index INT UNSIGNED DEFAULT 0 NOT NULL,
    time_limit INT UNSIGNED NULL COMMENT 'Time limit in minutes',
    passing_score DECIMAL(5, 2) DEFAULT 70.00 NOT NULL,
    max_attempts INT UNSIGNED DEFAULT 0 COMMENT '0 = unlimited',
    shuffle_questions TINYINT(1) DEFAULT 1 NOT NULL,
    show_correct_answers TINYINT(1) DEFAULT 1 NOT NULL,
    is_final TINYINT(1) DEFAULT 0 NOT NULL,
    published TINYINT(1) DEFAULT 0 NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    FOREIGN KEY (module_id) REFERENCES modules(id) ON DELETE CASCADE,
    FOREIGN KEY (lesson_id) REFERENCES lessons(id) ON DELETE CASCADE,
    INDEX idx_course_id (course_id),
    INDEX idx_module_id (module_id),
    INDEX idx_lesson_id (lesson_id),
    INDEX idx_order (order_index)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- TABLE: Quiz Questions
-- ============================================
CREATE TABLE IF NOT EXISTS quiz_questions (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    quiz_id INT UNSIGNED NOT NULL,
    question_type ENUM('multiple_choice', 'true_false', 'fill_blank', 'matching') DEFAULT 'multiple_choice' NOT NULL,
    question_text TEXT NOT NULL,
    question_image VARCHAR(255) NULL,
    explanation TEXT NULL,
    points DECIMAL(5, 2) DEFAULT 1.00 NOT NULL,
    order_index INT UNSIGNED DEFAULT 0 NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (quiz_id) REFERENCES quizzes(id) ON DELETE CASCADE,
    INDEX idx_quiz_id (quiz_id),
    INDEX idx_order (order_index)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- TABLE: Quiz Options
-- ============================================
CREATE TABLE IF NOT EXISTS quiz_options (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    question_id INT UNSIGNED NOT NULL,
    option_text TEXT NOT NULL,
    option_image VARCHAR(255) NULL,
    is_correct TINYINT(1) DEFAULT 0 NOT NULL,
    order_index INT UNSIGNED DEFAULT 0 NOT NULL,
    
    FOREIGN KEY (question_id) REFERENCES quiz_questions(id) ON DELETE CASCADE,
    INDEX idx_question_id (question_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- TABLE: Quiz Results
-- ============================================
CREATE TABLE IF NOT EXISTS quiz_results (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    quiz_id INT UNSIGNED NOT NULL,
    score DECIMAL(5, 2) NOT NULL,
    total_points DECIMAL(5, 2) NOT NULL,
    percentage DECIMAL(5, 2) NOT NULL,
    passed TINYINT(1) DEFAULT 0 NOT NULL,
    time_taken INT UNSIGNED NULL COMMENT 'Time taken in seconds',
    attempt_number INT UNSIGNED DEFAULT 1 NOT NULL,
    answers JSON NULL,
    started_at TIMESTAMP NOT NULL,
    completed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (quiz_id) REFERENCES quizzes(id) ON DELETE CASCADE,
    INDEX idx_user_id (user_id),
    INDEX idx_quiz_id (quiz_id),
    INDEX idx_passed (passed)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- TABLE: Forum Categories
-- ============================================
CREATE TABLE IF NOT EXISTS forum_categories (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    course_id INT UNSIGNED NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT NULL,
    color VARCHAR(7) DEFAULT '#2563eb' NOT NULL,
    icon VARCHAR(50) NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    INDEX idx_course_id (course_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- TABLE: Forum Questions
-- ============================================
CREATE TABLE IF NOT EXISTS forum_questions (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    course_id INT UNSIGNED NULL,
    category_id INT UNSIGNED NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    views INT UNSIGNED DEFAULT 0 NOT NULL,
    is_pinned TINYINT(1) DEFAULT 0 NOT NULL,
    is_locked TINYINT(1) DEFAULT 0 NOT NULL,
    is_resolved TINYINT(1) DEFAULT 0 NOT NULL,
    is_deleted TINYINT(1) DEFAULT 0 NOT NULL,
    deleted_reason TEXT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE SET NULL,
    FOREIGN KEY (category_id) REFERENCES forum_categories(id) ON DELETE SET NULL,
    INDEX idx_user_id (user_id),
    INDEX idx_course_id (course_id),
    INDEX idx_category_id (category_id),
    INDEX idx_is_pinned (is_pinned),
    INDEX idx_is_resolved (is_resolved),
    INDEX idx_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- TABLE: Forum Answers
-- ============================================
CREATE TABLE IF NOT EXISTS forum_answers (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    question_id INT UNSIGNED NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    parent_answer_id INT UNSIGNED NULL,
    content TEXT NOT NULL,
    is_accepted TINYINT(1) DEFAULT 0 NOT NULL,
    is_deleted TINYINT(1) DEFAULT 0 NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (question_id) REFERENCES forum_questions(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (parent_answer_id) REFERENCES forum_answers(id) ON DELETE CASCADE,
    INDEX idx_question_id (question_id),
    INDEX idx_user_id (user_id),
    INDEX idx_is_accepted (is_accepted)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- TABLE: Forum Votes
-- ============================================
CREATE TABLE IF NOT EXISTS forum_votes (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    question_id INT UNSIGNED NULL,
    answer_id INT UNSIGNED NULL,
    vote_type ENUM('up', 'down') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES forum_questions(id) ON DELETE CASCADE,
    FOREIGN KEY (answer_id) REFERENCES forum_answers(id) ON DELETE CASCADE,
    UNIQUE KEY unique_vote (user_id, question_id, answer_id),
    INDEX idx_question_id (question_id),
    INDEX idx_answer_id (answer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- TABLE: Payments
-- ============================================
CREATE TABLE IF NOT EXISTS payments (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    course_id INT UNSIGNED NULL,
    amount DECIMAL(10, 2) NOT NULL,
    currency VARCHAR(3) DEFAULT 'USD' NOT NULL,
    payment_method ENUM('paystack', 'bank_transfer', 'free') DEFAULT 'paystack' NOT NULL,
    transaction_id VARCHAR(100) NULL,
    paystack_reference VARCHAR(100) NULL,
    paystack_customer_id VARCHAR(100) NULL,
    status ENUM('pending', 'processing', 'completed', 'failed', 'refunded') DEFAULT 'pending' NOT NULL,
    payment_type ENUM('course', 'subscription', 'certificate') DEFAULT 'course' NOT NULL,
    metadata JSON NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE SET NULL,
    INDEX idx_user_id (user_id),
    INDEX idx_course_id (course_id),
    INDEX idx_transaction_id (transaction_id),
    INDEX idx_paystack_reference (paystack_reference),
    INDEX idx_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- TABLE: Certificates
-- ============================================
CREATE TABLE IF NOT EXISTS certificates (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    course_id INT UNSIGNED NOT NULL,
    certificate_id VARCHAR(50) NOT NULL UNIQUE,
    student_name VARCHAR(200) NOT NULL,
    course_name VARCHAR(200) NOT NULL,
    completion_date DATE NOT NULL,
    grade VARCHAR(10) NULL,
    final_score DECIMAL(5, 2) NULL,
    certificate_path VARCHAR(500) NULL,
    verification_url VARCHAR(500) NULL,
    issued_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    UNIQUE KEY unique_user_course_certificate (user_id, course_id),
    INDEX idx_certificate_id (certificate_id),
    INDEX idx_user_id (user_id),
    INDEX idx_course_id (course_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- TABLE: Notifications
-- ============================================
CREATE TABLE IF NOT EXISTS notifications (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    type ENUM('course', 'lesson', 'quiz', 'forum', 'payment', 'system') NOT NULL,
    title VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    link VARCHAR(500) NULL,
    is_read TINYINT(1) DEFAULT 0 NOT NULL,
    read_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_user_id (user_id),
    INDEX idx_is_read (is_read),
    INDEX idx_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- TABLE: Activity Log
-- ============================================
CREATE TABLE IF NOT EXISTS activity_log (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NULL,
    action VARCHAR(100) NOT NULL,
    entity_type VARCHAR(50) NULL,
    entity_id INT UNSIGNED NULL,
    old_data JSON NULL,
    new_data JSON NULL,
    ip_address VARCHAR(45) NULL,
    user_agent TEXT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    INDEX idx_user_id (user_id),
    INDEX idx_action (action),
    INDEX idx_entity (entity_type, entity_id),
    INDEX idx_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- TABLE: Settings
-- ============================================
CREATE TABLE IF NOT EXISTS settings (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `key` VARCHAR(100) NOT NULL UNIQUE,
    value TEXT NULL,
    type ENUM('string', 'integer', 'boolean', 'json') DEFAULT 'string' NOT NULL,
    description VARCHAR(255) NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- SAMPLE DATA: Insert default settings
-- ============================================
INSERT INTO settings (`key`, value, type, description) VALUES
('site_name', 'Data Tutors', 'string', 'Site name'),
('site_description', 'Master Excel, Data Analysis, and Data Automation', 'string', 'Site description'),
('contact_email', 'info@datatutors.com', 'string', 'Contact email'),
('default_currency', 'USD', 'string', 'Default currency'),
('tax_percentage', '0', 'integer', 'Tax percentage for payments'),
('certificate_validity_years', '0', 'integer', 'Certificate validity (0 = lifetime)'),
('max_login_attempts', '5', 'integer', 'Maximum login attempts before lockout'),
('password_reset_expiry', '60', 'integer', 'Password reset link expiry in minutes'),
('email_verification_required', '1', 'boolean', 'Require email verification'),
('maintenance_mode', '0', 'boolean', 'Site in maintenance mode')
ON DUPLICATE KEY UPDATE value = VALUES(value);

-- ============================================
-- SAMPLE DATA: Insert default forum categories
-- ============================================
INSERT INTO forum_categories (name, description, color, icon) VALUES
('General', 'General discussions about the platform', '#2563eb', 'message-circle'),
('Excel', 'Questions about Excel courses', '#10b981', 'table'),
('Data Analysis', 'Discussions about data analysis', '#8b5cf6', 'bar-chart'),
('Data Automation', 'Automation tools and techniques', '#f59e0b', 'zap')
ON DUPLICATE KEY UPDATE name = VALUES(name);

-- ============================================
-- SAMPLE DATA: Insert courses
-- ============================================
INSERT INTO courses (title, slug, description, short_description, category, level, price, duration_hours, featured, published) VALUES
('Excel Mastery: From Beginner to Advanced', 'excel-mastery', 'Master Microsoft Excel from basics to advanced features. Learn formulas, pivot tables, charts, and macros to become proficient in Excel.', 'Complete Excel course from basics to advanced', 'excel', 'beginner', 49.00, 20.00, 1, 1)
ON DUPLICATE KEY UPDATE title = VALUES(title);

INSERT INTO courses (title, slug, description, short_description, category, level, price, duration_hours, featured, published) VALUES
('Data Analysis Fundamentals', 'data-analysis-fundamentals', 'Learn data analysis from scratch using Excel, SQL, Python, and Power BI. Transform raw data into actionable insights.', 'Master data analysis with Excel, SQL, Python & Power BI', 'data-analysis', 'beginner', 79.00, 35.00, 1, 1)
ON DUPLICATE KEY UPDATE title = VALUES(title);

INSERT INTO courses (title, slug, description, short_description, category, level, price, duration_hours, featured, published) VALUES
('Data Automation Mastery', 'data-automation-mastery', 'Automate your workflows with Zapier, Make.com, Airtable, and N8N. Save time and increase productivity.', 'Automate workflows with Zapier, Make, Airtable & N8N', 'automation', 'intermediate', 69.00, 25.00, 1, 1)
ON DUPLICATE KEY UPDATE title = VALUES(title);

-- ============================================
-- SAMPLE DATA: Insert modules for Excel course
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Getting Started with Excel', 'Learn the basics of Excel interface and navigation', 1, 1),
(1, 'Working with Data', 'Learn how to enter, format, and organize data', 2, 1),
(1, 'Formulas and Functions', 'Master Excel formulas and functions', 3, 1),
(1, 'Data Analysis Tools', 'Learn pivot tables, charts, and data analysis', 4, 1),
(1, 'Advanced Features', 'Macros, VBA, and automation', 5, 1)
ON DUPLICATE KEY UPDATE title = VALUES(title);

-- ============================================
-- SAMPLE DATA: Insert modules for Data Analysis course
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(2, 'Introduction to Data Analysis', 'Understanding the fundamentals of data analysis', 1, 1),
(2, 'Excel for Data Analysis', 'Advanced Excel techniques for data analysis', 2, 1),
(2, 'SQL Fundamentals', 'Learn to query and manipulate databases', 3, 1),
(2, 'Python for Data Analysis', 'Introduction to Python and Pandas', 4, 1),
(2, 'Power BI Visualization', 'Create stunning visualizations with Power BI', 5, 1)
ON DUPLICATE KEY UPDATE title = VALUES(title);

-- ============================================
-- SAMPLE DATA: Insert modules for Data Automation course
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(3, 'Introduction to Automation', 'Understanding workflow automation concepts', 1, 1),
(3, 'Zapier Mastery', 'Automate tasks with Zapier', 2, 1),
(3, 'Make.com (Integromat)', 'Create complex automation scenarios', 3, 1),
(3, 'Airtable Databases', 'Build databases and automate workflows', 4, 1),
(3, 'N8N Workflow Automation', 'Self-hosted automation with N8N', 5, 1)
ON DUPLICATE KEY UPDATE title = VALUES(title);

-- ============================================
-- SAMPLE DATA: Insert lessons for Module 1
-- ============================================
INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(1, 'Introduction to Excel', 'introduction-to-excel', 'Get started with Microsoft Excel', 'Welcome to Excel Mastery! In this lesson, we will explore the Excel interface and learn how to navigate effectively.', 'https://www.youtube.com/watch?v=qnINx17Jv4w', 600, 1, 1, 1),
(1, 'The Excel Interface', 'excel-interface', 'Understanding the Excel ribbon and toolbar', 'Learn about the Excel ribbon, toolbar, and how to customize your workspace.', 'https://www.youtube.com/watch?v=example1', 480, 2, 1, 1),
(1, 'Creating Your First Workbook', 'creating-first-workbook', 'Create and save your first workbook', 'Let\'s create your first Excel workbook and learn about cells, rows, and columns.', 'https://www.youtube.com/watch?v=example2', 720, 3, 0, 1),
(1, 'Essential Shortcuts', 'essential-shortcuts', 'Keyboard shortcuts for efficiency', 'Master the most important Excel keyboard shortcuts to boost your productivity.', 'https://www.youtube.com/watch?v=example3', 540, 4, 0, 1),
(1, 'Module 1 Quiz', 'module-1-quiz', 'Test your knowledge of Excel basics', 'Test what you have learned in Module 1.', '', 300, 5, 0, 1)
ON DUPLICATE KEY UPDATE title = VALUES(title);

-- ============================================
-- SAMPLE DATA: Insert lessons for Data Analysis - Module 1 (IGNORE to skip duplicates)
-- ============================================
INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(6, 'What is Data Analysis?', 'what-is-data-analysis', 'Understanding the importance of data analysis', 'Data analysis is the process of inspecting, cleansing, transforming, and modeling data to discover useful information, draw conclusions, and support decision-making.', 'https://www.youtube.com/watch?v=daEDA', 480, 1, 1, 1),
(6, 'Types of Data', 'types-of-data', 'Understanding qualitative and quantitative data', 'Learn about different types of data and how to classify them for analysis.', 'https://www.youtube.com/watch?v=example-dq', 420, 2, 1, 1),
(6, 'Data Collection Methods', 'data-collection-methods', 'How to gather data effectively', 'Explore various methods for collecting data for your analysis projects.', 'https://www.youtube.com/watch?v=example-dq2', 540, 3, 0, 1),
(6, 'Data Cleaning Basics', 'data-cleaning-basics', 'Preparing your data for analysis', 'Learn essential data cleaning techniques to ensure accurate results.', 'https://www.youtube.com/watch?v=example-dq3', 600, 4, 0, 1),
(6, 'Module 1 Quiz', 'data-analysis-module-1-quiz', 'Test your understanding of data analysis fundamentals', 'Test what you have learned in Module 1.', '', 300, 5, 0, 1);

-- ============================================
-- SAMPLE DATA: Insert lessons for Data Analysis - Module 2 (IGNORE to skip duplicates)
-- ============================================
INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(7, 'Advanced Excel Formulas', 'advanced-excel-formulas', 'Master complex Excel formulas', 'Learn advanced formulas like VLOOKUP, INDEX-MATCH, and array formulas.', 'https://www.youtube.com/watch?v=example-ex1', 720, 1, 1, 1),
(7, 'Pivot Tables Deep Dive', 'pivot-tables-deep-dive', 'Advanced pivot table techniques', 'Master pivot tables for powerful data analysis and reporting.', 'https://www.youtube.com/watch?v=example-ex2', 600, 2, 1, 1),
(7, 'Power Query', 'power-query', 'Data transformation with Power Query', 'Learn to use Power Query for advanced data transformation.', 'https://www.youtube.com/watch?v=example-ex3', 540, 3, 0, 1),
(7, 'Data Validation', 'data-validation', 'Ensuring data quality', 'Use data validation to control input quality in your spreadsheets.', 'https://www.youtube.com/watch?v=example-ex4', 420, 4, 0, 1),
(7, 'Module 2 Quiz', 'data-analysis-module-2-quiz', 'Test your Excel skills', 'Test what you have learned in Module 2.', '', 300, 5, 0, 1);

-- ============================================
-- SAMPLE DATA: Insert lessons for Data Analysis - Module 3 (IGNORE to skip duplicates)
-- ============================================
INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(8, 'Introduction to SQL', 'introduction-to-sql', 'Getting started with SQL', 'Learn the basics of SQL and database querying.', 'https://www.youtube.com/watch?v=example-sql1', 600, 1, 1, 1),
(8, 'SELECT Statements', 'select-statements', 'Retrieving data with SELECT', 'Master the SELECT statement to query databases effectively.', 'https://www.youtube.com/watch?v=example-sql2', 480, 2, 1, 1),
(8, 'Filtering and Sorting', 'filtering-and-sorting', 'WHERE and ORDER BY clauses', 'Learn to filter and sort your query results.', 'https://www.youtube.com/watch?v=example-sql3', 420, 3, 0, 1),
(8, 'JOIN Operations', 'join-operations', 'Combining data from multiple tables', 'Master INNER JOIN, LEFT JOIN, and other join types.', 'https://www.youtube.com/watch?v=example-sql4', 720, 4, 0, 1),
(8, 'Module 3 Quiz', 'data-analysis-module-3-quiz', 'Test your SQL skills', 'Test what you have learned in Module 3.', '', 300, 5, 0, 1);

-- ============================================
-- SAMPLE DATA: Insert lessons for Data Analysis - Module 4 (IGNORE to skip duplicates)
-- ============================================
INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(9, 'Python Basics', 'python-basics', 'Introduction to Python programming', 'Learn the fundamentals of Python for data analysis.', 'https://www.youtube.com/watch?v=example-py1', 720, 1, 1, 1),
(9, 'Pandas Fundamentals', 'pandas-fundamentals', 'Working with Pandas DataFrames', 'Master the Pandas library for data manipulation.', 'https://www.youtube.com/watch?v=example-py2', 600, 2, 1, 1),
(9, 'Data Cleaning with Python', 'data-cleaning-python', 'Cleaning data using Python', 'Learn advanced data cleaning techniques with Python.', 'https://www.youtube.com/watch?v=example-py3', 540, 3, 0, 1),
(9, 'Data Visualization with Python', 'data-visualization-python', 'Creating charts with Matplotlib', 'Visualize your data using Python libraries.', 'https://www.youtube.com/watch?v=example-py4', 480, 4, 0, 1),
(9, 'Module 4 Quiz', 'data-analysis-module-4-quiz', 'Test your Python skills', 'Test what you have learned in Module 4.', '', 300, 5, 0, 1);

-- ============================================
-- SAMPLE DATA: Insert lessons for Data Analysis - Module 5 (IGNORE to skip duplicates)
-- ============================================
INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(10, 'Introduction to Power BI', 'introduction-to-power-bi', 'Getting started with Power BI', 'Learn the basics of Power BI for data visualization.', 'https://www.youtube.com/watch?v=example-pbi1', 600, 1, 1, 1),
(10, 'Power BI Desktop', 'power-bi-desktop', 'Using Power BI Desktop', 'Create reports and dashboards with Power BI Desktop.', 'https://www.youtube.com/watch?v=example-pbi2', 720, 2, 1, 1),
(10, 'DAX Formulas', 'dax-formulas', 'Power BI DAX formulas', 'Master DAX for calculated columns and measures.', 'https://www.youtube.com/watch?v=example-pbi3', 540, 3, 0, 1),
(10, 'Power BI Service', 'power-bi-service', 'Publishing and sharing reports', 'Publish and share your reports on Power BI Service.', 'https://www.youtube.com/watch?v=example-pbi4', 480, 4, 0, 1),
(10, 'Final Exam', 'data-analysis-final-exam', 'Comprehensive final exam', 'Demonstrate your mastery of data analysis concepts.', '', 600, 5, 0, 1);

-- ============================================
-- SAMPLE DATA: Insert lessons for Data Automation - Module 1 (IGNORE to skip duplicates)
-- ============================================
INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(11, 'What is Automation?', 'what-is-automation', 'Understanding workflow automation', 'Learn the fundamentals of automation and why it matters for businesses.', 'https://www.youtube.com/watch?v=example-auto1', 480, 1, 1, 1),
(11, 'Benefits of Automation', 'benefits-of-automation', 'Why automate your workflows', 'Discover the key benefits of implementing automation.', 'https://www.youtube.com/watch?v=example-auto2', 420, 2, 1, 1),
(11, 'Automation Tools Overview', 'automation-tools-overview', 'Comparing automation platforms', 'An overview of popular automation tools available.', 'https://www.youtube.com/watch?v=example-auto3', 540, 3, 0, 1),
(11, 'Planning Your Automation', 'planning-your-automation', 'Strategy for automation success', 'Learn how to identify tasks worth automating.', 'https://www.youtube.com/watch?v=example-auto4', 360, 4, 0, 1),
(11, 'Module 1 Quiz', 'automation-module-1-quiz', 'Test your automation knowledge', 'Test what you have learned in Module 1.', '', 300, 5, 0, 1);

-- ============================================
-- SAMPLE DATA: Insert lessons for Data Automation - Module 2 (IGNORE to skip duplicates)
-- ============================================
INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(12, 'Getting Started with Zapier', 'getting-started-with-zapier', 'Introduction to Zapier', 'Learn the basics of Zapier and how to create your first zap.', 'https://www.youtube.com/watch?v=example-zap1', 600, 1, 1, 1),
(12, 'Zapier Triggers and Actions', 'zapier-triggers-actions', 'Understanding triggers and actions', 'Master the core concepts of triggers and actions in Zapier.', 'https://www.youtube.com/watch?v=example-zap2', 480, 2, 1, 1),
(12, 'Popular Zapier Integrations', 'popular-zapier-integrations', 'Top integrations to use', 'Explore the most popular and useful Zapier integrations.', 'https://www.youtube.com/watch?v=example-zap3', 540, 3, 0, 1),
(12, 'Multi-Step Zaps', 'multi-step-zaps', 'Creating complex workflows', 'Build advanced automation with multi-step zaps.', 'https://www.youtube.com/watch?v=example-zap4', 600, 4, 0, 1),
(12, 'Module 2 Quiz', 'automation-module-2-quiz', 'Test your Zapier skills', 'Test what you have learned in Module 2.', '', 300, 5, 0, 1);

-- ============================================
-- SAMPLE DATA: Insert lessons for Data Automation - Module 3 (IGNORE to skip duplicates)
-- ============================================
INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(13, 'Introduction to Make.com', 'introduction-to-make', 'Getting started with Make', 'Learn the basics of Make.com (formerly Integromat).', 'https://www.youtube.com/watch?v=example-make1', 600, 1, 1, 1),
(13, 'Make.com Scenarios', 'make-scenarios', 'Building automation scenarios', 'Create powerful automation scenarios with Make.', 'https://www.youtube.com/watch?v=example-make2', 540, 2, 1, 1),
(13, 'Modules and Modules', 'make-modules', 'Using Make modules', 'Master the various modules available in Make.', 'https://www.youtube.com/watch?v=example-make3', 480, 3, 0, 1),
(13, 'Error Handling', 'make-error-handling', 'Handling errors in automation', 'Learn how to handle errors in your Make scenarios.', 'https://www.youtube.com/watch?v=example-make4', 420, 4, 0, 1),
(13, 'Module 3 Quiz', 'automation-module-3-quiz', 'Test your Make.com skills', 'Test what you have learned in Module 3.', '', 300, 5, 0, 1);

-- ============================================
-- SAMPLE DATA: Insert lessons for Data Automation - Module 4 (IGNORE to skip duplicates)
-- ============================================
INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(14, 'Getting Started with Airtable', 'getting-started-with-airtable', 'Introduction to Airtable', 'Learn the basics of Airtable databases.', 'https://www.youtube.com/watch?v=example-air1', 600, 1, 1, 1),
(14, 'Airtable Bases and Tables', 'airtable-bases-tables', 'Organizing data in Airtable', 'Master the structure of Airtable bases and tables.', 'https://www.youtube.com/watch?v=example-air2', 480, 2, 1, 1),
(14, 'Automations in Airtable', 'airtable-automations', 'Built-in automation features', 'Use Airtable\'s built-in automation capabilities.', 'https://www.youtube.com/watch?v=example-air3', 540, 3, 0, 1),
(14, 'Airtable Integrations', 'airtable-integrations', 'Connecting with other tools', 'Integrate Airtable with other platforms.', 'https://www.youtube.com/watch?v=example-air4', 420, 4, 0, 1),
(14, 'Module 4 Quiz', 'automation-module-4-quiz', 'Test your Airtable skills', 'Test what you have learned in Module 4.', '', 300, 5, 0, 1);

-- ============================================
-- SAMPLE DATA: Insert lessons for Data Automation - Module 5 (IGNORE to skip duplicates)
-- ============================================
INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(15, 'Introduction to N8N', 'introduction-to-n8n', 'Getting started with N8N', 'Learn about N8N and self-hosted automation.', 'https://www.youtube.com/watch?v=example-n8n1', 600, 1, 1, 1),
(15, 'N8N Workflows', 'n8n-workflows', 'Building N8N workflows', 'Create automation workflows with N8N.', 'https://www.youtube.com/watch?v=example-n8n2', 540, 2, 1, 1),
(15, 'N8N Nodes', 'n8n-nodes', 'Using N8N nodes', 'Master the various nodes available in N8N.', 'https://www.youtube.com/watch?v=example-n8n3', 480, 3, 0, 1),
(15, 'Self-Hosting N8N', 'self-hosting-n8n', 'Setting up your own N8N instance', 'Install and configure your own N8N server.', 'https://www.youtube.com/watch?v=example-n8n4', 600, 4, 0, 1),
(15, 'Final Exam', 'automation-final-exam', 'Comprehensive final exam', 'Demonstrate your mastery of automation concepts.', '', 600, 5, 0, 1);

-- ============================================
-- SAMPLE DATA: Insert quizzes for all courses (IGNORE to skip duplicates)
-- ============================================

-- Excel Course Quizzes
INSERT IGNORE INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(1, 1, 5, 'Excel Basics Quiz', 'Test your understanding of Excel fundamentals', 10, 70.00, 0, 1),
(1, 2, 5, 'Working with Data Quiz', 'Test your data entry and formatting skills', 10, 70.00, 0, 1),
(1, 3, 5, 'Formulas Quiz', 'Test your Excel formulas knowledge', 15, 70.00, 0, 1),
(1, 4, 5, 'Data Analysis Quiz', 'Test your pivot tables and charts skills', 15, 70.00, 0, 1),
(1, 5, 5, 'Excel Final Exam', 'Comprehensive final exam for Excel Mastery', 30, 70.00, 1, 1);

-- Data Analysis Course Quizzes
INSERT IGNORE INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(2, 6, 5, 'Data Analysis Fundamentals Quiz', 'Test your understanding of data analysis basics', 10, 70.00, 0, 1),
(2, 7, 5, 'Excel for Data Analysis Quiz', 'Test your advanced Excel skills', 15, 70.00, 0, 1),
(2, 8, 5, 'SQL Fundamentals Quiz', 'Test your SQL querying skills', 15, 70.00, 0, 1),
(2, 9, 5, 'Python for Data Analysis Quiz', 'Test your Python and Pandas skills', 15, 70.00, 0, 1),
(2, 10, 5, 'Data Analysis Final Exam', 'Comprehensive final exam for Data Analysis', 45, 70.00, 1, 1);

-- Data Automation Course Quizzes
INSERT IGNORE INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(3, 11, 5, 'Automation Fundamentals Quiz', 'Test your automation concepts', 10, 70.00, 0, 1),
(3, 12, 5, 'Zapier Quiz', 'Test your Zapier automation skills', 15, 70.00, 0, 1),
(3, 13, 5, 'Make.com Quiz', 'Test your Make.com automation skills', 15, 70.00, 0, 1),
(3, 14, 5, 'Airtable Quiz', 'Test your Airtable and automation skills', 15, 70.00, 0, 1),
(3, 15, 5, 'Automation Final Exam', 'Comprehensive final exam for Data Automation', 45, 70.00, 1, 1);

-- ============================================
-- SAMPLE DATA: Insert quiz questions for Excel Basics Quiz (IGNORE to skip duplicates)
-- ============================================
INSERT IGNORE INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(1, 'multiple_choice', 'What is the intersection of a row and column called in Excel?', 'The intersection of a row and column is called a cell.', 1.00, 1),
(1, 'multiple_choice', 'Which keyboard shortcut is used to create a new workbook?', 'Ctrl+N is the shortcut for creating a new workbook.', 1.00, 2),
(1, 'true_false', 'Excel can only handle numerical data.', 'Excel can handle both numerical and text data.', 1.00, 3),
(1, 'multiple_choice', 'What file extension is used for Excel workbooks by default?', '.xlsx is the default file extension for Excel workbooks.', 1.00, 4);

-- ============================================
-- SAMPLE DATA: Insert quiz options (IGNORE to skip duplicates)
-- ============================================
INSERT IGNORE INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(1, 'Cell', 1, 1),
(1, 'Row', 0, 2),
(1, 'Column', 0, 3),
(1, 'Range', 0, 4),
(2, 'Ctrl+N', 1, 1),
(2, 'Ctrl+C', 0, 2),
(2, 'Ctrl+O', 0, 3),
(2, 'Ctrl+P', 0, 4),
(3, 'True', 0, 1),
(3, 'False', 1, 2),
(4, '.xlsx', 1, 1),
(4, '.docx', 0, 2),
(4, '.pptx', 0, 3),
(4, '.xls', 0, 4);
