-- ============================================
-- DATA ANALYSIS PROGRAM - COMPLETE CURRICULUM
-- 10 Modules, 40+ Lessons, 10 Quizzes, 5 Mini Projects, 1 Capstone Project
-- Duration: 10-14 Weeks | Level: Beginner → Job-Ready Analyst
-- Tools Covered: Excel, SQL, Python (Intro), Power BI
-- ============================================

-- ============================================
-- Update Data Analysis Course Details
-- ============================================
UPDATE courses SET 
    title = 'Data Analysis Fundamentals: Excel, SQL, Python & Power BI',
    description = 'Master data analysis from scratch using Excel, SQL, Python (Pandas), and Power BI. Learn to transform raw data into actionable insights with hands-on projects, quizzes, and a comprehensive capstone project.',
    short_description = 'Complete data analysis course with Excel, SQL, Python & Power BI',
    price = 89.00,
    duration_hours = 55.00,
    level = 'beginner'
WHERE id = 9;

-- ============================================
-- PHASE 1: DATA ANALYSIS FOUNDATIONS (Beginner)
-- ============================================

-- ============================================
-- Module 1: Introduction to Data Analysis
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(9, 'Introduction to Data Analysis', 'Learn what data analysis is and the tools of the trade', 1, 1);

SET @module1_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module1_id, 'What is Data Analysis?', 'what-is-data-analysis', 'Understanding the data analysis field', 'Data analysis is the process of inspecting, cleansing, transforming, and modeling data to discover useful information, draw conclusions, and support decision-making.', 'https://www.youtube.com/watch?v=data-analysis-intro', 300, 1, 1, 1),
(@module1_id, 'Types of Data', 'types-of-data', 'Structured vs Unstructured', 'Learn about different data types: structured (tables, CSV), semi-structured (JSON, XML), and unstructured (text, images) data.', 'https://www.youtube.com/watch?v=data-types', 480, 2, 1, 1),
(@module1_id, 'Data Analysis Techniques', 'analysis-techniques', 'Descriptive, Diagnostic, Predictive', 'Explore the four main types of data analysis: Descriptive (what happened), Diagnostic (why it happened), Predictive (what will happen), and Prescriptive (what should happen).', 'https://www.youtube.com/watch?v=analysis-techniques', 600, 3, 0, 1),
(@module1_id, 'The Data Analysis Workflow', 'analysis-workflow', 'From raw data to insights', 'Understand the complete data analysis workflow: Data Collection → Data Cleaning → Exploratory Analysis → Modeling → Visualization → Presentation.', 'https://www.youtube.com/watch?v=analysis-workflow', 720, 4, 0, 1),
(@module1_id, 'Real-World Use Cases', 'real-world-use-cases', 'Industry applications', 'Explore how data analysis is used in finance, marketing, healthcare, and business decision-making.', 'https://www.youtube.com/watch?v=data-analysis-use-cases', 480, 5, 0, 1),
(@module1_id, 'Tools of a Data Analyst', 'data-analyst-tools', 'Excel, SQL, Python, Power BI', 'Overview of the essential tools every data analyst needs: Excel for spreadsheets, SQL for databases, Python for automation, and Power BI for visualization.', 'https://www.youtube.com/watch?v=data-analyst-tools', 600, 6, 0, 1),
(@module1_id, 'Module 1 Quiz', 'module-1-quiz', 'Test your fundamentals', 'Test your understanding of data analysis basics and the analyst toolset.', '', 300, 7, 0, 1);

-- ============================================
-- MINI PROJECT 1: Manual Data Analysis
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(9, 'Mini Project: Manual Data Analysis', 'Analyze a survey dataset manually', 2, 1);

SET @project1_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@project1_id, 'Project Overview', 'manual-analysis-overview', 'What we will analyze', 'In this mini project, you will manually analyze a survey dataset to extract meaningful insights about customer preferences and behavior.', 'https://www.youtube.com/watch?v=manual-analysis-intro', 300, 1, 0, 1),
(@project1_id, 'Understanding the Dataset', 'survey-dataset', 'Explore the data structure', 'Analyze the survey dataset structure, identify key fields, and understand the information being collected.', 'https://www.youtube.com/watch?v=survey-dataset', 480, 2, 0, 1),
(@project1_id, 'Data Cleaning & Preparation', 'data-preparation', 'Organize the survey data', 'Clean and prepare the raw survey data for analysis by fixing inconsistencies and missing values.', 'https://www.youtube.com/watch?v=data-preparation', 600, 3, 0, 1),
(@project1_id, 'Analyzing Patterns', 'analyzing-patterns', 'Find meaningful insights', 'Identify patterns, trends, and correlations in the survey responses using manual analysis techniques.', 'https://www.youtube.com/watch?v=analyzing-patterns', 900, 4, 0, 1),
(@project1_id, 'Presenting Insights', 'presenting-insights', 'Communicate your findings', 'Learn to present your analysis clearly through tables, charts, and written summaries.', 'https://www.youtube.com/watch?v=presenting-insights', 600, 5, 0, 1),
(@project1_id, 'Project Solution', 'analysis-solution', 'Complete walkthrough', 'Review the complete solution and compare with your analysis.', 'https://www.youtube.com/watch?v=analysis-solution', 600, 6, 0, 1);

-- ============================================
-- Module 2: Excel for Data Analysis (Review & Upgrade)
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(9, 'Excel for Data Analysis', 'Advanced Excel for analysts', 3, 1);

SET @module2_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module2_id, 'Module 2 Introduction', 'excel-analysis-intro', 'Excel for professional analysts', 'This module covers Excel skills specifically tailored for data analysis, building on basic Excel knowledge with advanced techniques.', 'https://www.youtube.com/watch?v=excel-analysis-intro', 300, 1, 1, 1),
(@module2_id, 'Cleaning Messy Data', 'cleaning-messy-data', 'Prepare data for analysis', 'Learn to identify and fix messy data: duplicates, missing values, inconsistent formatting, and outliers.', 'https://www.youtube.com/watch?v=cleaning-messy-data', 900, 2, 1, 1),
(@module2_id, 'Sorting & Advanced Filtering', 'advanced-filtering', 'Powerful data filtering', 'Master Excel\'s advanced filtering capabilities including custom filters, text filtering, and dynamic filtering.', 'https://www.youtube.com/watch?v=advanced-filtering', 720, 3, 0, 1),
(@module2_id, 'Conditional Formatting for Insights', 'conditional-formatting', 'Visual data highlighting', 'Use conditional formatting to automatically highlight key data points and patterns in your spreadsheets.', 'https://www.youtube.com/watch?v=conditional-formatting', 600, 4, 0, 1),
(@module2_id, 'Pivot Tables for Analysis', 'pivot-tables-analysis', 'Summarize large datasets', 'Create powerful pivot tables to summarize, analyze, and explore large datasets quickly.', 'https://www.youtube.com/watch?v=pivot-tables-analysis', 900, 5, 0, 1),
(@module2_id, 'Basic Dashboard Creation', 'basic-dashboards', 'Create Excel dashboards', 'Build simple but effective dashboards in Excel to monitor key metrics and KPIs.', 'https://www.youtube.com/watch?v=excel-dashboards', 780, 6, 0, 1),
(@module2_id, 'Excel Practice Dataset', 'excel-practice', 'Hands-on practice', 'Apply your Excel analysis skills to a real-world practice dataset.', 'https://www.youtube.com/watch?v=excel-practice', 900, 7, 0, 1),
(@module2_id, 'Module 2 Quiz', 'module-2-quiz', 'Test Excel skills', 'Test your advanced Excel for data analysis capabilities.', '', 300, 8, 0, 1);

-- ============================================
-- MINI PROJECT 2: Sales Performance Analysis
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(9, 'Mini Project: Sales Performance Analysis', 'Analyze sales data in Excel', 4, 1);

SET @project2_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@project2_id, 'Project Overview', 'sales-analysis-overview', 'Sales performance project', 'Analyze a company''s sales performance over time to identify trends, top products, and underperforming regions.', 'https://www.youtube.com/watch?v=sales-analysis-intro', 300, 1, 0, 1),
(@project2_id, 'Importing & Cleaning Data', 'sales-data-cleaning', 'Prepare sales data', 'Import sales data into Excel and clean it to remove duplicates, fix formatting, and handle missing values.', 'https://www.youtube.com/watch?v=sales-data-cleaning', 600, 2, 0, 1),
(@project2_id, 'Creating Pivot Tables', 'sales-pivot-tables', 'Build analysis tables', 'Create pivot tables to summarize sales by product, region, and time period.', 'https://www.youtube.com/watch?v=sales-pivot-tables', 900, 3, 0, 1),
(@project2_id, 'Adding Charts', 'sales-charts', 'Visualize the data', 'Create charts (bar, line, pie) to visualize sales trends and patterns.', 'https://www.youtube.com/watch?v=sales-charts', 720, 4, 0, 1),
(@project2_id, 'Analyzing Key Metrics', 'key-metrics', 'Calculate KPIs', 'Calculate and analyze key sales metrics: total revenue, average order value, growth rates, and regional performance.', 'https://www.youtube.com/watch?v=key-metrics', 900, 5, 0, 1),
(@project2_id, 'Project Solution', 'sales-analysis-solution', 'Complete solution', 'Review the complete sales analysis project with detailed explanations.', 'https://www.youtube.com/watch?v=sales-analysis-solution', 600, 6, 0, 1);

-- ============================================
-- PHASE 2: SQL FOR DATA ANALYSIS
-- ============================================

-- ============================================
-- Module 3: SQL Fundamentals
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(9, 'SQL Fundamentals', 'Master database querying', 5, 1);

SET @module3_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module3_id, 'Module 3 Introduction', 'sql-introduction', 'What is SQL?', 'SQL (Structured Query Language) is the standard language for working with relational databases. This module teaches you the fundamentals of SQL querying.', 'https://www.youtube.com/watch?v=sql-introduction', 300, 1, 1, 1),
(@module3_id, 'Understanding Databases & Tables', 'database-structure', 'Relational database basics', 'Learn about database tables, relationships, primary keys, foreign keys, and the relational database model.', 'https://www.youtube.com/watch?v=database-structure', 600, 2, 1, 1),
(@module3_id, 'SELECT Statement', 'select-statement', 'Retrieve data', 'The SELECT statement is the most important SQL command. Learn to retrieve data from tables.', 'https://www.youtube.com/watch?v=select-statement', 720, 3, 1, 1),
(@module3_id, 'WHERE Clause', 'where-clause', 'Filter data', 'Use the WHERE clause to filter your query results based on specific conditions.', 'https://www.youtube.com/watch?v=where-clause', 600, 4, 0, 1),
(@module3_id, 'ORDER BY', 'order-by', 'Sort results', 'Sort your query results with the ORDER BY clause.', 'https://www.youtube.com/watch?v=order-by', 480, 5, 0, 1),
(@module3_id, 'LIMIT Clause', 'limit-clause', 'Limit results', 'Control the number of results returned with the LIMIT clause.', 'https://www.youtube.com/watch?v=limit-clause', 360, 6, 0, 1),
(@module3_id, 'Module 3 Quiz', 'module-3-quiz', 'Test SQL basics', 'Test your understanding of SQL fundamentals.', '', 300, 7, 0, 1);

-- ============================================
-- Module 4: Intermediate SQL
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(9, 'Intermediate SQL', 'Advanced querying techniques', 6, 1);

SET @module4_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module4_id, 'Module 4 Introduction', 'intermediate-sql-intro', 'Taking SQL further', 'This module builds on SQL fundamentals with advanced querying techniques.', 'https://www.youtube.com/watch?v=intermediate-sql-intro', 300, 1, 1, 1),
(@module4_id, 'GROUP BY', 'group-by', 'Group data', 'Group your query results by specific columns and apply aggregate functions.', 'https://www.youtube.com/watch?v=group-by', 600, 2, 1, 1),
(@module4_id, 'Aggregate Functions', 'aggregate-functions', 'COUNT, SUM, AVG', 'Master aggregate functions: COUNT, SUM, AVG, MIN, MAX for data analysis.', 'https://www.youtube.com/watch?v=aggregate-functions', 720, 3, 0, 1),
(@module4_id, 'HAVING Clause', 'having-clause', 'Filter groups', 'Filter grouped data with the HAVING clause (similar to WHERE but for groups).', 'https://www.youtube.com/watch?v=having-clause', 600, 4, 0, 1),
(@module4_id, 'JOINS', 'sql-joins', 'Combine tables', 'Learn INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL OUTER JOIN to combine data from multiple tables.', 'https://www.youtube.com/watch?v=sql-joins', 900, 5, 0, 1),
(@module4_id, 'Subqueries', 'subqueries', 'Nested queries', 'Use subqueries (nested queries) to solve complex data retrieval problems.', 'https://www.youtube.com/watch?v=subqueries', 780, 6, 0, 1),
(@module4_id, 'Practice Dataset', 'sql-practice', 'Hands-on practice', 'Apply your SQL skills to a practice database with multiple related tables.', 'https://www.youtube.com/watch?v=sql-practice', 900, 7, 0, 1),
(@module4_id, 'Module 4 Quiz', 'module-4-quiz', 'Test intermediate SQL', 'Test your advanced SQL querying skills.', '', 300, 8, 0, 1);

-- ============================================
-- MINI PROJECT 3: Customer Transaction Analysis
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(9, 'Mini Project: Customer Transaction Analysis', 'SQL database analysis', 7, 1);

SET @project3_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@project3_id, 'Project Overview', 'customer-transactions-overview', 'Database project', 'Analyze customer transaction data to understand purchasing patterns, customer behavior, and sales performance.', 'https://www.youtube.com/watch?v=customer-transactions-intro', 300, 1, 0, 1),
(@project3_id, 'Database Schema', 'database-schema', 'Understand the data structure', 'Explore the database schema with tables for customers, orders, products, and transactions.', 'https://www.youtube.com/watch?v=database-schema', 480, 2, 0, 1),
(@project3_id, 'Writing Basic Queries', 'basic-transaction-queries', 'Simple data retrieval', 'Write basic SQL queries to retrieve transaction data.', 'https://www.youtube.com/watch?v=basic-transaction-queries', 720, 3, 0, 1),
(@project3_id, 'Advanced Analysis Queries', 'advanced-transaction-queries', 'Complex analysis', 'Write advanced SQL queries with JOINs, subqueries, and aggregate functions to analyze customer behavior.', 'https://www.youtube.com/watch?v=advanced-transaction-queries', 1200, 4, 0, 1),
(@project3_id, 'Analyzing Results', 'analyze-results', 'Interpret findings', 'Analyze the query results to derive business insights about customer behavior.', 'https://www.youtube.com/watch?v=analyze-results', 900, 5, 0, 1),
(@project3_id, 'Project Solution', 'customer-transactions-solution', 'Complete walkthrough', 'Review all query solutions and explanations.', 'https://www.youtube.com/watch?v=customer-transactions-solution', 600, 6, 0, 1);

-- ============================================
-- PHASE 3: PYTHON FOR DATA ANALYSIS (INTRO)
-- ============================================

-- ============================================
-- Module 5: Python Basics for Analysts
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(9, 'Python Basics for Analysts', 'Introduction to Python programming', 8, 1);

SET @module5_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module5_id, 'Module 5 Introduction', 'python-intro', 'Python for data analysis', 'Python is a powerful programming language for data analysis. This module teaches you Python fundamentals specifically for data work.', 'https://www.youtube.com/watch?v=python-intro', 300, 1, 1, 1),
(@module5_id, 'Installing Python & Jupyter', 'python-installation', 'Set up your environment', 'Learn to install Python and Jupyter Notebooks for interactive Python development.', 'https://www.youtube.com/watch?v=python-installation', 600, 2, 1, 1),
(@module5_id, 'Variables & Data Types', 'variables-data-types', 'Python basics', 'Understand Python variables, data types (strings, numbers, lists, dictionaries), and basic operations.', 'https://www.youtube.com/watch?v=variables-data-types', 720, 3, 1, 1),
(@module5_id, 'Lists & Dictionaries', 'data-structures', 'Organizing data', 'Master Python''s most useful data structures: lists and dictionaries for data manipulation.', 'https://www.youtube.com/watch?v=data-structures', 600, 4, 0, 1),
(@module5_id, 'Loops & Conditions', 'loops-conditions', 'Control flow', 'Learn to use for loops, while loops, and if-elif-else conditions for data processing.', 'https://www.youtube.com/watch?v=loops-conditions', 780, 5, 0, 1),
(@module5_id, 'Introduction to Pandas', 'pandas-introduction', 'Data analysis library', 'Introduction to the Pandas library - Python''s most powerful data analysis tool.', 'https://www.youtube.com/watch?v=pandas-introduction', 900, 6, 0, 1),
(@module5_id, 'Module 5 Quiz', 'module-5-quiz', 'Test Python basics', 'Test your Python programming fundamentals.', '', 300, 7, 0, 1);

-- ============================================
-- Module 6: Data Analysis with Pandas
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(9, 'Data Analysis with Pandas', 'Master the Pandas library', 9, 1);

SET @module6_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module6_id, 'Module 6 Introduction', 'pandas-advanced-intro', 'Advanced Pandas', 'This module covers essential Pandas operations for data analysis.', 'https://www.youtube.com/watch?v=pandas-advanced-intro', 300, 1, 1, 1),
(@module6_id, 'Reading CSV Files', 'read-csv-files', 'Load data', 'Learn to read CSV files into Pandas DataFrames for analysis.', 'https://www.youtube.com/watch?v=read-csv-files', 480, 2, 1, 1),
(@module6_id, 'Exploring Data', 'explore-data', 'Data inspection', 'Use Pandas to explore and inspect your data: head, tail, info, describe, and sample.', 'https://www.youtube.com/watch?v=explore-data', 600, 3, 0, 1),
(@module6_id, 'Cleaning Data', 'pandas-cleaning', 'Data preparation', 'Clean and prepare data using Pandas: handling missing values, removing duplicates.', 'https://www.youtube.com/watch?v=pandas-cleaning', 720, 4, 0, 1),
(@module6_id, 'Filtering Data', 'pandas-filtering', 'Selecting data', 'Filter and select specific data based on conditions using boolean indexing.', 'https://www.youtube.com/watch?v=pandas-filtering', 780, 5, 0, 1),
(@module6_id, 'Aggregating Data', 'pandas-aggregation', 'Group and summarize', 'Aggregate data using groupby and aggregate functions like sum, mean, count.', 'https://www.youtube.com/watch?v=pandas-aggregation', 600, 6, 0, 1),
(@module6_id, 'Basic Data Visualization', 'pandas-visualization', 'Plotting data', 'Create basic visualizations directly from Pandas DataFrames using Matplotlib integration.', 'https://www.youtube.com/watch?v=pandas-visualization', 720, 7, 0, 1),
(@module6_id, 'Module 6 Quiz', 'module-6-quiz', 'Test Pandas skills', 'Test your Pandas data analysis capabilities.', '', 300, 8, 0, 1);

-- ============================================
-- MINI PROJECT 4: Real Dataset Analysis
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(9, 'Mini Project: Real Dataset Analysis', 'Analyze with Pandas', 10, 1);

SET @project4_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@project4_id, 'Project Overview', 'real-dataset-overview', 'What we will analyze', 'Work with a real-world dataset from Kaggle to apply your Pandas skills.', 'https://www.youtube.com/watch?v=real-dataset-intro', 300, 1, 0, 1),
(@project4_id, 'Reading the Dataset', 'read-real-dataset', 'Load the data', 'Read the Kaggle dataset into Pandas and understand its structure.', 'https://www.youtube.com/watch?v=read-real-dataset', 480, 2, 0, 1),
(@project4_id, 'Data Cleaning', 'real-data-cleaning', 'Prepare the data', 'Clean the real dataset: handle missing values, remove duplicates, fix data types.', 'https://www.youtube.com/watch?v=real-data-cleaning', 900, 3, 0, 1),
(@project4_id, 'Exploratory Analysis', 'exploratory-analysis', 'Discover patterns', 'Perform exploratory data analysis to identify patterns and correlations.', 'https://www.youtube.com/watch?v=exploratory-analysis', 1200, 4, 0, 1),
(@project4_id, 'Creating Visualizations', 'pandas-visualization-project', 'Visualize findings', 'Create visualizations to communicate your analysis results clearly.', 'https://www.youtube.com/watch?v=pandas-visualization-project', 900, 5, 0, 1),
(@project4_id, 'Project Solution', 'real-dataset-solution', 'Complete walkthrough', 'Review the complete analysis and solution.', 'https://www.youtube.com/watch?v=real-dataset-solution', 600, 6, 0, 1);

-- ============================================
-- PHASE 4: POWER BI
-- ============================================

-- ============================================
-- Module 7: Power BI Basics
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(9, 'Power BI Basics', 'Introduction to Power BI', 11, 1);

SET @module7_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module7_id, 'Module 7 Introduction', 'powerbi-intro', 'What is Power BI?', 'Power BI is Microsoft''s business intelligence tool for creating interactive reports and dashboards.', 'https://www.youtube.com/watch?v=powerbi-intro', 300, 1, 1, 1),
(@module7_id, 'Connecting to Data Sources', 'connect-data-sources', 'Import your data', 'Learn to connect Power BI to various data sources: Excel, CSV, databases, and online services.', 'https://www.youtube.com/watch?v=connect-data-sources', 600, 2, 1, 1),
(@module7_id, 'Data Transformation', 'powerbi-transform', 'Clean and shape data', 'Use Power Query to transform and clean your data before visualization.', 'https://www.youtube.com/watch?v=powerbi-transform', 900, 3, 0, 1),
(@module7_id, 'Creating Basic Visualizations', 'basic-visualizations', 'Charts and tables', 'Create basic Power BI visualizations: bar charts, line charts, pie charts, tables.', 'https://www.youtube.com/watch?v=basic-visualizations', 780, 4, 0, 1),
(@module7_id, 'Publishing Reports', 'publishing-reports', 'Share your work', 'Publish your Power BI reports to Power BI Service for sharing and collaboration.', 'https://www.youtube.com/watch?v=publishing-reports', 480, 5, 0, 1),
(@module7_id, 'Module 7 Quiz', 'module-7-quiz', 'Test Power BI basics', 'Test your Power BI fundamentals.', '', 300, 6, 0, 1);

-- ============================================
-- Module 8: Advanced Power BI
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(9, 'Advanced Power BI', 'Advanced visualization and modeling', 12, 1);

SET @module8_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module8_id, 'Module 8 Introduction', 'advanced-powerbi-intro', 'Taking Power BI further', 'This module covers advanced Power BI techniques for professional report creation.', 'https://www.youtube.com/watch?v=advanced-powerbi-intro', 300, 1, 1, 1),
(@module8_id, 'Data Modeling', 'data-modeling', 'Create relationships', 'Design effective data models with table relationships and cardinality.', 'https://www.youtube.com/watch?v=data-modeling', 720, 2, 0, 1),
(@module8_id, 'DAX Basics', 'dax-basics', 'Data Analysis Expressions', 'Introduction to DAX (Data Analysis Expressions) - Power BI''s formula language.', 'https://www.youtube.com/watch?v=dax-basics', 900, 3, 0, 1),
(@module8_id, 'Calculated Columns', 'calculated-columns', 'DAX calculations', 'Create calculated columns using DAX for additional data fields.', 'https://www.youtube.com/watch?v=calculated-columns', 600, 4, 0, 1),
(@module8_id, 'Measures', 'dax-measures', 'Dynamic calculations', 'Build dynamic measures using DAX for real-time calculations.', 'https://www.youtube.com/watch?v=dax-measures', 900, 5, 0, 1),
(@module8_id, 'Interactive Dashboards', 'interactive-dashboards', 'Create dashboards', 'Build interactive dashboards with slicers, filters, and drill-through capabilities.', 'https://www.youtube.com/watch?v=interactive-dashboards', 1200, 6, 0, 1),
(@module8_id, 'Sharing Reports', 'sharing-reports', 'Collaboration features', 'Share and collaborate on Power BI reports with workspaces and permissions.', 'https://www.youtube.com/watch?v=sharing-reports', 480, 7, 0, 1),
(@module8_id, 'Module 8 Quiz', 'module-8-quiz', 'Test advanced Power BI', 'Test your advanced Power BI skills.', '', 300, 8, 0, 1);

-- ============================================
-- MINI PROJECT 5: Business Performance Dashboard
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(9, 'Mini Project: Business Performance Dashboard', 'Build an interactive dashboard', 13, 1);

SET @project5_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@project5_id, 'Project Overview', 'dashboard-project-overview', 'What we will build', 'Create an interactive business performance dashboard to monitor key metrics.', 'https://www.youtube.com/watch?v=dashboard-project-intro', 300, 1, 0, 1),
(@project5_id, 'Connecting Data', 'dashboard-data-connection', 'Import dashboard data', 'Connect Power BI to multiple data sources and import data.', 'https://www.youtube.com/watch?v=dashboard-data-connection', 480, 2, 0, 1),
(@project5_id, 'Data Transformation', 'dashboard-data-transform', 'Clean and prepare', 'Use Power Query to transform and clean the dashboard data.', 'https://www.youtube.com/watch?v=dashboard-data-transform', 900, 3, 0, 1),
(@project5_id, 'Creating Visualizations', 'dashboard-visualizations', 'Build charts and cards', 'Create interactive visualizations for your dashboard.', 'https://www.youtube.com/watch?v=dashboard-visualizations', 1200, 4, 0, 1),
(@project5_id, 'Adding Interactivity', 'dashboard-interactivity', 'Slicers and filters', 'Add slicers, filters, and drill-through for interactive dashboard experience.', 'https://www.youtube.com/watch?v=dashboard-interactivity', 780, 5, 0, 1),
(@project5_id, 'Project Solution', 'dashboard-solution', 'Complete walkthrough', 'Review the complete business dashboard project.', 'https://www.youtube.com/watch?v=dashboard-solution', 600, 6, 0, 1);

-- ============================================
-- PHASE 5: REAL-WORLD ANALYST SKILLS
-- ============================================

-- ============================================
-- Module 9: Data Cleaning Masterclass
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(9, 'Data Cleaning Masterclass', 'Advanced data preparation', 14, 1);

SET @module9_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module9_id, 'Module 9 Introduction', 'data-cleaning-intro', 'Why data cleaning matters', 'Data cleaning is one of the most important and time-consuming aspects of data analysis.', 'https://www.youtube.com/watch?v=data-cleaning-intro', 300, 1, 1, 1),
(@module9_id, 'Handling Missing Data', 'handling-missing-data', 'Dealing with null values', 'Learn techniques for handling missing data: deleting, imputing, and flagging.', 'https://www.youtube.com/watch?v=handling-missing-data', 720, 2, 0, 1),
(@module9_id, 'Removing Outliers', 'removing-outliers', 'Identify and handle outliers', 'Detect and remove outliers that can skew your analysis.', 'https://www.youtube.com/watch?v=removing-outliers', 600, 3, 0, 1),
(@module9_id, 'Data Normalization', 'data-normalization', 'Standardize your data', 'Normalize data to ensure consistency across different scales and formats.', 'https://www.youtube.com/watch?v=data-normalization', 780, 4, 0, 1),
(@module9_id, 'Data Transformation', 'data-transformation', 'Advanced data shaping', 'Transform data into the right format for analysis.', 'https://www.youtube.com/watch?v=data-transformation', 900, 5, 0, 1),
(@module9_id, 'Documentation Best Practices', 'documentation', 'Document your process', 'Learn best practices for documenting your data cleaning process.', 'https://www.youtube.com/watch?v=documentation', 480, 6, 0, 1);

-- ============================================
-- Module 10: Storytelling with Data
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(9, 'Storytelling with Data', 'Presenting insights effectively', 15, 1);

SET @module10_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module10_id, 'Module 10 Introduction', 'data-storytelling-intro', 'Why storytelling matters', 'Learn how to turn raw data into compelling stories that drive action.', 'https://www.youtube.com/watch?v=data-storytelling-intro', 300, 1, 1, 1),
(@module10_id, 'Choosing the Right Chart', 'choose-right-chart', 'Visualization best practices', 'Select the appropriate chart type for your data and message.', 'https://www.youtube.com/watch?v=choose-right-chart', 600, 2, 1, 1),
(@module10_id, 'Avoiding Misleading Visuals', 'avoid-misleading', 'Ethical data visualization', 'Learn to recognize and avoid misleading data visualizations.', 'https://www.youtube.com/watch?v=avoid-misleading', 480, 3, 0, 1),
(@module10_id, 'Creating Executive Reports', 'executive-reports', 'Professional presentations', 'Create professional executive reports that communicate insights clearly.', 'https://www.youtube.com/watch?v=executive-reports', 720, 4, 0, 1),
(@module10_id, 'Presenting Insights Clearly', 'presenting-clearly', 'Communication skills', 'Develop skills for presenting your data analysis findings effectively.', 'https://www.youtube.com/watch?v=presenting-clearly', 900, 5, 0, 1),
(@module10_id, 'Module 10 Quiz', 'module-10-quiz', 'Test storytelling skills', 'Test your data visualization and storytelling knowledge.', '', 300, 6, 0, 1);

-- ============================================
-- CAPSTONE PROJECT: Complete Data Analysis Project
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(9, 'Capstone Project: Complete Data Analysis', 'End-to-end data analysis', 16, 1);

SET @capstone_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@capstone_id, 'Project Overview', 'capstone-overview', 'What you will accomplish', 'This comprehensive capstone project covers all aspects of data analysis: cleaning, querying, analyzing, visualizing, and presenting.', 'https://www.youtube.com/watch?v=capstone-overview', 300, 1, 0, 1),
(@capstone_id, 'Cleaning Messy Data', 'capstone-data-cleaning', 'Data preparation', 'Clean and prepare the raw dataset using all the techniques you''ve learned.', 'https://www.youtube.com/watch?v=capstone-data-cleaning', 1800, 2, 0, 1),
(@capstone_id, 'Querying Database', 'capstone-sql', 'SQL queries', 'Write SQL queries to extract and analyze data from the database.', 'https://www.youtube.com/watch?v=capstone-sql', 1800, 3, 0, 1),
(@capstone_id, 'Analysis with Python', 'capstone-python', 'Pandas analysis', 'Analyze and visualize the data using Python and Pandas.', 'https://www.youtube.com/watch?v=capstone-python', 1800, 4, 0, 1),
(@capstone_id, 'Building Power BI Dashboard', 'capstone-powerbi', 'Dashboard creation', 'Create an interactive dashboard in Power BI to present your findings.', 'https://www.youtube.com/watch?v=capstone-powerbi', 1200, 5, 0, 1),
(@capstone_id, 'Presenting Insights', 'capstone-presentation', 'Final presentation', 'Learn to present your complete analysis in a professional manner.', 'https://www.youtube.com/watch?v=capstone-presentation', 600, 6, 0, 1);

-- ============================================
-- FINAL ASSESSMENT
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(9, 'Final Assessment', 'Comprehensive test', 17, 1);

SET @final_module_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@final_module_id, 'Final Exam', 'final-exam', 'Comprehensive test', 'Test your knowledge with this comprehensive final assessment covering all aspects of data analysis.', '', 1800, 1, 0, 1);

-- ============================================
-- QUIZZES FOR ALL MODULES
-- ============================================

-- Get the last lesson id for each module to create quizzes
SET @lesson7_id = (SELECT id FROM lessons WHERE module_id = @module1_id AND order_index = 7);
SET @lesson8_id = (SELECT id FROM lessons WHERE module_id = @module2_id AND order_index = 8);
SET @lesson7_id3 = (SELECT id FROM lessons WHERE module_id = @module3_id AND order_index = 7);
SET @lesson8_id4 = (SELECT id FROM lessons WHERE module_id = @module4_id AND order_index = 8);
SET @lesson7_id5 = (SELECT id FROM lessons WHERE module_id = @module5_id AND order_index = 7);
SET @lesson8_id6 = (SELECT id FROM lessons WHERE module_id = @module6_id AND order_index = 8);
SET @lesson6_id7 = (SELECT id FROM lessons WHERE module_id = @module7_id AND order_index = 6);
SET @lesson8_id8 = (SELECT id FROM lessons WHERE module_id = @module8_id AND order_index = 8);
SET @lesson6_id10 = (SELECT id FROM lessons WHERE module_id = @module10_id AND order_index = 6);
SET @lesson1_id17 = (SELECT id FROM lessons WHERE module_id = @final_module_id AND order_index = 1);

-- Quiz for Module 1 (Introduction to Data Analysis)
INSERT INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(9, @module1_id, @lesson7_id, 'Data Analysis Fundamentals Quiz', 'Test your understanding of data analysis basics', 15, 70.00, 0, 1);

-- Quiz for Module 2 (Excel for Data Analysis)
INSERT INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(9, @module2_id, @lesson8_id, 'Excel for Data Analysis Quiz', 'Test advanced Excel analysis skills', 20, 70.00, 0, 1);

-- Quiz for Module 3 (SQL Fundamentals)
INSERT INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(9, @module3_id, @lesson7_id3, 'SQL Fundamentals Quiz', 'Test your SQL basics', 15, 70.00, 0, 1);

-- Quiz for Module 4 (Intermediate SQL)
INSERT INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(9, @module4_id, @lesson8_id4, 'Intermediate SQL Quiz', 'Test advanced SQL skills', 20, 70.00, 0, 1);

-- Quiz for Module 5 (Python Basics)
INSERT INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(9, @module5_id, @lesson7_id5, 'Python Basics Quiz', 'Test Python fundamentals', 15, 70.00, 0, 1);

-- Quiz for Module 6 (Data Analysis with Pandas)
INSERT INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(9, @module6_id, @lesson8_id6, 'Pandas for Data Analysis Quiz', 'Test Pandas data analysis capabilities', 20, 70.00, 0, 1);

-- Quiz for Module 7 (Power BI Basics)
INSERT INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(9, @module7_id, @lesson6_id7, 'Power BI Basics Quiz', 'Test Power BI fundamentals', 15, 70.00, 0, 1);

-- Quiz for Module 8 (Advanced Power BI)
INSERT INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(9, @module8_id, @lesson8_id8, 'Advanced Power BI Quiz', 'Test advanced Power BI skills', 20, 70.00, 0, 1);

-- Quiz for Module 10 (Storytelling with Data)
INSERT INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(9, @module10_id, @lesson6_id10, 'Data Storytelling Quiz', 'Test data visualization and storytelling', 15, 70.00, 0, 1);

-- Final Data Analysis Exam
INSERT INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(9, @final_module_id, @lesson1_id17, 'Data Analysis Final Exam', 'Comprehensive final assessment covering all topics', 60, 70.00, 1, 1);

-- ============================================
-- SUCCESS MESSAGE
-- ============================================
SELECT '✅ Data Analysis program successfully created!';
SELECT '📊 17 modules, 60+ lessons, 10 quizzes, 5 mini projects, 1 capstone project';
SELECT '⏱ Duration: 10-14 weeks | Level: Beginner → Job-Ready Analyst';
