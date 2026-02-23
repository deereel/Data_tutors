-- Excel Course - Complete Lesson Structure (Ordered)
-- Based on provided curriculum with 12 modules

-- First, get the course ID
SET @excel_course_id = (SELECT id FROM courses WHERE slug = 'excel-mastery' LIMIT 1);

-- If course doesn't exist, create it first
INSERT IGNORE INTO courses (title, slug, description, short_description, category, level, price, duration_hours, published)
VALUES (
    'Excel Mastery: Complete Excel Course',
    'excel-mastery',
    'Master Excel from beginner to advanced level. Learn formulas, functions, PivotTables, dashboards, and more.',
    'Complete Excel course from basics to advanced',
    'excel',
    'beginner',
    49.99,
    20.00,
    1
);

SET @excel_course_id = (SELECT id FROM courses WHERE slug = 'excel-mastery' LIMIT 1);

-- ============================================
-- MODULE 1: Getting Started with Excel
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published)
VALUES (@excel_course_id, 'Getting Started with Excel', 'Learn the basics of Excel and navigate the interface', 1, 1);

SET @module_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module_id, 'Introduction to Excel', 'introduction-to-excel', 'Learn what Excel is and its basic capabilities.', 'Learn what Excel is and its basic capabilities.', 'https://youtube.com/watch?v=example1', 600, 1, 1, 1),
(@module_id, 'The Excel Interface', 'the-excel-interface', 'Navigate the Excel interface including ribbon, formula bar, and status bar.', 'Navigate the Excel interface including ribbon, formula bar, and status bar.', 'https://youtube.com/watch?v=example2', 480, 2, 1, 1),
(@module_id, 'Creating Your First Workbook', 'creating-your-first-workbook', 'Create, save, and manage Excel workbooks effectively.', 'Create, save, and manage Excel workbooks effectively.', 'https://youtube.com/watch?v=example3', 720, 3, 0, 1),
(@module_id, 'Essential Shortcuts', 'essential-shortcuts', 'Master keyboard shortcuts for faster workflow.', 'Master keyboard shortcuts for faster workflow.', 'https://youtube.com/watch?v=example4', 540, 4, 0, 1);

-- Module 1 Quiz
INSERT INTO quizzes (module_id, title, description, time_limit, passing_score, published)
VALUES (@module_id, 'Module 1 Quiz', 'Test your knowledge of Excel basics', 10, 70.00, 1);

-- ============================================
-- MODULE 2: Working with Data
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published)
VALUES (@excel_course_id, 'Working with Data', 'Master data entry, formatting, and basic manipulation', 2, 1);

SET @module_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module_id, 'Understanding Rows, Columns & Cells', 'understanding-rows-columns-cells', 'Learn the structure of Excel worksheets.', 'Learn the structure of Excel worksheets.', 'https://youtube.com/watch?v=example5', 600, 1, 1, 1),
(@module_id, 'Data Types (Text, Numbers, Dates)', 'data-types-text-numbers-dates', 'Understand different data types in Excel.', 'Understand different data types in Excel.', 'https://youtube.com/watch?v=example6', 720, 2, 1, 1),
(@module_id, 'Formatting Cells (Fonts, Colors, Borders)', 'formatting-cells-fonts-colors-borders', 'Apply cell formatting for better presentation.', 'Apply cell formatting for better presentation.', 'https://youtube.com/watch?v=example7', 900, 3, 0, 1),
(@module_id, 'Number Formatting (Currency, Percentages)', 'number-formatting-currency-percentages', 'Format numbers with various styles.', 'Format numbers with various styles.', 'https://youtube.com/watch?v=example8', 600, 4, 0, 1),
(@module_id, 'Adjusting Column Width & Row Height', 'adjusting-column-width-row-height', 'Resize rows and columns for better visibility.', 'Resize rows and columns for better visibility.', 'https://youtube.com/watch?v=example9', 480, 5, 0, 1),
(@module_id, 'Copy, Paste & Autofill', 'copy-paste-autofill', 'Master copy-paste and autofill features.', 'Master copy-paste and autofill features.', 'https://youtube.com/watch?v=example10', 720, 6, 0, 1),
(@module_id, 'Flash Fill', 'flash-fill', 'Use Flash Fill for automatic data formatting.', 'Use Flash Fill for automatic data formatting.', 'https://youtube.com/watch?v=example11', 600, 7, 0, 1),
(@module_id, 'Sorting Data', 'sorting-data', 'Sort data alphabetically and numerically.', 'Sort data alphabetically and numerically.', 'https://youtube.com/watch?v=example12', 600, 8, 0, 1),
(@module_id, 'Basic Filtering', 'basic-filtering', 'Filter data to show specific records.', 'Filter data to show specific records.', 'https://youtube.com/watch?v=example13', 720, 9, 0, 1);

-- Module 2 Quiz
INSERT INTO quizzes (module_id, title, description, time_limit, passing_score, published)
VALUES (@module_id, 'Module 2 Quiz', 'Test your data handling skills', 10, 70.00, 1);

-- Mini Project: Monthly Expense Tracker
INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published)
VALUES (@module_id, 'Mini Project: Monthly Expense Tracker', 'mini-project-monthly-expense-tracker', 'Create a monthly expense tracker with all the skills you learned in this module.', 'Create a monthly expense tracker with all the skills you learned in this module.', 'https://youtube.com/watch?v=example14', 2700, 10, 0, 1);

-- ============================================
-- MODULE 3: Basic Formulas
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published)
VALUES (@excel_course_id, 'Basic Formulas', 'Learn to write and use formulas in Excel', 3, 1);

SET @module_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module_id, 'Writing Your First Formula', 'writing-your-first-formula', 'Learn the basics of writing formulas.', 'Learn the basics of writing formulas.', 'https://youtube.com/watch?v=example15', 720, 1, 1, 1),
(@module_id, 'Arithmetic Operators (+ - * /)', 'arithmetic-operators', 'Use arithmetic operators in calculations.', 'Use arithmetic operators in calculations.', 'https://youtube.com/watch?v=example16', 900, 2, 0, 1),
(@module_id, 'Relative vs Absolute References', 'relative-vs-absolute-references', 'Understand cell references and their differences.', 'Understand cell references and their differences.', 'https://youtube.com/watch?v=example17', 900, 3, 0, 1),
(@module_id, 'AutoSum', 'autosum', 'Quickly sum data with AutoSum.', 'Quickly sum data with AutoSum.', 'https://youtube.com/watch?v=example18', 480, 4, 0, 1),
(@module_id, 'Common Errors (#VALUE!, #DIV/0!)', 'common-errors', 'Identify and fix common formula errors.', 'Identify and fix common formula errors.', 'https://youtube.com/watch?v=example19', 720, 5, 0, 1),
(@module_id, 'Practice Exercise', 'practice-exercise-formulas', 'Practice what you learned with exercises.', 'Practice what you learned with exercises.', 'https://youtube.com/watch?v=example20', 1200, 6, 0, 1);

-- Module 3 Quiz
INSERT INTO quizzes (module_id, title, description, time_limit, passing_score, published)
VALUES (@module_id, 'Module 3 Quiz', 'Test your formula skills', 10, 70.00, 1);

-- ============================================
-- MODULE 4: Essential Functions
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published)
VALUES (@excel_course_id, 'Essential Functions', 'Master essential Excel functions', 4, 1);

SET @module_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module_id, 'SUM Function', 'sum-function', 'Learn to use the SUM function.', 'Learn to use the SUM function.', 'https://youtube.com/watch?v=example21', 600, 1, 1, 1),
(@module_id, 'AVERAGE Function', 'average-function', 'Calculate averages with AVERAGE function.', 'Calculate averages with AVERAGE function.', 'https://youtube.com/watch?v=example22', 600, 2, 1, 1),
(@module_id, 'COUNT & COUNTA', 'count-counta', 'Count cells with COUNT and COUNTA.', 'Count cells with COUNT and COUNTA.', 'https://youtube.com/watch?v=example23', 720, 3, 0, 1),
(@module_id, 'MIN & MAX Functions', 'min-max-functions', 'Find minimum and maximum values.', 'Find minimum and maximum values.', 'https://youtube.com/watch?v=example24', 480, 4, 0, 1),
(@module_id, 'IF Function', 'if-function', 'Use logical IF statements.', 'Use logical IF statements.', 'https://youtube.com/watch?v=example25', 900, 5, 0, 1),
(@module_id, 'Nested IF', 'nested-if', 'Create complex logic with nested IFs.', 'Create complex logic with nested IFs.', 'https://youtube.com/watch?v=example26', 900, 6, 0, 1),
(@module_id, 'Practice Exercise', 'practice-exercise-functions', 'Practice essential functions.', 'Practice essential functions.', 'https://youtube.com/watch?v=example27', 1500, 7, 0, 1);

-- Module 4 Quiz
INSERT INTO quizzes (module_id, title, description, time_limit, passing_score, published)
VALUES (@module_id, 'Module 4 Quiz', 'Test your function knowledge', 10, 70.00, 1);

-- Mini Project: Student Grade Calculator
INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published)
VALUES (@module_id, 'Mini Project: Student Grade Calculator', 'mini-project-student-grade-calculator', 'Build a student grade calculator using functions.', 'Build a student grade calculator using functions.', 'https://youtube.com/watch?v=example28', 2700, 8, 0, 1);

-- ============================================
-- MODULE 5: Working with Text & Dates
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published)
VALUES (@excel_course_id, 'Working with Text & Dates', 'Manipulate text and date data effectively', 5, 1);

SET @module_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module_id, 'LEFT, RIGHT, MID Functions', 'left-right-mid-functions', 'Extract text from cells.', 'Extract text from cells.', 'https://youtube.com/watch?v=example29', 900, 1, 1, 1),
(@module_id, 'LEN Function', 'len-function', 'Get the length of text strings.', 'Get the length of text strings.', 'https://youtube.com/watch?v=example30', 480, 2, 1, 1),
(@module_id, 'TRIM Function', 'trim-function', 'Remove extra spaces from text.', 'Remove extra spaces from text.', 'https://youtube.com/watch?v=example31', 480, 3, 0, 1),
(@module_id, 'CONCAT & TEXTJOIN', 'concat-textjoin', 'Combine text from multiple cells.', 'Combine text from multiple cells.', 'https://youtube.com/watch?v=example32', 720, 4, 0, 1),
(@module_id, 'TODAY & NOW Functions', 'today-now-functions', 'Work with current date and time.', 'Work with current date and time.', 'https://youtube.com/watch?v=example33', 600, 5, 0, 1),
(@module_id, 'Working with Dates', 'working-with-dates', 'Perform calculations with dates.', 'Perform calculations with dates.', 'https://youtube.com/watch?v=example34', 900, 6, 0, 1);

-- Module 5 Quiz
INSERT INTO quizzes (module_id, title, description, time_limit, passing_score, published)
VALUES (@module_id, 'Module 5 Quiz', 'Test text and date functions', 10, 70.00, 1);

-- ============================================
-- MODULE 6: Lookup & Reference Functions
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published)
VALUES (@excel_course_id, 'Lookup & Reference Functions', 'Master data lookup techniques', 6, 1);

SET @module_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module_id, 'VLOOKUP', 'vlookup', 'Find data using VLOOKUP.', 'Find data using VLOOKUP.', 'https://youtube.com/watch?v=example35', 1200, 1, 1, 1),
(@module_id, 'HLOOKUP', 'hlookup', 'Find data horizontally with HLOOKUP.', 'Find data horizontally with HLOOKUP.', 'https://youtube.com/watch?v=example36', 900, 2, 0, 1),
(@module_id, 'XLOOKUP', 'xlookup', 'Modern lookup with XLOOKUP.', 'Modern lookup with XLOOKUP.', 'https://youtube.com/watch?v=example37', 1080, 3, 0, 1),
(@module_id, 'INDEX Function', 'index-function', 'Return values using INDEX.', 'Return values using INDEX.', 'https://youtube.com/watch?v=example38', 720, 4, 0, 1),
(@module_id, 'MATCH Function', 'match-function', 'Find positions with MATCH.', 'Find positions with MATCH.', 'https://youtube.com/watch?v=example39', 720, 5, 0, 1),
(@module_id, 'INDEX + MATCH Combination', 'index-match-combination', 'Combine INDEX and MATCH for powerful lookups.', 'Combine INDEX and MATCH for powerful lookups.', 'https://youtube.com/watch?v=example40', 1200, 6, 0, 1),
(@module_id, 'Practical Lookup Project', 'practical-lookup-project', 'Apply lookup functions to real scenarios.', 'Apply lookup functions to real scenarios.', 'https://youtube.com/watch?v=example41', 1800, 7, 0, 1);

-- Module 6 Quiz
INSERT INTO quizzes (module_id, title, description, time_limit, passing_score, published)
VALUES (@module_id, 'Module 6 Quiz', 'Test lookup functions', 10, 70.00, 1);

-- Mini Project: Sales Report with Lookup Table
INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published)
VALUES (@module_id, 'Mini Project: Sales Report with Lookup Table', 'mini-project-sales-report-lookup', 'Create a sales report using lookup functions.', 'Create a sales report using lookup functions.', 'https://youtube.com/watch?v=example42', 2700, 8, 0, 1);

-- ============================================
-- MODULE 7: Conditional Tools
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published)
VALUES (@excel_course_id, 'Conditional Tools', 'Use conditional formatting and data validation', 7, 1);

SET @module_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module_id, 'Conditional Formatting', 'conditional-formatting', 'Apply conditional formatting rules.', 'Apply conditional formatting rules.', 'https://youtube.com/watch?v=example43', 900, 1, 1, 1),
(@module_id, 'Highlight Duplicates', 'highlight-duplicates', 'Find and highlight duplicate data.', 'Find and highlight duplicate data.', 'https://youtube.com/watch?v=example44', 600, 2, 0, 1),
(@module_id, 'Data Validation (Drop-down Lists)', 'data-validation-dropdowns', 'Create drop-down lists with data validation.', 'Create drop-down lists with data validation.', 'https://youtube.com/watch?v=example45', 1080, 3, 0, 1),
(@module_id, 'Creating Dynamic Forms', 'creating-dynamic-forms', 'Build dynamic input forms.', 'Build dynamic input forms.', 'https://youtube.com/watch?v=example46', 1200, 4, 0, 1);

-- Module 7 Quiz
INSERT INTO quizzes (module_id, title, description, time_limit, passing_score, published)
VALUES (@module_id, 'Module 7 Quiz', 'Test conditional tools', 10, 70.00, 1);

-- ============================================
-- MODULE 8: Pivot Tables
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published)
VALUES (@excel_course_id, 'Pivot Tables', 'Master Pivot Tables for data analysis', 8, 1);

SET @module_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module_id, 'Introduction to Pivot Tables', 'introduction-pivot-tables', 'Learn what Pivot Tables are and why they matter.', 'Learn what Pivot Tables are and why they matter.', 'https://youtube.com/watch?v=example47', 720, 1, 1, 1),
(@module_id, 'Creating a Pivot Table', 'creating-pivot-table', 'Create your first Pivot Table.', 'Create your first Pivot Table.', 'https://youtube.com/watch?v=example48', 900, 2, 0, 1),
(@module_id, 'Grouping Data', 'grouping-data-pivot', 'Group data in Pivot Tables.', 'Group data in Pivot Tables.', 'https://youtube.com/watch?v=example49', 720, 3, 0, 1),
(@module_id, 'Filtering Pivot Tables', 'filtering-pivot-tables', 'Filter data in Pivot Tables.', 'Filter data in Pivot Tables.', 'https://youtube.com/watch?v=example50', 720, 4, 0, 1),
(@module_id, 'Pivot Charts', 'pivot-charts', 'Create charts from Pivot Tables.', 'Create charts from Pivot Tables.', 'https://youtube.com/watch?v=example51', 900, 5, 0, 1),
(@module_id, 'Slicers', 'slicers', 'Use slicers for interactive filtering.', 'Use slicers for interactive filtering.', 'https://youtube.com/watch?v=example52', 720, 6, 0, 1),
(@module_id, 'Pivot Table Practice Project', 'pivot-table-practice-project', 'Practice Pivot Table skills.', 'Practice Pivot Table skills.', 'https://youtube.com/watch?v=example53', 2100, 7, 0, 1);

-- Module 8 Quiz
INSERT INTO quizzes (module_id, title, description, time_limit, passing_score, published)
VALUES (@module_id, 'Module 8 Quiz', 'Test Pivot Table skills', 10, 70.00, 1);

-- Mini Project: Business Sales Dashboard
INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published)
VALUES (@module_id, 'Mini Project: Business Sales Dashboard', 'mini-project-business-sales-dashboard', 'Build a business sales dashboard with Pivot Tables.', 'Build a business sales dashboard with Pivot Tables.', 'https://youtube.com/watch?v=example54', 3600, 8, 0, 1);

-- ============================================
-- MODULE 9: Advanced Functions
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published)
VALUES (@excel_course_id, 'Advanced Functions', 'Learn advanced Excel functions', 9, 1);

SET @module_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module_id, 'IFERROR Function', 'iferror-function', 'Handle errors gracefully with IFERROR.', 'Handle errors gracefully with IFERROR.', 'https://youtube.com/watch?v=example55', 600, 1, 1, 1),
(@module_id, 'SUMIF & COUNTIF', 'sumif-countif', 'Sum and count based on conditions.', 'Sum and count based on conditions.', 'https://youtube.com/watch?v=example56', 900, 2, 0, 1),
(@module_id, 'SUMIFS & COUNTIFS', 'sumifs-countifs', 'Use multiple criteria with SUMIFS and COUNTIFS.', 'Use multiple criteria with SUMIFS and COUNTIFS.', 'https://youtube.com/watch?v=example57', 1080, 3, 0, 1),
(@module_id, 'Advanced Logical Functions', 'advanced-logical-functions', 'Master complex logical functions.', 'Master complex logical functions.', 'https://youtube.com/watch?v=example58', 1200, 4, 0, 1),
(@module_id, 'Dynamic Arrays', 'dynamic-arrays', 'Work with dynamic array functions.', 'Work with dynamic array functions.', 'https://youtube.com/watch?v=example59', 1080, 5, 0, 1);

-- Module 9 Quiz
INSERT INTO quizzes (module_id, title, description, time_limit, passing_score, published)
VALUES (@module_id, 'Module 9 Quiz', 'Test advanced functions', 10, 70.00, 1);

-- ============================================
-- MODULE 10: Data Cleaning & Transformation
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published)
VALUES (@excel_course_id, 'Data Cleaning & Transformation', 'Clean and transform data effectively', 10, 1);

SET @module_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module_id, 'Removing Duplicates', 'removing-duplicates', 'Remove duplicate records from data.', 'Remove duplicate records from data.', 'https://youtube.com/watch?v=example60', 600, 1, 1, 1),
(@module_id, 'Text to Columns', 'text-to-columns', 'Split text into columns.', 'Split text into columns.', 'https://youtube.com/watch?v=example61', 720, 2, 0, 1),
(@module_id, 'Cleaning Large Datasets', 'cleaning-large-datasets', 'Techniques for cleaning big data.', 'Techniques for cleaning big data.', 'https://youtube.com/watch?v=example62', 900, 3, 0, 1),
(@module_id, 'Power Query Basics', 'power-query-basics', 'Introduction to Power Query.', 'Introduction to Power Query.', 'https://youtube.com/watch?v=example63', 1200, 4, 0, 1),
(@module_id, 'Importing External Data', 'importing-external-data', 'Import data from external sources.', 'Import data from external sources.', 'https://youtube.com/watch?v=example64', 900, 5, 0, 1);

-- Module 10 Quiz
INSERT INTO quizzes (module_id, title, description, time_limit, passing_score, published)
VALUES (@module_id, 'Module 10 Quiz', 'Test data cleaning skills', 10, 70.00, 1);

-- ============================================
-- MODULE 11: Dashboards & Reporting
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published)
VALUES (@excel_course_id, 'Dashboards & Reporting', 'Create professional dashboards and reports', 11, 1);

SET @module_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module_id, 'Designing Clean Reports', 'designing-clean-reports', 'Principles of clean report design.', 'Principles of clean report design.', 'https://youtube.com/watch?v=example65', 900, 1, 1, 1),
(@module_id, 'Creating Charts', 'creating-charts', 'Create various chart types.', 'Create various chart types.', 'https://youtube.com/watch?v=example66', 1200, 2, 0, 1),
(@module_id, 'Combining Multiple Charts', 'combining-multiple-charts', 'Combine charts for better insights.', 'Combine charts for better insights.', 'https://youtube.com/watch?v=example67', 1080, 3, 0, 1),
(@module_id, 'Dashboard Layout Principles', 'dashboard-layout-principles', 'Learn effective dashboard layouts.', 'Learn effective dashboard layouts.', 'https://youtube.com/watch?v=example68', 900, 4, 0, 1),
(@module_id, 'Interactive Dashboard with Slicers', 'interactive-dashboard-slicers', 'Build interactive dashboards.', 'Build interactive dashboards.', 'https://youtube.com/watch?v=example69', 1800, 5, 0, 1),
(@module_id, 'Final Project Walkthrough', 'final-project-walkthrough', 'Complete project walkthrough.', 'Complete project walkthrough.', 'https://youtube.com/watch?v=example70', 2700, 6, 0, 1);

-- ============================================
-- MODULE 12: Real-World Applications
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published)
VALUES (@excel_course_id, 'Real-World Applications', 'Apply Excel to real-world scenarios', 12, 1);

SET @module_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module_id, 'Financial Reporting Model', 'financial-reporting-model', 'Create a financial reporting model.', 'Create a financial reporting model.', 'https://youtube.com/watch?v=example71', 2700, 1, 0, 1),
(@module_id, 'HR Attendance Tracker', 'hr-attendance-tracker', 'Build an HR attendance tracker.', 'Build an HR attendance tracker.', 'https://youtube.com/watch?v=example72', 2400, 2, 0, 1),
(@module_id, 'Inventory Management Sheet', 'inventory-management-sheet', 'Create an inventory management system.', 'Create an inventory management system.', 'https://youtube.com/watch?v=example73', 2400, 3, 0, 1),
(@module_id, 'Budget Planner', 'budget-planner', 'Build a comprehensive budget planner.', 'Build a comprehensive budget planner.', 'https://youtube.com/watch?v=example74', 2100, 4, 0, 1);

-- Final Assessment
INSERT INTO quizzes (module_id, title, description, time_limit, passing_score, is_final, published)
VALUES (@module_id, 'Final Assessment', 'Comprehensive Excel exam', 60, 80.00, 1, 1);

SELECT CONCAT('Excel course created with 12 modules and lessons') AS result;
