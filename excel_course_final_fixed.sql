-- ============================================
-- EXCEL COURSE - FINAL CURRICULUM (FIXED)
-- 12 Modules, 60+ Lessons, 12 Quizzes, 4 Mini Projects, 1 Capstone Project
-- ============================================

-- ============================================
-- Update Excel Course Details
-- ============================================
UPDATE courses SET 
    title = 'Excel Mastery: From Beginner to Advanced',
    description = 'Master Microsoft Excel from basics to advanced features. Learn formulas, pivot tables, charts, dashboards, and become job-ready. Includes practice files, quizzes, mini projects, and a capstone project.',
    short_description = 'Complete Excel course from beginner to advanced with projects',
    price = 69.00,
    duration_hours = 45.00,
    level = 'beginner'
WHERE id = 1;

-- ============================================
-- PHASE 1: FOUNDATIONS (Beginner)
-- ============================================

-- Module 1: Getting Started with Excel (Already exists - keep as is)
-- Module ID: 1 (keep existing)

-- ============================================
-- Module 2: Working with Data (Beginner)
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Working with Data', 'Learn data entry, formatting, sorting, and filtering fundamentals', 2, 1);

-- Lessons for Module 2 (module id will be last_insert_id())
SET @module2_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module2_id, 'Module 2 Introduction', 'module-2-introduction', 'Overview of working with data in Excel', 'This module covers the fundamental skills for working with data in Excel. You will learn about data types, cell formatting, sorting, filtering, and essential data management techniques that form the foundation for all Excel work.', 'https://www.youtube.com/watch?v=excel-data-intro', 300, 1, 1, 1),
(@module2_id, 'Understanding Rows, Columns & Cells', 'understanding-rows-columns-cells', 'Learn the structure of Excel worksheets', 'Excel worksheets are made up of rows, columns, and cells. Rows are numbered 1, 2, 3... and columns are lettered A, B, C... The intersection of a row and column is called a cell (e.g., A1). Understanding this structure is fundamental to working in Excel.', 'https://www.youtube.com/watch?v=excel-rows-cols', 600, 2, 1, 1),
(@module2_id, 'Data Types in Excel', 'data-types-excel', 'Text, Numbers, Dates, and more', 'Excel supports multiple data types: Text (labels), Numbers (values), Dates (stored as serial numbers), Times, Currency, Percentages, and Formulas. Understanding data types helps Excel interpret and calculate your data correctly.', 'https://www.youtube.com/watch?v=excel-data-types', 720, 3, 1, 1),
(@module2_id, 'Formatting Cells', 'formatting-cells', 'Fonts, Colors, Borders, and Alignment', 'Learn to make your spreadsheets visually appealing and readable. Format fonts (bold, italic, size, color), add background colors, apply borders, and control text alignment.', 'https://www.youtube.com/watch?v=excel-formatting-cells', 900, 4, 1, 1),
(@module2_id, 'Number Formatting', 'number-formatting', 'Currency, Percentages, Decimals', 'Excel offers powerful number formatting options. Learn to display numbers as currency, percentages, decimals, fractions, and custom formats. Proper number formatting makes data easier to understand.', 'https://www.youtube.com/watch?v=excel-number-formatting', 780, 5, 0, 1),
(@module2_id, 'Adjusting Column Width & Row Height', 'adjusting-columns-rows', 'Resize for better visibility', 'Learn multiple ways to adjust column widths and row heights for optimal data visibility. Includes auto-fit, dragging, and precise measurement options.', 'https://www.youtube.com/watch?v=excel-column-width', 480, 6, 0, 1),
(@module2_id, 'Copy, Paste & Autofill', 'copy-paste-autofill', 'Efficient data entry techniques', 'Master Excel\'s copy-paste functionality and the powerful Autofill feature for series, patterns, and repetitive data entry.', 'https://www.youtube.com/watch?v=excel-autofill', 660, 7, 0, 1),
(@module2_id, 'Flash Fill', 'flash-fill', 'Automatically format data', 'Flash Fill automatically recognizes patterns in your data and fills the rest. Learn this powerful time-saving feature for data formatting.', 'https://www.youtube.com/watch?v=excel-flash-fill', 540, 8, 0, 1),
(@module2_id, 'Sorting Data', 'sorting-data', 'Arrange data in order', 'Learn to sort data alphabetically, numerically, by date, or custom order. Includes multi-level sorting for complex datasets.', 'https://www.youtube.com/watch?v=excel-sorting', 600, 9, 0, 1),
(@module2_id, 'Basic Filtering', 'basic-filtering', 'Show only relevant data', 'Use filters to display only the data you need. Learn to filter by text, numbers, dates, and colors.', 'https://www.youtube.com/watch?v=excel-filtering', 720, 10, 0, 1),
(@module2_id, 'Module 2 Quiz', 'module-2-quiz', 'Test your data handling skills', 'Test your understanding of data entry, formatting, sorting, and filtering.', '', 300, 11, 0, 1);

-- ============================================
-- MINI PROJECT 1: Monthly Expense Tracker
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Mini Project: Monthly Expense Tracker', 'Build a complete expense tracking system', 3, 1);

SET @project1_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@project1_id, 'Project Overview', 'expense-tracker-overview', 'What we will build', 'In this mini project, we will build a complete Monthly Expense Tracker that helps you track your income and expenses, calculate totals, and analyze spending patterns.', 'https://www.youtube.com/watch?v=excel-expense-intro', 300, 1, 0, 1),
(@project1_id, 'Setting Up the Spreadsheet', 'expense-tracker-setup', 'Create the structure', 'Set up the expense tracker with categories, dates, amounts, and calculation columns.', 'https://www.youtube.com/watch?v=excel-expense-setup', 600, 2, 0, 1),
(@project1_id, 'Adding Formulas', 'expense-tracker-formulas', 'Calculate totals automatically', 'Add formulas for monthly totals, category sums, and expense analysis.', 'https://www.youtube.com/watch?v=excel-expense-formulas', 900, 3, 0, 1),
(@project1_id, 'Adding Conditional Formatting', 'expense-tracker-formatting', 'Visual enhancements', 'Apply conditional formatting to highlight spending patterns and budget targets.', 'https://www.youtube.com/watch?v=excel-expense-formatting', 600, 4, 0, 1),
(@project1_id, 'Project Solution', 'expense-tracker-solution', 'Complete solution walkthrough', 'Review the complete solution and compare with your implementation.', 'https://www.youtube.com/watch?v=excel-expense-solution', 600, 5, 0, 1);

-- ============================================
-- PHASE 2: FORMULAS & FUNCTIONS (Core Excel Skills)
-- ============================================

-- Module 3: Basic Formulas
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Basic Formulas', 'Master Excel formulas from the ground up', 4, 1);

SET @module3_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module3_id, 'Module 3 Introduction', 'module-3-introduction', 'Overview of Excel formulas', 'This module covers the fundamentals of writing and using formulas in Excel. You will learn about cell references, arithmetic operators, and basic formula debugging techniques.', 'https://www.youtube.com/watch?v=excel-formulas-intro', 300, 1, 1, 1),
(@module3_id, 'Writing Your First Formula', 'writing-first-formula', 'Start calculating in Excel', 'Formulas in Excel always begin with an equals sign (=). Learn the basics of writing formulas using cell references and operators.', 'https://www.youtube.com/watch?v=excel-first-formula', 600, 2, 1, 1),
(@module3_id, 'Arithmetic Operators', 'arithmetic-operators', 'Add, Subtract, Multiply, Divide', 'Excel uses standard arithmetic operators: + (add), - (subtract), * (multiply), / (divide), ^ (power). Learn how to combine them in formulas.', 'https://www.youtube.com/watch?v=excel-operators', 720, 3, 1, 1),
(@module3_id, 'Relative vs Absolute References', 'references-relative-absolute', 'Understanding cell references', 'Learn the difference between relative references (A1) that change when copied, and absolute references ($A$1) that stay fixed.', 'https://www.youtube.com/watch?v=excel-cell-references', 900, 4, 0, 1),
(@module3_id, 'AutoSum Function', 'autosum', 'Quick calculations', 'AutoSum is Excel\'s most popular feature. Learn to quickly calculate SUM, AVERAGE, COUNT, MAX, and MIN with one click.', 'https://www.youtube.com/watch?v=excel-autosum', 480, 5, 0, 1),
(@module3_id, 'Understanding Formula Errors', 'formula-errors', '#VALUE!, #DIV/0!, #REF!, #NAME?', 'Learn to identify and fix common formula errors: #VALUE!, #DIV/0!, #REF!, #NAME?, #N/A, #NUM!, and #####.', 'https://www.youtube.com/watch?v=excel-errors', 780, 6, 0, 1),
(@module3_id, 'Practice Exercise', 'formulas-practice-exercise', 'Apply what you learned', 'Put your formula skills to the test with this hands-on practice exercise.', 'https://www.youtube.com/watch?v=excel-formula-exercise', 900, 7, 0, 1),
(@module3_id, 'Module 3 Quiz', 'module-3-quiz', 'Test your formula basics', 'Test your understanding of basic formulas and cell references.', '', 300, 8, 0, 1);

-- ============================================
-- Module 4: Essential Functions
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Essential Functions', 'Master the most important Excel functions', 5, 1);

SET @module4_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module4_id, 'Module 4 Introduction', 'module-4-introduction', 'Overview of essential Excel functions', 'This module introduces you to the most commonly used Excel functions. You will learn how to use these functions to perform calculations and analyze data efficiently.', 'https://www.youtube.com/watch?v=excel-functions-intro', 300, 1, 1, 1),
(@module4_id, 'SUM Function', 'sum-function', 'Add up values quickly', 'The SUM function adds all numbers in a range. =SUM(A1:A10) adds all values from A1 through A10.', 'https://www.youtube.com/watch?v=excel-sum', 480, 2, 1, 1),
(@module4_id, 'AVERAGE Function', 'average-function', 'Calculate mean values', 'The AVERAGE function calculates the arithmetic mean. =AVERAGE(A1:A10) returns the average of all values.', 'https://www.youtube.com/watch?v=excel-average', 420, 3, 1, 1),
(@module4_id, 'COUNT & COUNTA', 'count-counta', 'Count cells and values', 'COUNT counts only numbers, COUNTA counts all non-empty cells. Learn when to use each.', 'https://www.youtube.com/watch?v=excel-count', 540, 4, 0, 1),
(@module4_id, 'MIN & MAX Functions', 'min-max', 'Find smallest and largest values', 'MIN returns the smallest value, MAX returns the largest. Essential for data analysis.', 'https://www.youtube.com/watch?v=excel-min-max', 360, 5, 0, 1),
(@module4_id, 'IF Function', 'if-function', 'Make decisions with logic', 'The IF function performs a logical test and returns one value if TRUE, another if FALSE. =IF(condition, value_if_true, value_if_false)', 'https://www.youtube.com/watch?v=excel-if', 900, 6, 0, 1),
(@module4_id, 'Nested IF Functions', 'nested-if', 'Multiple conditions', 'Learn to nest multiple IF functions for complex conditional logic with multiple outcomes.', 'https://www.youtube.com/watch?v=excel-nested-if', 780, 7, 0, 1),
(@module4_id, 'Practice Exercise', 'functions-practice-exercise', 'Apply essential functions', 'Practice using SUM, AVERAGE, COUNT, IF, and nested IF functions.', 'https://www.youtube.com/watch?v=excel-functions-exercise', 900, 8, 0, 1),
(@module4_id, 'Module 4 Quiz', 'module-4-quiz', 'Test essential functions', 'Test your knowledge of essential Excel functions.', '', 300, 9, 0, 1);

-- ============================================
-- MINI PROJECT 2: Student Grade Calculator
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Mini Project: Student Grade Calculator', 'Build a complete grade calculation system', 6, 1);

SET @project2_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@project2_id, 'Project Overview', 'grade-calculator-overview', 'What we will build', 'In this mini project, we will build a complete Student Grade Calculator that calculates averages, letter grades, and pass/fail status.', 'https://www.youtube.com/watch?v=excel-grade-calc-intro', 300, 1, 0, 1),
(@project2_id, 'Setting Up the Spreadsheet', 'grade-calculator-setup', 'Create the structure', 'Set up the grade tracker with student names, subject scores, and grade calculation columns.', 'https://www.youtube.com/watch?v=excel-grade-setup', 600, 2, 0, 1),
(@project2_id, 'Adding Formulas', 'grade-calculator-formulas', 'Calculate grades automatically', 'Add formulas for weighted averages, total scores, and grade calculations.', 'https://www.youtube.com/watch?v=excel-grade-formulas', 900, 3, 0, 1),
(@project2_id, 'Adding Conditional Formatting', 'grade-calculator-formatting', 'Visual enhancements', 'Apply conditional formatting to highlight passing/failing grades and top performers.', 'https://www.youtube.com/watch?v=excel-grade-formatting', 600, 4, 0, 1),
(@project2_id, 'Project Solution', 'grade-calculator-solution', 'Complete solution walkthrough', 'Review the complete solution and compare with your implementation.', 'https://www.youtube.com/watch?v=excel-grade-solution', 600, 5, 0, 1);

-- ============================================
-- PHASE 3: INTERMEDIATE DATA HANDLING
-- ============================================

-- ============================================
-- Module 5: Working with Text & Dates
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Working with Text & Dates', 'Manipulate text and date data effectively', 7, 1);

SET @module5_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module5_id, 'Module 5 Introduction', 'module-5-introduction', 'Overview of text and date manipulation', 'This module teaches you how to work with text and date data in Excel. You will learn text functions to extract, combine, and format text, and date functions to calculate dates and times.', 'https://www.youtube.com/watch?v=excel-text-dates-intro', 300, 1, 1, 1),
(@module5_id, 'LEFT Function', 'left-function', 'Extract text from the left', 'LEFT(text, num_chars) extracts characters from the beginning of a text string.', 'https://www.youtube.com/watch?v=excel-left', 480, 2, 1, 1),
(@module5_id, 'RIGHT Function', 'right-function', 'Extract text from the right', 'RIGHT(text, num_chars) extracts characters from the end of a text string.', 'https://www.youtube.com/watch?v=excel-right', 420, 3, 1, 1),
(@module5_id, 'MID Function', 'mid-function', 'Extract text from the middle', 'MID(text, start_num, num_chars) extracts characters from the middle of a text string.', 'https://www.youtube.com/watch?v=excel-mid', 480, 4, 0, 1),
(@module5_id, 'LEN Function', 'len-function', 'Count characters in text', 'LEN(text) returns the number of characters in a text string.', 'https://www.youtube.com/watch?v=excel-len', 360, 5, 0, 1),
(@module5_id, 'TRIM Function', 'trim-function', 'Remove extra spaces', 'TRIM(text) removes all extra spaces from text, leaving only single spaces between words.', 'https://www.youtube.com/watch?v=excel-trim', 420, 6, 0, 1),
(@module5_id, 'CONCAT & TEXTJOIN', 'concat-textjoin', 'Combine text strings', 'CONCAT joins text strings together. TEXTJOIN provides more control with delimiters.', 'https://www.youtube.com/watch?v=excel-concat', 600, 7, 0, 1),
(@module5_id, 'Working with Dates', 'working-with-dates', 'Date calculations and formatting', 'Excel stores dates as serial numbers. Learn to calculate differences, add days, and format dates.', 'https://www.youtube.com/watch?v=excel-dates', 720, 8, 0, 1),
(@module5_id, 'Module 5 Quiz', 'module-5-quiz', 'Test text and date functions', 'Test your knowledge of text and date manipulation.', '', 300, 9, 0, 1);

-- ============================================
-- Module 6: Lookup & Reference Functions
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Lookup & Reference Functions', 'Find and retrieve data efficiently', 8, 1);

SET @module6_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module6_id, 'Module 6 Introduction', 'module-6-introduction', 'Overview of lookup functions', 'This module introduces you to Excel\'s powerful lookup and reference functions. These functions allow you to find and retrieve data from tables and ranges efficiently.', 'https://www.youtube.com/watch?v=excel-lookup-intro', 300, 1, 1, 1),
(@module6_id, 'VLOOKUP Function', 'vlookup', 'Find data in columns', 'VLOOKUP(lookup_value, table_array, col_index, range_lookup) searches for a value in the first column and returns a value in the same row.', 'https://www.youtube.com/watch?v=excel-vlookup', 900, 2, 1, 1),
(@module6_id, 'HLOOKUP Function', 'hlookup', 'Find data in rows', 'HLOOKUP searches for a value in the first row and returns a value in the same column.', 'https://www.youtube.com/watch?v=excel-hlookup', 600, 3, 0, 1),
(@module6_id, 'XLOOKUP Function', 'xlookup', 'Modern replacement for VLOOKUP', 'XLOOKUP is the modern, more flexible replacement for VLOOKUP and HLOOKUP.', 'https://www.youtube.com/watch?v=excel-xlookup', 780, 4, 0, 1),
(@module6_id, 'INDEX Function', 'index-function', 'Return values at positions', 'INDEX(array, row_num, col_num) returns the value at a specific position in a range.', 'https://www.youtube.com/watch?v=excel-index', 600, 5, 0, 1),
(@module6_id, 'MATCH Function', 'match-function', 'Find positions of values', 'MATCH(lookup_value, lookup_array, match_type) returns the position of a value in a range.', 'https://www.youtube.com/watch?v=excel-match', 600, 6, 0, 1),
(@module6_id, 'INDEX + MATCH Combination', 'index-match', 'Powerful dynamic lookups', 'Combine INDEX and MATCH for more flexible and powerful lookups than VLOOKUP.', 'https://www.youtube.com/watch?v=excel-index-match', 900, 7, 0, 1),
(@module6_id, 'Practical Lookup Project', 'lookup-project', 'Apply your skills', 'Build a practical lookup system for sales data.', 'https://www.youtube.com/watch?v=excel-lookup-project', 720, 8, 0, 1),
(@module6_id, 'Module 6 Quiz', 'module-6-quiz', 'Test lookup functions', 'Test your understanding of lookup and reference functions.', '', 300, 9, 0, 1);

-- ============================================
-- MINI PROJECT 3: Sales Report with Lookup Table
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Mini Project: Sales Report', 'Build a sales report with lookups', 9, 1);

SET @project3_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@project3_id, 'Project Setup', 'sales-report-setup', 'Create the data structure', 'Set up the sales report with product tables, pricing lookups, and sales data.', 'https://www.youtube.com/watch?v=excel-sales-setup', 600, 1, 0, 1),
(@project3_id, 'Implementing Lookups', 'sales-report-lookups', 'Add lookup formulas', 'Add VLOOKUP/XLOOKUP to retrieve product prices and details.', 'https://www.youtube.com/watch?v=excel-sales-lookups', 900, 2, 0, 1),
(@project3_id, 'Calculating Totals', 'sales-report-totals', 'Calculate sales figures', 'Add formulas for quantity * price calculations and totals.', 'https://www.youtube.com/watch?v=excel-sales-totals', 600, 3, 0, 1),
(@project3_id, 'Project Solution', 'sales-report-solution', 'Review complete solution', 'Compare your solution with the complete implementation.', 'https://www.youtube.com/watch?v=excel-sales-solution', 600, 4, 0, 1);

-- ============================================
-- PHASE 4: DATA ANALYSIS TOOLS
-- ============================================

-- ============================================
-- Module 7: Conditional Tools
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Conditional Tools', 'Format and validate data intelligently', 10, 1);

SET @module7_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module7_id, 'Module 7 Introduction', 'module-7-introduction', 'Overview of conditional tools', 'This module covers conditional formatting and data validation. These tools help you format cells based on conditions and control the data that can be entered.', 'https://www.youtube.com/watch?v=excel-conditional-intro', 300, 1, 1, 1),
(@module7_id, 'Conditional Formatting', 'conditional-formatting', 'Highlight important data', 'Use conditional formatting to automatically highlight cells based on their values or formulas.', 'https://www.youtube.com/watch?v=excel-conditional-formatting', 900, 2, 1, 1),
(@module7_id, 'Highlight Duplicates', 'highlight-duplicates', 'Find repeated data', 'Use conditional formatting to identify and highlight duplicate entries in your data.', 'https://www.youtube.com/watch?v=excel-duplicates', 480, 3, 0, 1),
(@module7_id, 'Data Validation', 'data-validation', 'Create dropdown lists', 'Control what data can be entered with validation rules and dropdown lists.', 'https://www.youtube.com/watch?v=excel-data-validation', 900, 4, 0, 1),
(@module7_id, 'Creating Dynamic Forms', 'dynamic-forms', 'Interactive data entry', 'Build dynamic forms with dependent dropdowns and smart validation.', 'https://www.youtube.com/watch?v=excel-dynamic-forms', 720, 5, 0, 1),
(@module7_id, 'Module 7 Quiz', 'module-7-quiz', 'Test conditional tools', 'Test your knowledge of conditional formatting and data validation.', '', 300, 6, 0, 1);

-- ============================================
-- Module 8: Pivot Tables (Very Important)
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Pivot Tables', 'Master the most powerful data analysis tool', 11, 1);

SET @module8_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module8_id, 'Module 8 Introduction', 'module-8-introduction', 'Overview of Pivot Tables', 'Pivot Tables are Excel\'s most powerful data analysis tool. They summarize large datasets with drag-and-drop simplicity. This module will teach you everything you need to know about pivot tables.', 'https://www.youtube.com/watch?v=excel-pivot-intro', 300, 1, 1, 1),
(@module8_id, 'Introduction to Pivot Tables', 'pivot-tables-intro', 'What are Pivot Tables?', 'Pivot Tables are Excel\'s most powerful data analysis tool. They summarize large datasets with drag-and-drop simplicity.', 'https://www.youtube.com/watch?v=excel-pivot-intro', 600, 2, 1, 1),
(@module8_id, 'Creating Your First Pivot Table', 'create-pivot-table', 'Build a basic pivot table', 'Learn the step-by-step process of creating your first pivot table from source data.', 'https://www.youtube.com/watch?v=excel-create-pivot', 780, 3, 0, 1),
(@module8_id, 'Grouping Data in Pivot Tables', 'pivot-grouping', 'Group dates, numbers, and text', 'Group your data by dates (years, quarters, months), number ranges, or custom groups.', 'https://www.youtube.com/watch?v=excel-pivot-grouping', 720, 4, 0, 1),
(@module8_id, 'Filtering Pivot Tables', 'pivot-filtering', 'Slicers and report filters', 'Add multiple filters using Slicers and traditional pivot table filters.', 'https://www.youtube.com/watch?v=excel-pivot-filtering', 600, 5, 0, 1),
(@module8_id, 'Pivot Charts', 'pivot-charts', 'Visualize pivot data', 'Create charts that update automatically with your pivot table changes.', 'https://www.youtube.com/watch?v=excel-pivot-charts', 720, 6, 0, 1),
(@module8_id, 'Slicers', 'excel-slicers', 'Interactive filtering', 'Add professional-looking interactive filters that work across multiple pivot tables.', 'https://www.youtube.com/watch?v=excel-slicers', 480, 7, 0, 1),
(@module8_id, 'Pivot Table Practice Project', 'pivot-project', 'Real-world practice', 'Apply your pivot table skills to a comprehensive dataset.', 'https://www.youtube.com/watch?v=excel-pivot-project', 900, 8, 0, 1),
(@module8_id, 'Module 8 Quiz', 'module-8-quiz', 'Test pivot table skills', 'Test your understanding of pivot tables and charts.', '', 300, 9, 0, 1);

-- ============================================
-- MINI PROJECT 4: Business Sales Dashboard
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Mini Project: Business Sales Dashboard', 'Create an interactive sales dashboard', 12, 1);

SET @project4_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@project4_id, 'Dashboard Planning', 'sales-dashboard-planning', 'Design your dashboard', 'Plan the layout and metrics for your interactive sales dashboard.', 'https://www.youtube.com/watch?v=excel-dashboard-planning', 480, 1, 0, 1),
(@project4_id, 'Creating Pivot Tables', 'dashboard-pivots', 'Build analysis tables', 'Create multiple pivot tables for different views of your sales data.', 'https://www.youtube.com/watch?v=excel-dashboard-pivots', 900, 2, 0, 1),
(@project4_id, 'Adding Pivot Charts', 'dashboard-charts', 'Visualize the data', 'Add charts to represent each metric visually.', 'https://www.youtube.com/watch?v=excel-dashboard-charts', 780, 3, 0, 1),
(@project4_id, 'Adding Slicers', 'dashboard-slicers', 'Make it interactive', 'Connect slicers for filtering all charts at once.', 'https://www.youtube.com/watch?v=excel-dashboard-slicers', 600, 4, 0, 1),
(@project4_id, 'Final Dashboard Walkthrough', 'dashboard-final', 'Complete solution', 'Review the complete professional dashboard.', 'https://www.youtube.com/watch?v=excel-dashboard-final', 600, 5, 0, 1);

-- ============================================
-- PHASE 5: ADVANCED EXCEL
-- ============================================

-- ============================================
-- Module 9: Advanced Functions
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Advanced Functions', 'Take your formulas to the next level', 13, 1);

SET @module9_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module9_id, 'Module 9 Introduction', 'module-9-introduction', 'Overview of advanced functions', 'This module covers advanced Excel functions that will take your skills to the next level. You will learn about error handling, conditional sums, and dynamic arrays.', 'https://www.youtube.com/watch?v=excel-advanced-intro', 300, 1, 1, 1),
(@module9_id, 'IFERROR Function', 'iferror', 'Handle errors gracefully', 'IFERROR(value, value_if_error) returns a custom result when a formula produces an error.', 'https://www.youtube.com/watch?v=excel-iferror', 480, 2, 1, 1),
(@module9_id, 'SUMIF & COUNTIF', 'sumif-countif', 'Conditional calculations', 'SUMIF and COUNTIF perform calculations based on a single condition.', 'https://www.youtube.com/watch?v=excel-sumif', 720, 3, 0, 1),
(@module9_id, 'SUMIFS & COUNTIFS', 'sumifs-countifs', 'Multiple condition sums', 'SUMIFS and COUNTIFS perform calculations based on multiple conditions.', 'https://www.youtube.com/watch?v=excel-sumifs', 780, 4, 0, 1),
(@module9_id, 'Advanced Logical Functions', 'advanced-logical', 'AND, OR, NOT', 'Combine multiple conditions with AND, OR, and NOT functions.', 'https://www.youtube.com/watch?v=excel-advanced-logical', 600, 5, 0, 1),
(@module9_id, 'Dynamic Arrays', 'dynamic-arrays', 'SPILL functions', 'Learn about FILTER, SORT, UNIQUE, and other dynamic array functions.', 'https://www.youtube.com/watch?v=excel-dynamic-arrays', 900, 6, 0, 1),
(@module9_id, 'Module 9 Quiz', 'module-9-quiz', 'Test advanced functions', 'Test your knowledge of advanced Excel functions.', '', 300, 7, 0, 1);

-- ============================================
-- Module 10: Data Cleaning & Transformation
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Data Cleaning & Transformation', 'Prepare data for analysis', 14, 1);

SET @module10_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module10_id, 'Module 10 Introduction', 'module-10-introduction', 'Overview of data cleaning', 'This module teaches you how to clean and transform data for analysis. You will learn techniques for removing duplicates, splitting data, and using Power Query.', 'https://www.youtube.com/watch?v=excel-cleaning-intro', 300, 1, 1, 1),
(@module10_id, 'Removing Duplicates', 'remove-duplicates', 'Clean your data', 'Use the Remove Duplicates feature to eliminate redundant records.', 'https://www.youtube.com/watch?v=excel-remove-duplicates', 480, 2, 1, 1),
(@module10_id, 'Text to Columns', 'text-to-columns', 'Split data into columns', 'Split text in one column into multiple columns using delimiters.', 'https://www.youtube.com/watch?v=excel-text-columns', 600, 3, 0, 1),
(@module10_id, 'Cleaning Large Datasets', 'cleaning-large-data', 'Best practices', 'Techniques for cleaning and preparing large datasets for analysis.', 'https://www.youtube.com/watch?v=excel-clean-data', 720, 4, 0, 1),
(@module10_id, 'Power Query Basics', 'power-query-basics', 'Introduction to Get & Transform', 'Learn the basics of Power Query for advanced data transformation.', 'https://www.youtube.com/watch?v=excel-power-query', 900, 5, 0, 1),
(@module10_id, 'Importing External Data', 'import-external-data', 'Connect to other sources', 'Import data from CSV, text files, databases, and other sources.', 'https://www.youtube.com/watch?v=excel-import-data', 600, 6, 0, 1),
(@module10_id, 'Module 10 Quiz', 'module-10-quiz', 'Test data cleaning skills', 'Test your knowledge of data cleaning and transformation.', '', 300, 7, 0, 1);

-- ============================================
-- Module 11: Dashboards & Reporting
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Dashboards & Reporting', 'Create professional data presentations', 15, 1);

SET @module11_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module11_id, 'Module 11 Introduction', 'module-11-introduction', 'Overview of dashboards and reporting', 'This module covers the principles of designing effective dashboards and reports. You will learn how to create visualizations that communicate data clearly.', 'https://www.youtube.com/watch?v=excel-dashboards-intro', 300, 1, 1, 1),
(@module11_id, 'Designing Clean Reports', 'design-clean-reports', 'Layout principles', 'Learn principles for creating clean, professional reports.', 'https://www.youtube.com/watch?v=excel-clean-reports', 600, 2, 1, 1),
(@module11_id, 'Creating Charts', 'creating-charts', 'Data visualization basics', 'Create various chart types for different data presentations.', 'https://www.youtube.com/watch?v=excel-charts', 780, 3, 0, 1),
(@module11_id, 'Combining Multiple Charts', 'combine-charts', 'Complex visualizations', 'Combine multiple chart types and create combination charts.', 'https://www.youtube.com/watch?v=excel-combine-charts', 600, 4, 0, 1),
(@module11_id, 'Dashboard Layout Principles', 'dashboard-layout', 'Visual organization', 'Learn best practices for dashboard layout and visual hierarchy.', 'https://www.youtube.com/watch?v=excel-dashboard-layout', 720, 5, 0, 1),
(@module11_id, 'Interactive Dashboard with Slicers', 'interactive-dashboard', 'Add interactivity', 'Create fully interactive dashboards with connected slicers.', 'https://www.youtube.com/watch?v=excel-interactive-dashboard', 900, 6, 0, 1),
(@module11_id, 'Final Project Walkthrough', 'dashboard-final-walkthrough', 'Complete dashboard', 'Watch the creation of a complete professional dashboard.', 'https://www.youtube.com/watch?v=excel-dashboard-complete', 600, 7, 0, 1);

-- ============================================
-- CAPSTONE PROJECT: Complete Business Dashboard
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Capstone Project: Business Dashboard', 'Build a complete real-world dashboard', 16, 1);

SET @capstone_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@capstone_id, 'Project Overview', 'capstone-overview', 'What we will build', 'Overview of the comprehensive business dashboard you will create.', 'https://www.youtube.com/watch?v=excel-capstone-intro', 300, 1, 0, 1),
(@capstone_id, 'Data Setup & Cleaning', 'capstone-data', 'Prepare source data', 'Set up and clean the data for your dashboard project.', 'https://www.youtube.com/watch?v=excel-capstone-data', 900, 2, 0, 1),
(@capstone_id, 'Building Pivot Tables', 'capstone-pivots', 'Create analysis tables', 'Build all necessary pivot tables for the dashboard.', 'https://www.youtube.com/watch?v=excel-capstone-pivots', 1200, 3, 0, 1),
(@capstone_id, 'Creating Visualizations', 'capstone-charts', 'Add charts and KPIs', 'Create charts, KPIs, and metrics displays.', 'https://www.youtube.com/watch?v=excel-capstone-charts', 1200, 4, 0, 1),
(@capstone_id, 'Final Dashboard Assembly', 'capstone-assembly', 'Put it all together', 'Assemble all elements into a cohesive dashboard.', 'https://www.youtube.com/watch?v=excel-capstone-assembly', 900, 5, 0, 1);

-- ============================================
-- FINAL PHASE: JOB-READY EXCEL
-- ============================================

-- ============================================
-- Module 12: Real-World Applications
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Real-World Applications', 'Job-ready Excel skills', 17, 1);

SET @module12_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module12_id, 'Financial Reporting Model', 'financial-reporting', 'Build financial models', 'Create a comprehensive financial reporting model.', 'https://www.youtube.com/watch?v=excel-financial-model', 1200, 1, 1, 1),
(@module12_id, 'HR Attendance Tracker', 'hr-attendance', 'Track employee attendance', 'Build an HR attendance and leave tracking system.', 'https://www.youtube.com/watch?v=excel-hr-tracker', 900, 2, 0, 1),
(@module12_id, 'Inventory Management Sheet', 'inventory-management', 'Track inventory', 'Create an inventory management system.', 'https://www.youtube.com/watch?v=excel-inventory', 900, 3, 0, 1),
(@module12_id, 'Budget Planner', 'budget-planner', 'Personal/business budgets', 'Build a comprehensive budget planner template.', 'https://www.youtube.com/watch?v=excel-budget', 720, 4, 0, 1),
(@module12_id, 'Final Assessment', 'excel-final-assessment', 'Comprehensive test', 'Demonstrate your mastery of all Excel skills.', '', 1800, 5, 0, 1);

-- ============================================
-- QUIZZES FOR ALL MODULES
-- ============================================

-- Get the last lesson id for each module to create quizzes
SET @lesson11_id = (SELECT id FROM lessons WHERE module_id = @module2_id AND order_index = 11);
SET @lesson8_id = (SELECT id FROM lessons WHERE module_id = @module3_id AND order_index = 8);
SET @lesson9_id = (SELECT id FROM lessons WHERE module_id = @module4_id AND order_index = 9);
SET @lesson15_id = (SELECT id FROM lessons WHERE module_id = @module5_id AND order_index = 9);
SET @lesson16_id = (SELECT id FROM lessons WHERE module_id = @module6_id AND order_index = 9);
SET @lesson6_id = (SELECT id FROM lessons WHERE module_id = @module7_id AND order_index = 6);
SET @lesson17_id = (SELECT id FROM lessons WHERE module_id = @module8_id AND order_index = 9);
SET @lesson18_id = (SELECT id FROM lessons WHERE module_id = @module9_id AND order_index = 7);
SET @lesson19_id = (SELECT id FROM lessons WHERE module_id = @module10_id AND order_index = 7);
SET @lesson20_id = (SELECT id FROM lessons WHERE module_id = @module12_id AND order_index = 5);

-- Quiz for Module 2 (Working with Data)
INSERT INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(1, @module2_id, @lesson11_id, 'Working with Data Quiz', 'Test data entry, formatting, sorting, and filtering', 15, 70.00, 0, 1);

-- Quiz for Module 3 (Basic Formulas)
INSERT INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(1, @module3_id, @lesson8_id, 'Basic Formulas Quiz', 'Test your formula writing skills', 15, 70.00, 0, 1);

-- Quiz for Module 4 (Essential Functions)
INSERT INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(1, @module4_id, @lesson9_id, 'Essential Functions Quiz', 'Test SUM, AVERAGE, IF, and nested functions', 20, 70.00, 0, 1);

-- Quiz for Module 5 (Text & Dates)
INSERT INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(1, @module5_id, @lesson15_id, 'Text & Dates Quiz', 'Test text and date manipulation', 15, 70.00, 0, 1);

-- Quiz for Module 6 (Lookup Functions)
INSERT INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(1, @module6_id, @lesson16_id, 'Lookup Functions Quiz', 'Test VLOOKUP, XLOOKUP, INDEX, MATCH', 20, 70.00, 0, 1);

-- Quiz for Module 7 (Conditional Tools)
INSERT INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(1, @module7_id, @lesson6_id, 'Conditional Tools Quiz', 'Test conditional formatting and data validation', 15, 70.00, 0, 1);

-- Quiz for Module 8 (Pivot Tables)
INSERT INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(1, @module8_id, @lesson17_id, 'Pivot Tables Quiz', 'Test your pivot table mastery', 20, 70.00, 0, 1);

-- Quiz for Module 9 (Advanced Functions)
INSERT INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(1, @module9_id, @lesson18_id, 'Advanced Functions Quiz', 'Test IFERROR, SUMIFS, dynamic arrays', 20, 70.00, 0, 1);

-- Quiz for Module 10 (Data Cleaning)
INSERT INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(1, @module10_id, @lesson19_id, 'Data Cleaning Quiz', 'Test data cleaning and Power Query', 15, 70.00, 0, 1);

-- Final Excel Exam
INSERT INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(1, @module12_id, @lesson20_id, 'Excel Final Exam', 'Comprehensive final assessment covering all topics', 60, 70.00, 1, 1);
