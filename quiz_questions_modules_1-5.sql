-- ============================================
-- Quiz Questions for Modules 1 to 5
-- 10 questions per module
-- ============================================

-- ============================================
-- Module 1: Getting Started with Excel
-- Quiz ID: 121 (from actual database)
-- ============================================

-- Question 1
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(121, 'multiple_choice', 'What is the default file extension for Excel workbooks?', '.xlsx is the default file extension for Excel workbooks created in Excel 2007 and later.', 1.00, 1);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), '.xls', 0, 1),
(LAST_INSERT_ID(), '.xlsx', 1, 2),
(LAST_INSERT_ID(), '.csv', 0, 3),
(LAST_INSERT_ID(), '.xlsm', 0, 4);

-- Question 2
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(121, 'multiple_choice', 'What is the intersection of a row and column called?', 'The intersection of a row and column in Excel is called a cell.', 1.00, 2);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'Box', 0, 1),
(LAST_INSERT_ID(), 'Cell', 1, 2),
(LAST_INSERT_ID(), 'Field', 0, 3),
(LAST_INSERT_ID(), 'Range', 0, 4);

-- Question 3
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(121, 'true_false', 'Excel can only handle numerical data.', 'Excel can handle various types of data including text, numbers, dates, and formulas.', 1.00, 3);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'True', 0, 1),
(LAST_INSERT_ID(), 'False', 1, 2);

-- Question 4
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(121, 'multiple_choice', 'Which ribbon tab contains the "Save" and "Open" commands?', 'The File tab in Excel contains commands related to file operations.', 1.00, 4);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'Home', 0, 1),
(LAST_INSERT_ID(), 'Insert', 0, 2),
(LAST_INSERT_ID(), 'File', 1, 3),
(LAST_INSERT_ID(), 'View', 0, 4);

-- Question 5
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(121, 'multiple_choice', 'What keyboard shortcut is used to copy selected cells?', 'Ctrl+C is the standard keyboard shortcut for copying.', 1.00, 5);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'Ctrl+X', 0, 1),
(LAST_INSERT_ID(), 'Ctrl+C', 1, 2),
(LAST_INSERT_ID(), 'Ctrl+V', 0, 3),
(LAST_INSERT_ID(), 'Ctrl+Z', 0, 4);

-- Question 6
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(121, 'multiple_choice', 'What is the function of the Formula Bar in Excel?', 'The Formula Bar is used to view and edit formulas and data in cells.', 1.00, 6);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'To display the active cell address', 0, 1),
(LAST_INSERT_ID(), 'To view and edit formulas and data', 1, 2),
(LAST_INSERT_ID(), 'To format cells', 0, 3),
(LAST_INSERT_ID(), 'To insert charts', 0, 4);

-- Question 7
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(121, 'true_false', 'You can undo multiple actions in Excel using Ctrl+Z.', 'Excel allows you to undo up to 100 previous actions using Ctrl+Z.', 1.00, 7);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'True', 1, 1),
(LAST_INSERT_ID(), 'False', 0, 2);

-- Question 8
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(121, 'multiple_choice', 'Which feature allows you to quickly fill a series of data?', 'Autofill allows you to quickly fill a series of data in Excel.', 1.00, 8);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'Fill Handle', 1, 1),
(LAST_INSERT_ID(), 'Merge Cells', 0, 2),
(LAST_INSERT_ID(), 'Conditional Formatting', 0, 3),
(LAST_INSERT_ID(), 'Data Validation', 0, 4);

-- Question 9
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(121, 'multiple_choice', 'What does the "Wrap Text" feature do?', 'Wrap Text allows text to wrap within a cell instead of overflowing.', 1.00, 9);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'It wraps data around a chart', 0, 1),
(LAST_INSERT_ID(), 'It wraps text within a cell', 1, 2),
(LAST_INSERT_ID(), 'It wraps the workbook in a zip file', 0, 3),
(LAST_INSERT_ID(), 'It wraps text around a shape', 0, 4);

-- Question 10
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(121, 'multiple_choice', 'What is the keyboard shortcut to select all cells in a worksheet?', 'Ctrl+A is used to select all cells in a worksheet.', 1.00, 10);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'Ctrl+S', 0, 1),
(LAST_INSERT_ID(), 'Ctrl+A', 1, 2),
(LAST_INSERT_ID(), 'Ctrl+All', 0, 3),
(LAST_INSERT_ID(), 'Ctrl+Select', 0, 4);

-- ============================================
-- Module 2: Working with Data
-- Quiz ID: 111 (from actual database)
-- ============================================

-- Question 1
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(111, 'multiple_choice', 'What is the maximum number of characters a single cell can contain?', 'A single cell in Excel can contain up to 32,767 characters.', 1.00, 1);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), '1,000', 0, 1),
(LAST_INSERT_ID(), '32,767', 1, 2),
(LAST_INSERT_ID(), '65,535', 0, 3),
(LAST_INSERT_ID(), '1,048,576', 0, 4);

-- Question 2
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(111, 'multiple_choice', 'Which data type is automatically left-aligned in Excel?', 'Text data is automatically left-aligned in Excel cells.', 1.00, 2);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'Text', 1, 1),
(LAST_INSERT_ID(), 'Numbers', 0, 2),
(LAST_INSERT_ID(), 'Dates', 0, 3),
(LAST_INSERT_ID(), 'Formulas', 0, 4);

-- Question 3
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(111, 'true_false', 'You can apply different number formats to the same cell.', 'You can only apply one number format to a single cell at a time.', 1.00, 3);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'True', 0, 1),
(LAST_INSERT_ID(), 'False', 1, 2);

-- Question 4
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(111, 'multiple_choice', 'Which feature is used to remove duplicate values from a range?', 'The Remove Duplicates feature in Excel allows you to remove duplicate values.', 1.00, 4);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'Data Validation', 0, 1),
(LAST_INSERT_ID(), 'Remove Duplicates', 1, 2),
(LAST_INSERT_ID(), 'Conditional Formatting', 0, 3),
(LAST_INSERT_ID(), 'Flash Fill', 0, 4);

-- Question 5
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(111, 'multiple_choice', 'What is the default number of decimal places for numbers in Excel?', 'Numbers in Excel are by default displayed with no decimal places.', 1.00, 5);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), '0', 1, 1),
(LAST_INSERT_ID(), '1', 0, 2),
(LAST_INSERT_ID(), '2', 0, 3),
(LAST_INSERT_ID(), '3', 0, 4);

-- Question 6
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(111, 'true_false', 'You can use the "Format Painter" to copy cell formatting.', 'Format Painter allows you to copy formatting from one cell or range to another.', 1.00, 6);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'True', 1, 1),
(LAST_INSERT_ID(), 'False', 0, 2);

-- Question 7
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(111, 'multiple_choice', 'Which button is used to merge multiple cells into one?', 'The Merge & Center button allows you to merge cells and center content.', 1.00, 7);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'Wrap Text', 0, 1),
(LAST_INSERT_ID(), 'Merge & Center', 1, 2),
(LAST_INSERT_ID(), 'Align Center', 0, 3),
(LAST_INSERT_ID(), 'Center Across Selection', 0, 4);

-- Question 8
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(111, 'multiple_choice', 'What does the "Freeze Panes" feature do?', 'Freeze Panes allows you to keep specific rows or columns visible while scrolling.', 1.00, 8);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'It freezes the entire worksheet', 0, 1),
(LAST_INSERT_ID(), 'It keeps specific rows/columns visible while scrolling', 1, 2),
(LAST_INSERT_ID(), 'It prevents cell editing', 0, 3),
(LAST_INSERT_ID(), 'It locks cells', 0, 4);

-- Question 9
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(111, 'true_false', 'You can add a password to protect your workbook.', 'Excel allows you to password-protect workbooks and worksheets.', 1.00, 9);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'True', 1, 1),
(LAST_INSERT_ID(), 'False', 0, 2);

-- Question 10
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(111, 'multiple_choice', 'Which tab contains the "Conditional Formatting" feature?', 'Conditional Formatting is located on the Home tab.', 1.00, 10);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'Home', 1, 1),
(LAST_INSERT_ID(), 'Data', 0, 2),
(LAST_INSERT_ID(), 'Formulas', 0, 3),
(LAST_INSERT_ID(), 'Page Layout', 0, 4);

-- ============================================
-- Module 3: Basic Formulas
-- Quiz ID: 112 (from actual database)
-- ============================================

-- Question 1
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(112, 'multiple_choice', 'What character must all formulas start with?', 'All formulas in Excel must start with an equals sign (=).', 1.00, 1);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), '+', 0, 1),
(LAST_INSERT_ID(), '=', 1, 2),
(LAST_INSERT_ID(), '@', 0, 3),
(LAST_INSERT_ID(), '#', 0, 4);

-- Question 2
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(112, 'multiple_choice', 'What is the result of the formula =5*3+2?', 'Using order of operations, multiplication comes first: 5*3=15, then +2=17.', 1.00, 2);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), '25', 0, 1),
(LAST_INSERT_ID(), '17', 1, 2),
(LAST_INSERT_ID(), '21', 0, 3),
(LAST_INSERT_ID(), '15', 0, 4);

-- Question 3
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(112, 'true_false', 'Formulas in Excel are case-sensitive.', 'Excel formulas are not case-sensitive.', 1.00, 3);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'True', 0, 1),
(LAST_INSERT_ID(), 'False', 1, 2);

-- Question 4
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(112, 'multiple_choice', 'Which formula would add cells A1 and B1?', 'The formula =A1+B1 would add the contents of cells A1 and B1.', 1.00, 4);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), '=ADD(A1,B1)', 0, 1),
(LAST_INSERT_ID(), '=A1+B1', 1, 2),
(LAST_INSERT_ID(), '=SUM(A1-B1)', 0, 3),
(LAST_INSERT_ID(), '=TOTAL(A1,B1)', 0, 4);

-- Question 5
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(112, 'multiple_choice', 'What is the keyboard shortcut to enter a formula?', 'Pressing Enter completes and executes the formula.', 1.00, 5);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'Ctrl+Enter', 0, 1),
(LAST_INSERT_ID(), 'Enter', 1, 2),
(LAST_INSERT_ID(), 'Tab', 0, 3),
(LAST_INSERT_ID(), 'Ctrl+T', 0, 4);

-- Question 6
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(112, 'true_false', 'You can reference cells from different worksheets in a formula.', 'Excel allows cross-worksheet and cross-workbook cell references.', 1.00, 6);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'True', 1, 1),
(LAST_INSERT_ID(), 'False', 0, 2);

-- Question 7
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(112, 'multiple_choice', 'Which error message indicates a division by zero?', '#DIV/0! is the error for division by zero.', 1.00, 7);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), '#DIV/0!', 1, 1),
(LAST_INSERT_ID(), '#VALUE!', 0, 2),
(LAST_INSERT_ID(), '#REF!', 0, 3),
(LAST_INSERT_ID(), '#NAME?', 0, 4);

-- Question 8
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(112, 'multiple_choice', 'What is the result of the formula =10^3?', 'The ^ operator calculates exponents: 10^3 is 10*10*10 = 1000.', 1.00, 8);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), '100', 0, 1),
(LAST_INSERT_ID(), '30', 0, 2),
(LAST_INSERT_ID(), '1000', 1, 3),
(LAST_INSERT_ID(), '13', 0, 4);

-- Question 9
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(112, 'true_false', 'You can use cell references in formulas.', 'Using cell references makes formulas dynamic and reusable.', 1.00, 9);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'True', 1, 1),
(LAST_INSERT_ID(), 'False', 0, 2);

-- Question 10
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(112, 'multiple_choice', 'Which tool can help you debug complex formulas?', 'Evaluate Formula allows you to step through formula calculations.', 1.00, 10);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'AutoSum', 0, 1),
(LAST_INSERT_ID(), 'Evaluate Formula', 1, 2),
(LAST_INSERT_ID(), 'Flash Fill', 0, 3),
(LAST_INSERT_ID(), 'Goal Seek', 0, 4);

-- ============================================
-- Module 4: Essential Functions
-- Quiz ID: 113 (from actual database)
-- ============================================

-- Question 1
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(113, 'multiple_choice', 'What does the SUM function do?', 'SUM adds up all the numbers in a range of cells.', 1.00, 1);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'Finds the smallest value', 0, 1),
(LAST_INSERT_ID(), 'Adds up numbers', 1, 2),
(LAST_INSERT_ID(), 'Counts cells with data', 0, 3),
(LAST_INSERT_ID(), 'Calculates the average', 0, 4);

-- Question 2
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(113, 'true_false', 'You must use the SUM function to add numbers in Excel.', 'While SUM is efficient, you can also use the + operator.', 1.00, 2);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'True', 0, 1),
(LAST_INSERT_ID(), 'False', 1, 2);

-- Question 3
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(113, 'multiple_choice', 'Which function counts only numeric values in a range?', 'COUNT counts only numeric values, while COUNTA counts all non-empty cells.', 1.00, 3);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'COUNTA', 0, 1),
(LAST_INSERT_ID(), 'COUNT', 1, 2),
(LAST_INSERT_ID(), 'COUNTIF', 0, 3),
(LAST_INSERT_ID(), 'COUNTBLANK', 0, 4);

-- Question 4
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(113, 'multiple_choice', 'What is the syntax for the AVERAGE function?', 'AVERAGE takes a range of cells and calculates their average.', 1.00, 4);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), '=AVERAGE(value1, value2, ...)', 1, 1),
(LAST_INSERT_ID(), '=AVERAGE(range)', 0, 2),
(LAST_INSERT_ID(), '=AVERAGE(data1:data2)', 0, 3),
(LAST_INSERT_ID(), '=AVERAGE(total)', 0, 4);

-- Question 5
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(113, 'multiple_choice', 'Which function returns the smallest number in a range?', 'MIN returns the smallest value in a range.', 1.00, 5);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'MAX', 0, 1),
(LAST_INSERT_ID(), 'MIN', 1, 2),
(LAST_INSERT_ID(), 'SMALL', 0, 3),
(LAST_INSERT_ID(), 'LOW', 0, 4);

-- Question 6
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(113, 'true_false', 'The IF function can only test for one condition.', 'You can nest multiple IF functions to test for multiple conditions.', 1.00, 6);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'True', 0, 1),
(LAST_INSERT_ID(), 'False', 1, 2);

-- Question 7
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(113, 'multiple_choice', 'What does the NOW() function do?', 'NOW() returns the current date and time.', 1.00, 7);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'Returns the current date', 0, 1),
(LAST_INSERT_ID(), 'Returns the current time', 0, 2),
(LAST_INSERT_ID(), 'Returns the current date and time', 1, 3),
(LAST_INSERT_ID(), 'Returns tomorrow''s date', 0, 4);

-- Question 8
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(113, 'multiple_choice', 'Which function converts text to uppercase?', 'UPPER converts text to uppercase; LOWER converts to lowercase.', 1.00, 8);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'LOWER', 0, 1),
(LAST_INSERT_ID(), 'UPPER', 1, 2),
(LAST_INSERT_ID(), 'CAPITALIZE', 0, 3),
(LAST_INSERT_ID(), 'TEXT', 0, 4);

-- Question 9
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(113, 'true_false', 'You can use functions inside other functions.', 'Nested functions are a common and powerful feature in Excel.', 1.00, 9);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'True', 1, 1),
(LAST_INSERT_ID(), 'False', 0, 2);

-- Question 10
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(113, 'multiple_choice', 'What error would you get if a function name is misspelled?', '#NAME? indicates that Excel doesn''t recognize the function name.', 1.00, 10);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), '#DIV/0!', 0, 1),
(LAST_INSERT_ID(), '#VALUE!', 0, 2),
(LAST_INSERT_ID(), '#NAME?', 1, 3),
(LAST_INSERT_ID(), '#NUM!', 0, 4);

-- ============================================
-- Module 5: Working with Text & Dates
-- Quiz ID: 114 (from actual database)
-- ============================================

-- Question 1
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(114, 'multiple_choice', 'Which function returns the leftmost characters from a text string?', 'LEFT returns characters from the start of a text string.', 1.00, 1);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'LEFT', 1, 1),
(LAST_INSERT_ID(), 'RIGHT', 0, 2),
(LAST_INSERT_ID(), 'MID', 0, 3),
(LAST_INSERT_ID(), 'TEXTLEFT', 0, 4);

-- Question 2
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(114, 'true_false', 'You can combine text from different cells using the CONCAT function.', 'CONCAT is used to combine text from multiple cells.', 1.00, 2);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'True', 1, 1),
(LAST_INSERT_ID(), 'False', 0, 2);

-- Question 3
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(114, 'multiple_choice', 'What does the LEN function do?', 'LEN returns the number of characters in a text string.', 1.00, 3);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'Returns the length of a string', 1, 1),
(LAST_INSERT_ID(), 'Returns the left characters', 0, 2),
(LAST_INSERT_ID(), 'Returns uppercase text', 0, 3),
(LAST_INSERT_ID(), 'Returns the last character', 0, 4);

-- Question 4
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(114, 'multiple_choice', 'Which function removes all spaces from text except single spaces between words?', 'TRIM removes all extra spaces from text.', 1.00, 4);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'TRIM', 1, 1),
(LAST_INSERT_ID(), 'CLEAN', 0, 2),
(LAST_INSERT_ID(), 'STRIP', 0, 3),
(LAST_INSERT_ID(), 'REMOVE', 0, 4);

-- Question 5
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(114, 'multiple_choice', 'What does the TEXT function allow you to do?', 'TEXT converts a value to text with a specific format.', 1.00, 5);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'Convert text to numbers', 0, 1),
(LAST_INSERT_ID(), 'Format a number as text', 1, 2),
(LAST_INSERT_ID(), 'Concatenate text', 0, 3),
(LAST_INSERT_ID(), 'Count characters in text', 0, 4);

-- Question 6
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(114, 'true_false', 'Dates in Excel are stored as serial numbers.', 'Excel stores dates as sequential serial numbers to make calculations easier.', 1.00, 6);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'True', 1, 1),
(LAST_INSERT_ID(), 'False', 0, 2);

-- Question 7
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(114, 'multiple_choice', 'Which function returns the current date without time?', 'TODAY() returns the current date, NOW() returns date and time.', 1.00, 7);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'TODAY()', 1, 1),
(LAST_INSERT_ID(), 'NOW()', 0, 2),
(LAST_INSERT_ID(), 'CURDATE()', 0, 3),
(LAST_INSERT_ID(), 'DATE()', 0, 4);

-- Question 8
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(114, 'multiple_choice', 'What is the result of =DATE(2023,13,1)?', 'Excel automatically corrects invalid dates. January 1, 2024 is 13th month of 2023.', 1.00, 8);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'January 13, 2023', 0, 1),
(LAST_INSERT_ID(), 'January 1, 2024', 1, 2),
(LAST_INSERT_ID(), 'Error', 0, 3),
(LAST_INSERT_ID(), 'December 13, 2023', 0, 4);

-- Question 9
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(114, 'multiple_choice', 'Which function extracts characters from the middle of a text string?', 'MID extracts characters from any position within a text string.', 1.00, 9);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'LEFT', 0, 1),
(LAST_INSERT_ID(), 'RIGHT', 0, 2),
(LAST_INSERT_ID(), 'MID', 1, 3),
(LAST_INSERT_ID(), 'CENTER', 0, 4);

-- Question 10
INSERT INTO quiz_questions (quiz_id, question_type, question_text, explanation, points, order_index) VALUES
(114, 'true_false', 'You can use text functions on numeric data.', 'You can apply text functions to numeric data, but it will treat them as text.', 1.00, 10);

INSERT INTO quiz_options (question_id, option_text, is_correct, order_index) VALUES
(LAST_INSERT_ID(), 'True', 1, 1),
(LAST_INSERT_ID(), 'False', 0, 2);
