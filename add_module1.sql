-- ============================================
-- Module 1: Getting Started with Excel
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Getting Started with Excel', 'Learn the basics of Excel interface and navigation', 1, 1);

SET @module1_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module1_id, 'Introduction to Excel', 'introduction-to-excel', 'Get started with Microsoft Excel', 'Welcome to Excel Mastery! In this lesson, we will explore the Excel interface and learn how to navigate effectively.', 'https://www.youtube.com/watch?v=qnINx17Jv4w', 600, 1, 1, 1),
(@module1_id, 'The Excel Interface', 'excel-interface', 'Understanding the Excel ribbon and toolbar', 'Learn about the Excel ribbon, toolbar, and how to customize your workspace.', 'https://www.youtube.com/watch?v=example1', 480, 2, 1, 1),
(@module1_id, 'Creating Your First Workbook', 'creating-first-workbook', 'Create and save your first workbook', 'Let\'s create your first Excel workbook and learn about cells, rows, and columns.', 'https://www.youtube.com/watch?v=example2', 720, 3, 0, 1),
(@module1_id, 'Essential Shortcuts', 'essential-shortcuts', 'Keyboard shortcuts for efficiency', 'Master the most important Excel keyboard shortcuts to boost your productivity.', 'https://www.youtube.com/watch?v=example3', 540, 4, 0, 1),
(@module1_id, 'Module 1 Quiz', 'module-1-quiz', 'Test your knowledge of Excel basics', 'Test what you have learned in Module 1.', '', 300, 5, 0, 1);

-- Quiz for Module 1
SET @lesson1_quiz_id = (SELECT id FROM lessons WHERE module_id = @module1_id AND order_index = 5);
INSERT INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(1, @module1_id, @lesson1_quiz_id, 'Excel Basics Quiz', 'Test your understanding of Excel fundamentals', 10, 70.00, 0, 1);
