-- ============================================
-- EXCEL COURSE - COMPLETE CURRICULUM
-- 12 Modules, 60+ Lessons, 12 Quizzes
-- ============================================

-- ============================================
-- Update Excel Course Details
-- ============================================
UPDATE courses SET 
    title = 'Excel Mastery: Complete Beginner to Advanced Course',
    description = 'Master Microsoft Excel from basics to advanced features. Learn formulas, pivot tables, charts, dashboards, and become job-ready. Includes practice files, quizzes, mini projects, and a capstone project.',
    short_description = 'Complete Excel course from beginner to advanced with projects',
    price = 69.00,
    duration_hours = 45.00,
    level = 'beginner'
WHERE id = 1;

-- ============================================
-- Module 1: Getting Started with Excel (Already exists - keep as is)
-- ============================================
-- Module ID: 1 (keep existing)

-- ============================================
-- Module 2: Working with Data (Beginner)
-- ============================================
INSERT IGNORE INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Working with Data', 'Learn data entry, formatting, sorting, and filtering fundamentals', 2, 1);

-- Lessons for Module 2 (lessons 6-15)
INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(2, 'Understanding Rows, Columns & Cells', 'understanding-rows-columns-cells', 'Learn the structure of Excel worksheets', 'Excel worksheets are made up of rows, columns, and cells. Rows are numbered 1, 2, 3... and columns are lettered A, B, C... The intersection of a row and column is called a cell (e.g., A1). Understanding this structure is fundamental to working in Excel.', 'https://www.youtube.com/watch?v=excel-rows-cols', 600, 1, 1, 1),
(2, 'Data Types in Excel', 'data-types-excel', 'Text, Numbers, Dates, and more', 'Excel supports multiple data types: Text (labels), Numbers (values), Dates (stored as serial numbers), Times, Currency, Percentages, and Formulas. Understanding data types helps Excel interpret and calculate your data correctly.', 'https://www.youtube.com/watch?v=excel-data-types', 720, 2, 1, 1),
(2, 'Formatting Cells', 'formatting-cells', 'Fonts, Colors, Borders, and Alignment', 'Learn to make your spreadsheets visually appealing and readable. Format fonts (bold, italic, size, color), add background colors, apply borders, and control text alignment.', 'https://www.youtube.com/watch?v=excel-formatting-cells', 900, 3, 1, 1),
(2, 'Number Formatting', 'number-formatting', 'Currency, Percentages, Decimals', 'Excel offers powerful number formatting options. Learn to display numbers as currency, percentages, decimals, fractions, and custom formats. Proper number formatting makes data easier to understand.', 'https://www.youtube.com/watch?v=excel-number-formatting', 780, 4, 1, 1),
(2, 'Adjusting Column Width & Row Height', 'adjusting-columns-rows', 'Resize for better visibility', 'Learn multiple ways to adjust column widths and row heights for optimal data visibility. Includes auto-fit, dragging, and precise measurement options.', 'https://www.youtube.com/watch?v=excel-column-width', 480, 5, 0, 1),
(2, 'Copy, Paste & Autofill', 'copy-paste-autofill', 'Efficient data entry techniques', 'Master Excel\'s copy-paste functionality and the powerful Autofill feature for series, patterns, and repetitive data entry.', 'https://www.youtube.com/watch?v=excel-autofill', 660, 6, 0, 1),
(2, 'Flash Fill', 'flash-fill', 'Automatically format data', 'Flash Fill automatically recognizes patterns in your data and fills the rest. Learn this powerful time-saving feature for data formatting.', 'https://www.youtube.com/watch?v=excel-flash-fill', 540, 7, 0, 1),
(2, 'Sorting Data', 'sorting-data', 'Arrange data in order', 'Learn to sort data alphabetically, numerically, by date, or custom order. Includes multi-level sorting for complex datasets.', 'https://www.youtube.com/watch?v=excel-sorting', 600, 8, 0, 1),
(2, 'Basic Filtering', 'basic-filtering', 'Show only relevant data', 'Use filters to display only the data you need. Learn to filter by text, numbers, dates, and colors.', 'https://www.youtube.com/watch?v=excel-filtering', 720, 9, 0, 1),
(2, 'Module 2 Quiz', 'module-2-quiz', 'Test your data handling skills', 'Test your understanding of data entry, formatting, sorting, and filtering.', '', 300, 10, 0, 1);

-- ============================================
-- Module 3: Basic Formulas
-- ============================================
INSERT IGNORE INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Basic Formulas', 'Master Excel formulas from the ground up', 3, 1);

-- Lessons for Module 3 (lessons 16-23)
INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(3, 'Writing Your First Formula', 'writing-first-formula', 'Start calculating in Excel', 'Formulas in Excel always begin with an equals sign (=). Learn the basics of writing formulas using cell references and operators.', 'https://www.youtube.com/watch?v=excel-first-formula', 600, 1, 1, 1),
(3, 'Arithmetic Operators', 'arithmetic-operators', 'Add, Subtract, Multiply, Divide', 'Excel uses standard arithmetic operators: + (add), - (subtract), * (multiply), / (divide), ^ (power). Learn how to combine them in formulas.', 'https://www.youtube.com/watch?v=excel-operators', 720, 2, 1, 1),
(3, 'Relative vs Absolute References', 'references-relative-absolute', 'Understanding cell references', 'Learn the difference between relative references (A1) that change when copied, and absolute references ($A$1) that stay fixed.', 'https://www.youtube.com/watch?v=excel-cell-references', 900, 3, 0, 1),
(3, 'AutoSum Function', 'autosum', 'Quick calculations', 'AutoSum is Excel\'s most popular feature. Learn to quickly calculate SUM, AVERAGE, COUNT, MAX, and MIN with one click.', 'https://www.youtube.com/watch?v=excel-autosum', 480, 4, 0, 1),
(3, 'Understanding Formula Errors', 'formula-errors', '#VALUE!, #DIV/0!, #REF!, #NAME?', 'Learn to identify and fix common formula errors: #VALUE!, #DIV/0!, #REF!, #NAME?, #N/A, #NUM!, and #####.', 'https://www.youtube.com/watch?v=excel-errors', 780, 5, 0, 1),
(3, 'Formula Debugging', 'formula-debugging', 'Fix broken formulas', 'Learn techniques to debug and troubleshoot formulas, including the Evaluate Formula feature and error-checking tools.', 'https://www.youtube.com/watch?v=excel-debugging', 600, 6, 0, 1),
(3, 'Practice Exercise', 'formulas-practice-exercise', 'Apply what you learned', 'Put your formula skills to the test with this hands-on practice exercise.', 'https://www.youtube.com/watch?v=excel-formula-exercise', 900, 7, 0, 1),
(3, 'Module 3 Quiz', 'module-3-quiz', 'Test your formula basics', 'Test your understanding of basic formulas and cell references.', '', 300, 8, 0, 1);

-- ============================================
-- Module 4: Essential Functions
-- ============================================
INSERT IGNORE INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Essential Functions', 'Master the most important Excel functions', 4, 1);

-- Lessons for Module 4 (lessons 24-32)
INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(4, 'SUM Function', 'sum-function', 'Add up values quickly', 'The SUM function adds all numbers in a range. =SUM(A1:A10) adds all values from A1 through A10.', 'https://www.youtube.com/watch?v=excel-sum', 480, 1, 1, 1),
(4, 'AVERAGE Function', 'average-function', 'Calculate mean values', 'The AVERAGE function calculates the arithmetic mean. =AVERAGE(A1:A10) returns the average of all values.', 'https://www.youtube.com/watch?v=excel-average', 420, 2, 1, 1),
(4, 'COUNT & COUNTA', 'count-counta', 'Count cells and values', 'COUNT counts only numbers, COUNTA counts all non-empty cells. Learn when to use each.', 'https://www.youtube.com/watch?v=excel-count', 540, 3, 0, 1),
(4, 'MIN & MAX Functions', 'min-max', 'Find smallest and largest values', 'MIN returns the smallest value, MAX returns the largest. Essential for data analysis.', 'https://www.youtube.com/watch?v=excel-min-max', 360, 4, 0, 1),
(4, 'IF Function', 'if-function', 'Make decisions with logic', 'The IF function performs a logical test and returns one value if TRUE, another if FALSE. =IF(condition, value_if_true, value_if_false)', 'https://www.youtube.com/watch?v=excel-if', 900, 5, 0, 1),
(4, 'Nested IF Functions', 'nested-if', 'Multiple conditions', 'Learn to nest multiple IF functions for complex conditional logic with multiple outcomes.', 'https://www.youtube.com/watch?v=excel-nested-if', 780, 6, 0, 1),
(4, 'Practice Exercise', 'functions-practice-exercise', 'Apply essential functions', 'Practice using SUM, AVERAGE, COUNT, IF, and nested IF functions.', 'https://www.youtube.com/watch?v=excel-functions-exercise', 900, 7, 0, 1),
(4, 'Module 4 Quiz', 'module-4-quiz', 'Test essential functions', 'Test your knowledge of essential Excel functions.', '', 300, 8, 0, 1);

-- ============================================
-- MINI PROJECT 1: Student Grade Calculator
-- ============================================
INSERT IGNORE INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Mini Project: Student Grade Calculator', 'Build a complete grade calculation system', 5, 1);

INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(5, 'Project Overview', 'grade-calculator-overview', 'What we will build', 'In this mini project, we will build a complete Student Grade Calculator that calculates averages, letter grades, and pass/fail status.', 'https://www.youtube.com/watch?v=excel-grade-calc-intro', 300, 1, 0, 1),
(5, 'Setting Up the Spreadsheet', 'grade-calculator-setup', 'Create the structure', 'Set up the grade tracker with student names, subject scores, and grade calculation columns.', 'https://www.youtube.com/watch?v=excel-grade-setup', 600, 2, 0, 1),
(5, 'Adding Formulas', 'grade-calculator-formulas', 'Calculate grades automatically', 'Add formulas for weighted averages, total scores, and grade calculations.', 'https://www.youtube.com/watch?v=excel-grade-formulas', 900, 3, 0, 1),
(5, 'Adding Conditional Formatting', 'grade-calculator-formatting', 'Visual enhancements', 'Apply conditional formatting to highlight passing/failing grades and top performers.', 'https://www.youtube.com/watch?v=excel-grade-formatting', 600, 4, 0, 1),
(5, 'Project Solution', 'grade-calculator-solution', 'Complete solution walkthrough', 'Review the complete solution and compare with your implementation.', 'https://www.youtube.com/watch?v=excel-grade-solution', 600, 5, 0, 1);

-- ============================================
-- Module 5: Working with Text & Dates
-- ============================================
INSERT IGNORE INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Working with Text & Dates', 'Manipulate text and date data effectively', 6, 1);

INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(6, 'LEFT Function', 'left-function', 'Extract text from the left', 'LEFT(text, num_chars) extracts characters from the beginning of a text string.', 'https://www.youtube.com/watch?v=excel-left', 480, 1, 1, 1),
(6, 'RIGHT Function', 'right-function', 'Extract text from the right', 'RIGHT(text, num_chars) extracts characters from the end of a text string.', 'https://www.youtube.com/watch?v=excel-right', 420, 2, 1, 1),
(6, 'MID Function', 'mid-function', 'Extract text from the middle', 'MID(text, start_num, num_chars) extracts characters from the middle of a text string.', 'https://www.youtube.com/watch?v=excel-mid', 480, 3, 0, 1),
(6, 'LEN Function', 'len-function', 'Count characters in text', 'LEN(text) returns the number of characters in a text string.', 'https://www.youtube.com/watch?v=excel-len', 360, 4, 0, 1),
(6, 'TRIM Function', 'trim-function', 'Remove extra spaces', 'TRIM(text) removes all extra spaces from text, leaving only single spaces between words.', 'https://www.youtube.com/watch?v=excel-trim', 420, 5, 0, 1),
(6, 'CONCAT & TEXTJOIN', 'concat-textjoin', 'Combine text strings', 'CONCAT joins text strings together. TEXTJOIN provides more control with delimiters.', 'https://www.youtube.com/watch?v=excel-concat', 600, 6, 0, 1),
(6, 'Working with Dates', 'working-with-dates', 'Date calculations and formatting', 'Excel stores dates as serial numbers. Learn to calculate differences, add days, and format dates.', 'https://www.youtube.com/watch?v=excel-dates', 720, 7, 0, 1),
(6, 'Module 5 Quiz', 'module-5-quiz', 'Test text and date functions', 'Test your knowledge of text and date manipulation.', '', 300, 8, 0, 1);

-- ============================================
-- Module 6: Lookup & Reference Functions
-- ============================================
INSERT IGNORE INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Lookup & Reference Functions', 'Find and retrieve data efficiently', 7, 1);

INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(7, 'VLOOKUP Function', 'vlookup', 'Find data in columns', 'VLOOKUP(lookup_value, table_array, col_index, range_lookup) searches for a value in the first column and returns a value in the same row.', 'https://www.youtube.com/watch?v=excel-vlookup', 900, 1, 1, 1),
(7, 'HLOOKUP Function', 'hlookup', 'Find data in rows', 'HLOOKUP searches for a value in the first row and returns a value in the same column.', 'https://www.youtube.com/watch?v=excel-hlookup', 600, 2, 0, 1),
(7, 'XLOOKUP Function', 'xlookup', 'Modern replacement for VLOOKUP', 'XLOOKUP is the modern, more flexible replacement for VLOOKUP and HLOOKUP.', 'https://www.youtube.com/watch?v=excel-xlookup', 780, 3, 0, 1),
(7, 'INDEX Function', 'index-function', 'Return values at positions', 'INDEX(array, row_num, col_num) returns the value at a specific position in a range.', 'https://www.youtube.com/watch?v=excel-index', 600, 4, 0, 1),
(7, 'MATCH Function', 'match-function', 'Find positions of values', 'MATCH(lookup_value, lookup_array, match_type) returns the position of a value in a range.', 'https://www.youtube.com/watch?v=excel-match', 600, 5, 0, 1),
(7, 'INDEX + MATCH Combination', 'index-match', 'Powerful dynamic lookups', 'Combine INDEX and MATCH for more flexible and powerful lookups than VLOOKUP.', 'https://www.youtube.com/watch?v=excel-index-match', 900, 6, 0, 1),
(7, 'Practical Lookup Project', 'lookup-project', 'Apply your skills', 'Build a practical lookup system for sales data.', 'https://www.youtube.com/watch?v=excel-lookup-project', 720, 7, 0, 1),
(7, 'Module 6 Quiz', 'module-6-quiz', 'Test lookup functions', 'Test your understanding of lookup and reference functions.', '', 300, 8, 0, 1);

-- ============================================
-- MINI PROJECT 2: Sales Report with Lookup Table
-- ============================================
INSERT IGNORE INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Mini Project: Sales Report', 'Build a sales report with lookups', 8, 1);

INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(8, 'Project Setup', 'sales-report-setup', 'Create the data structure', 'Set up the sales report with product tables, pricing lookups, and sales data.', 'https://www.youtube.com/watch?v=excel-sales-setup', 600, 1, 0, 1),
(8, 'Implementing Lookups', 'sales-report-lookups', 'Add lookup formulas', 'Add VLOOKUP/XLOOKUP to retrieve product prices and details.', 'https://www.youtube.com/watch?v=excel-sales-lookups', 900, 2, 0, 1),
(8, 'Calculating Totals', 'sales-report-totals', 'Calculate sales figures', 'Add formulas for quantity * price calculations and totals.', 'https://www.youtube.com/watch?v=excel-sales-totals', 600, 3, 0, 1),
(8, 'Project Solution', 'sales-report-solution', 'Review complete solution', 'Compare your solution with the complete implementation.', 'https://www.youtube.com/watch?v=excel-sales-solution', 600, 4, 0, 1);

-- ============================================
-- Module 7: Conditional Tools
-- ============================================
INSERT IGNORE INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Conditional Tools', 'Format and validate data intelligently', 9, 1);

INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(9, 'Conditional Formatting', 'conditional-formatting', 'Highlight important data', 'Use conditional formatting to automatically highlight cells based on their values or formulas.', 'https://www.youtube.com/watch?v=excel-conditional-formatting', 900, 1, 1, 1),
(9, 'Highlight Duplicates', 'highlight-duplicates', 'Find repeated data', 'Use conditional formatting to identify and highlight duplicate entries in your data.', 'https://www.youtube.com/watch?v=excel-duplicates', 480, 2, 0, 1),
(9, 'Data Validation', 'data-validation', 'Create dropdown lists', 'Control what data can be entered with validation rules and dropdown lists.', 'https://www.youtube.com/watch?v=excel-data-validation', 900, 3, 0, 1),
(9, 'Creating Dynamic Forms', 'dynamic-forms', 'Interactive data entry', 'Build dynamic forms with dependent dropdowns and smart validation.', 'https://www.youtube.com/watch?v=excel-dynamic-forms', 720, 4, 0, 1),
(9, 'Module 7 Quiz', 'module-7-quiz', 'Test conditional tools', 'Test your knowledge of conditional formatting and data validation.', '', 300, 5, 0, 1);

-- ============================================
-- Module 8: Pivot Tables (Very Important)
-- ============================================
INSERT IGNORE INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Pivot Tables', 'Master the most powerful data analysis tool', 10, 1);

INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(10, 'Introduction to Pivot Tables', 'pivot-tables-intro', 'What are Pivot Tables?', 'Pivot Tables are Excel\'s most powerful data analysis tool. They summarize large datasets with drag-and-drop simplicity.', 'https://www.youtube.com/watch?v=excel-pivot-intro', 600, 1, 1, 1),
(10, 'Creating Your First Pivot Table', 'create-pivot-table', 'Build a basic pivot table', 'Learn the step-by-step process of creating your first pivot table from source data.', 'https://www.youtube.com/watch?v=excel-create-pivot', 780, 2, 0, 1),
(10, 'Grouping Data in Pivot Tables', 'pivot-grouping', 'Group dates, numbers, and text', 'Group your data by dates (years, quarters, months), number ranges, or custom groups.', 'https://www.youtube.com/watch?v=excel-pivot-grouping', 720, 3, 0, 1),
(10, 'Filtering Pivot Tables', 'pivot-filtering', 'Slicers and report filters', 'Add multiple filters using Slicers and traditional pivot table filters.', 'https://www.youtube.com/watch?v=excel-pivot-filtering', 600, 4, 0, 1),
(10, 'Pivot Charts', 'pivot-charts', 'Visualize pivot data', 'Create charts that update automatically with your pivot table changes.', 'https://www.youtube.com/watch?v=excel-pivot-charts', 720, 5, 0, 1),
(10, 'Slicers', 'excel-slicers', 'Interactive filtering', 'Add professional-looking interactive filters that work across multiple pivot tables.', 'https://www.youtube.com/watch?v=excel-slicers', 480, 6, 0, 1),
(10, 'Pivot Table Practice Project', 'pivot-project', 'Real-world practice', 'Apply your pivot table skills to a comprehensive dataset.', 'https://www.youtube.com/watch?v=excel-pivot-project', 900, 7, 0, 1),
(10, 'Module 8 Quiz', 'module-8-quiz', 'Test pivot table skills', 'Test your understanding of pivot tables and charts.', '', 300, 8, 0, 1);

-- ============================================
-- MINI PROJECT 3: Business Sales Dashboard
-- ============================================
INSERT IGNORE INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Mini Project: Business Sales Dashboard', 'Create an interactive sales dashboard', 11, 1);

INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(11, 'Dashboard Planning', 'sales-dashboard-planning', 'Design your dashboard', 'Plan the layout and metrics for your interactive sales dashboard.', 'https://www.youtube.com/watch?v=excel-dashboard-planning', 480, 1, 0, 1),
(11, 'Creating Pivot Tables', 'dashboard-pivots', 'Build analysis tables', 'Create multiple pivot tables for different views of your sales data.', 'https://www.youtube.com/watch?v=excel-dashboard-pivots', 900, 2, 0, 1),
(11, 'Adding Pivot Charts', 'dashboard-charts', 'Visualize the data', 'Add charts to represent each metric visually.', 'https://www.youtube.com/watch?v=excel-dashboard-charts', 780, 3, 0, 1),
(11, 'Adding Slicers', 'dashboard-slicers', 'Make it interactive', 'Connect slicers for filtering all charts at once.', 'https://www.youtube.com/watch?v=excel-dashboard-slicers', 600, 4, 0, 1),
(11, 'Final Dashboard Walkthrough', 'dashboard-final', 'Complete solution', 'Review the complete professional dashboard.', 'https://www.youtube.com/watch?v=excel-dashboard-final', 600, 5, 0, 1);

-- ============================================
-- Module 9: Advanced Functions
-- ============================================
INSERT IGNORE INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Advanced Functions', 'Take your formulas to the next level', 12, 1);

INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(12, 'IFERROR Function', 'iferror', 'Handle errors gracefully', 'IFERROR(value, value_if_error) returns a custom result when a formula produces an error.', 'https://www.youtube.com/watch?v=excel-iferror', 480, 1, 1, 1),
(12, 'SUMIF & COUNTIF', 'sumif-countif', 'Conditional calculations', 'SUMIF and COUNTIF perform calculations based on a single condition.', 'https://www.youtube.com/watch?v=excel-sumif', 720, 2, 0, 1),
(12, 'SUMIFS & COUNTIFS', 'sumifs-countifs', 'Multiple condition sums', 'SUMIFS and COUNTIFS perform calculations based on multiple conditions.', 'https://www.youtube.com/watch?v=excel-sumifs', 780, 3, 0, 1),
(12, 'Advanced Logical Functions', 'advanced-logical', 'AND, OR, NOT', 'Combine multiple conditions with AND, OR, and NOT functions.', 'https://www.youtube.com/watch?v=excel-advanced-logical', 600, 4, 0, 1),
(12, 'Dynamic Arrays', 'dynamic-arrays', 'SPILL functions', 'Learn about FILTER, SORT, UNIQUE, and other dynamic array functions.', 'https://www.youtube.com/watch?v=excel-dynamic-arrays', 900, 5, 0, 1),
(12, 'Module 9 Quiz', 'module-9-quiz', 'Test advanced functions', 'Test your knowledge of advanced Excel functions.', '', 300, 6, 0, 1);

-- ============================================
-- Module 10: Data Cleaning & Transformation
-- ============================================
INSERT IGNORE INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Data Cleaning & Transformation', 'Prepare data for analysis', 13, 1);

INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(13, 'Removing Duplicates', 'remove-duplicates', 'Clean your data', 'Use the Remove Duplicates feature to eliminate redundant records.', 'https://www.youtube.com/watch?v=excel-remove-duplicates', 480, 1, 1, 1),
(13, 'Text to Columns', 'text-to-columns', 'Split data into columns', 'Split text in one column into multiple columns using delimiters.', 'https://www.youtube.com/watch?v=excel-text-columns', 600, 2, 0, 1),
(13, 'Cleaning Large Datasets', 'cleaning-large-data', 'Best practices', 'Techniques for cleaning and preparing large datasets for analysis.', 'https://www.youtube.com/watch?v=excel-clean-data', 720, 3, 0, 1),
(13, 'Power Query Basics', 'power-query-basics', 'Introduction to Get & Transform', 'Learn the basics of Power Query for advanced data transformation.', 'https://www.youtube.com/watch?v=excel-power-query', 900, 4, 0, 1),
(13, 'Importing External Data', 'import-external-data', 'Connect to other sources', 'Import data from CSV, text files, databases, and other sources.', 'https://www.youtube.com/watch?v=excel-import-data', 600, 5, 0, 1),
(13, 'Module 10 Quiz', 'module-10-quiz', 'Test data cleaning skills', 'Test your knowledge of data cleaning and transformation.', '', 300, 6, 0, 1);

-- ============================================
-- Module 11: Dashboards & Reporting
-- ============================================
INSERT IGNORE INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Dashboards & Reporting', 'Create professional data presentations', 14, 1);

INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(14, 'Designing Clean Reports', 'design-clean-reports', 'Layout principles', 'Learn principles for creating clean, professional reports.', 'https://www.youtube.com/watch?v=excel-clean-reports', 600, 1, 1, 1),
(14, 'Creating Charts', 'creating-charts', 'Data visualization basics', 'Create various chart types for different data presentations.', 'https://www.youtube.com/watch?v=excel-charts', 780, 2, 0, 1),
(14, 'Combining Multiple Charts', 'combine-charts', 'Complex visualizations', 'Combine multiple chart types and create combination charts.', 'https://www.youtube.com/watch?v=excel-combine-charts', 600, 3, 0, 1),
(14, 'Dashboard Layout Principles', 'dashboard-layout', 'Visual organization', 'Learn best practices for dashboard layout and visual hierarchy.', 'https://www.youtube.com/watch?v=excel-dashboard-layout', 720, 4, 0, 1),
(14, 'Interactive Dashboard with Slicers', 'interactive-dashboard', 'Add interactivity', 'Create fully interactive dashboards with connected slicers.', 'https://www.youtube.com/watch?v=excel-interactive-dashboard', 900, 5, 0, 1),
(14, 'Final Project Walkthrough', 'dashboard-final-walkthrough', 'Complete dashboard', 'Watch the creation of a complete professional dashboard.', 'https://www.youtube.com/watch?v=excel-dashboard-complete', 600, 6, 0, 1);

-- ============================================
-- CAPSTONE PROJECT: Complete Business Dashboard
-- ============================================
INSERT IGNORE INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Capstone Project: Business Dashboard', 'Build a complete real-world dashboard', 15, 1);

INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(15, 'Project Overview', 'capstone-overview', 'What we will build', 'Overview of the comprehensive business dashboard you will create.', 'https://www.youtube.com/watch?v=excel-capstone-intro', 300, 1, 0, 1),
(15, 'Data Setup & Cleaning', 'capstone-data', 'Prepare source data', 'Set up and clean the data for your dashboard project.', 'https://www.youtube.com/watch?v=excel-capstone-data', 900, 2, 0, 1),
(15, 'Building Pivot Tables', 'capstone-pivots', 'Create analysis tables', 'Build all necessary pivot tables for the dashboard.', 'https://www.youtube.com/watch?v=excel-capstone-pivots', 1200, 3, 0, 1),
(15, 'Creating Visualizations', 'capstone-charts', 'Add charts and KPIs', 'Create charts, KPIs, and metrics displays.', 'https://www.youtube.com/watch?v=excel-capstone-charts', 1200, 4, 0, 1),
(15, 'Final Dashboard Assembly', 'capstone-assembly', 'Put it all together', 'Assemble all elements into a cohesive dashboard.', 'https://www.youtube.com/watch?v=excel-capstone-assembly', 900, 5, 0, 1);

-- ============================================
-- Module 12: Real-World Applications
-- ============================================
INSERT IGNORE INTO modules (course_id, title, description, order_index, is_published) VALUES
(1, 'Real-World Applications', 'Job-ready Excel skills', 16, 1);

INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(16, 'Financial Reporting Model', 'financial-reporting', 'Build financial models', 'Create a comprehensive financial reporting model.', 'https://www.youtube.com/watch?v=excel-financial-model', 1200, 1, 1, 1),
(16, 'HR Attendance Tracker', 'hr-attendance', 'Track employee attendance', 'Build an HR attendance and leave tracking system.', 'https://www.youtube.com/watch?v=excel-hr-tracker', 900, 2, 0, 1),
(16, 'Inventory Management Sheet', 'inventory-management', 'Track inventory', 'Create an inventory management system.', 'https://www.youtube.com/watch?v=excel-inventory', 900, 3, 0, 1),
(16, 'Budget Planner', 'budget-planner', 'Personal/business budgets', 'Build a comprehensive budget planner template.', 'https://www.youtube.com/watch?v=excel-budget', 720, 4, 0, 1),
(16, 'Final Assessment', 'excel-final-assessment', 'Comprehensive test', 'Demonstrate your mastery of all Excel skills.', '', 1800, 5, 0, 1);

-- ============================================
-- QUIZZES FOR ALL MODULES
-- ============================================

-- Quiz for Module 2 (Working with Data)
INSERT IGNORE INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(1, 2, 10, 'Working with Data Quiz', 'Test data entry, formatting, sorting, and filtering', 15, 70.00, 0, 1);

-- Quiz for Module 3 (Basic Formulas)
INSERT IGNORE INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(1, 3, 8, 'Basic Formulas Quiz', 'Test your formula writing skills', 15, 70.00, 0, 1);

-- Quiz for Module 4 (Essential Functions)
INSERT IGNORE INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(1, 4, 8, 'Essential Functions Quiz', 'Test SUM, AVERAGE, IF, and nested functions', 20, 70.00, 0, 1);

-- Quiz for Module 5 (Text & Dates)
INSERT IGNORE INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(1, 5, 8, 'Text & Dates Quiz', 'Test text and date manipulation', 15, 70.00, 0, 1);

-- Quiz for Module 6 (Lookup Functions)
INSERT IGNORE INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(1, 6, 8, 'Lookup Functions Quiz', 'Test VLOOKUP, XLOOKUP, INDEX, MATCH', 20, 70.00, 0, 1);

-- Quiz for Module 7 (Conditional Tools)
INSERT IGNORE INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(1, 7, 5, 'Conditional Tools Quiz', 'Test conditional formatting and data validation', 15, 70.00, 0, 1);

-- Quiz for Module 8 (Pivot Tables)
INSERT IGNORE INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(1, 8, 8, 'Pivot Tables Quiz', 'Test your pivot table mastery', 20, 70.00, 0, 1);

-- Quiz for Module 9 (Advanced Functions)
INSERT IGNORE INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(1, 9, 6, 'Advanced Functions Quiz', 'Test IFERROR, SUMIFS, dynamic arrays', 20, 70.00, 0, 1);

-- Quiz for Module 10 (Data Cleaning)
INSERT IGNORE INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(1, 10, 6, 'Data Cleaning Quiz', 'Test data cleaning and Power Query', 15, 70.00, 0, 1);

-- Final Excel Exam
INSERT IGNORE INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(1, 16, 5, 'Excel Final Exam', 'Comprehensive final assessment covering all topics', 60, 70.00, 1, 1);
