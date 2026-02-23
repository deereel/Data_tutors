-- Excel Course - Cleanup Duplicates Script
-- Run this to remove duplicate modules and keep only one set

-- First, get the Excel course ID
SET @excel_course_id = (SELECT id FROM courses WHERE slug = 'excel-mastery' LIMIT 1);
SELECT CONCAT('Excel Course ID: ', @excel_course_id) AS info;

-- ============================================
-- STEP 1: Find and keep only the first module for each title
-- ============================================

-- Create a temporary table with modules to DELETE (duplicates)
CREATE TEMPORARY TABLE IF NOT EXISTS modules_to_delete AS
SELECT m1.id 
FROM modules m1
INNER JOIN modules m2 
    ON m1.course_id = m2.course_id 
    AND m1.title = m2.title 
    AND m1.id > m2.id
WHERE m1.course_id = @excel_course_id;

-- Show modules that will be deleted
SELECT m.id, m.title, m.order_index, 'TO DELETE' AS status
FROM modules m
INNER JOIN modules m2 
    ON m.course_id = m2.course_id 
    AND m.title = m2.title 
    AND m.id > m2.id
WHERE m.course_id = @excel_course_id
ORDER BY m.title, m.id;

-- Delete lessons associated with duplicate modules
DELETE l FROM lessons l
INNER JOIN modules_to_delete mtd ON l.module_id = mtd.id;

-- Delete quizzes associated with duplicate modules
DELETE q FROM quizzes q
INNER JOIN modules_to_delete mtd ON q.module_id = mtd.id;

-- Delete duplicate modules
DELETE FROM modules WHERE id IN (SELECT id FROM modules_to_delete);

-- ============================================
-- STEP 2: Reset order_index to be sequential (1-12)
-- ============================================

-- Get the current modules and their IDs
SELECT id, title, order_index FROM modules WHERE course_id = @excel_course_id ORDER BY order_index;

-- Update order_index sequentially
SET @rank := 0;
UPDATE modules 
SET order_index = (@rank := @rank + 1)
WHERE course_id = @excel_course_id
ORDER BY order_index;

-- ============================================
-- STEP 3: Reset lesson order_index within each module
-- ============================================

-- Reset lesson order for each module
SELECT 
    m.id AS module_id,
    m.title AS module_title,
    COUNT(l.id) AS lesson_count
FROM modules m
LEFT JOIN lessons l ON m.id = l.module_id
WHERE m.course_id = @excel_course_id
GROUP BY m.id, m.title
ORDER BY m.order_index;

-- ============================================
-- STEP 4: Verify the result
-- ============================================

SELECT 
    m.id,
    m.title,
    m.order_index AS module_order,
    (SELECT COUNT(*) FROM lessons WHERE module_id = m.id) AS lesson_count
FROM modules m
WHERE m.course_id = @excel_course_id
ORDER BY m.order_index;

SELECT 'Cleanup complete! Duplicates removed.' AS result;
