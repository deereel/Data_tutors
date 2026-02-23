-- ============================================
-- INCREMENTAL DATA INSERTION - Fixed Version
-- Uses dynamic lookups for module IDs
-- ============================================

-- Step 1: Insert missing courses
INSERT IGNORE INTO courses (title, slug, description, short_description, category, level, price, duration_hours, featured, published) VALUES
('Data Analysis Fundamentals', 'data-analysis-fundamentals', 'Learn data analysis from scratch using Excel, SQL, Python, and Power BI. Transform raw data into actionable insights.', 'Master data analysis with Excel, SQL, Python & Power BI', 'data-analysis', 'beginner', 79.00, 35.00, 1, 1);

INSERT IGNORE INTO courses (title, slug, description, short_description, category, level, price, duration_hours, featured, published) VALUES
('Data Automation Mastery', 'data-automation-mastery', 'Automate your workflows with Zapier, Make.com, Airtable, and N8N. Save time and increase productivity.', 'Automate workflows with Zapier, Make, Airtable & N8N', 'automation', 'intermediate', 69.00, 25.00, 1, 1);

-- ============================================
-- STEP 2: Insert modules for Data Analysis course (dynamic lookup)
-- ============================================
INSERT IGNORE INTO modules (course_id, title, description, order_index, is_published)
SELECT c.id, m.title, m.description, m.order_index, m.is_published
FROM (
    SELECT 'Introduction to Data Analysis' AS title, 'Understanding the fundamentals of data analysis' AS description, 1 AS order_index, 1 AS is_published
    UNION ALL SELECT 'Excel for Data Analysis', 'Advanced Excel techniques for data analysis', 2, 1
    UNION ALL SELECT 'SQL Fundamentals', 'Learn to query and manipulate databases', 3, 1
    UNION ALL SELECT 'Python for Data Analysis', 'Introduction to Python and Pandas', 4, 1
    UNION ALL SELECT 'Power BI Visualization', 'Create stunning visualizations with Power BI', 5, 1
) m
CROSS JOIN courses c
WHERE c.slug = 'data-analysis-fundamentals';

-- ============================================
-- STEP 2: Insert modules for Data Automation course (dynamic lookup)
-- ============================================
INSERT IGNORE INTO modules (course_id, title, description, order_index, is_published)
SELECT c.id, m.title, m.description, m.order_index, m.is_published
FROM (
    SELECT 'Introduction to Automation' AS title, 'Understanding workflow automation concepts' AS description, 1 AS order_index, 1 AS is_published
    UNION ALL SELECT 'Zapier Mastery', 'Automate tasks with Zapier', 2, 1
    UNION ALL SELECT 'Make.com (Integromat)', 'Create complex automation scenarios', 3, 1
    UNION ALL SELECT 'Airtable Databases', 'Build databases and automate workflows', 4, 1
    UNION ALL SELECT 'N8N Workflow Automation', 'Self-hosted automation with N8N', 5, 1
) m
CROSS JOIN courses c
WHERE c.slug = 'data-automation-mastery';

-- ============================================
-- STEP 3: Insert lessons for Data Analysis - Module 1
-- ============================================
INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published)
SELECT m.id, l.title, l.slug, l.description, l.content, l.video_url, l.video_duration, l.order_index, l.is_free, l.is_published
FROM (
    SELECT 'What is Data Analysis?' AS title, 'what-is-data-analysis' AS slug, 'Understanding the importance of data analysis' AS description, 'Data analysis is the process of inspecting, cleansing, transforming, and modeling data to discover useful information, draw conclusions, and support decision-making.' AS content, 'https://www.youtube.com/watch?v=daEDA' AS video_url, 480 AS video_duration, 1 AS order_index, 1 AS is_free, 1 AS is_published
    UNION ALL SELECT 'Types of Data', 'types-of-data', 'Understanding qualitative and quantitative data', 'Learn about different types of data and how to classify them for analysis.', 'https://www.youtube.com/watch?v=example-dq', 420, 2, 1, 1
    UNION ALL SELECT 'Data Collection Methods', 'data-collection-methods', 'How to gather data effectively', 'Explore various methods for collecting data for your analysis projects.', 'https://www.youtube.com/watch?v=example-dq2', 540, 3, 0, 1
    UNION ALL SELECT 'Data Cleaning Basics', 'data-cleaning-basics', 'Preparing your data for analysis', 'Learn essential data cleaning techniques to ensure accurate results.', 'https://www.youtube.com/watch?v=example-dq3', 600, 4, 0, 1
    UNION ALL SELECT 'Module 1 Quiz', 'data-analysis-module-1-quiz', 'Test your understanding of data analysis fundamentals', 'Test what you have learned in Module 1.', '', 300, 5, 0, 1
) l
JOIN modules m ON m.title = 'Introduction to Data Analysis'
JOIN courses c ON c.id = m.course_id AND c.slug = 'data-analysis-fundamentals';

-- ============================================
-- STEP 3: Insert lessons for Data Analysis - Module 2
-- ============================================
INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published)
SELECT m.id, l.title, l.slug, l.description, l.content, l.video_url, l.video_duration, l.order_index, l.is_free, l.is_published
FROM (
    SELECT 'Advanced Excel Formulas' AS title, 'advanced-excel-formulas' AS slug, 'Master complex Excel formulas' AS description, 'Learn advanced formulas like VLOOKUP, INDEX-MATCH, and array formulas.' AS content, 'https://www.youtube.com/watch?v=example-ex1' AS video_url, 720 AS video_duration, 1 AS order_index, 1 AS is_free, 1 AS is_published
    UNION ALL SELECT 'Pivot Tables Deep Dive', 'pivot-tables-deep-dive', 'Advanced pivot table techniques', 'Master pivot tables for powerful data analysis and reporting.', 'https://www.youtube.com/watch?v=example-ex2', 600, 2, 1, 1
    UNION ALL SELECT 'Power Query', 'power-query', 'Data transformation with Power Query', 'Learn to use Power Query for advanced data transformation.', 'https://www.youtube.com/watch?v=example-ex3', 540, 3, 0, 1
    UNION ALL SELECT 'Data Validation', 'data-validation', 'Ensuring data quality', 'Use data validation to control input quality in your spreadsheets.', 'https://www.youtube.com/watch?v=example-ex4', 420, 4, 0, 1
    UNION ALL SELECT 'Module 2 Quiz', 'data-analysis-module-2-quiz', 'Test your Excel skills', 'Test what you have learned in Module 2.', '', 300, 5, 0, 1
) l
JOIN modules m ON m.title = 'Excel for Data Analysis'
JOIN courses c ON c.id = m.course_id AND c.slug = 'data-analysis-fundamentals';

-- ============================================
-- STEP 3: Insert lessons for Data Analysis - Module 3
-- ============================================
INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published)
SELECT m.id, l.title, l.slug, l.description, l.content, l.video_url, l.video_duration, l.order_index, l.is_free, l.is_published
FROM (
    SELECT 'Introduction to SQL' AS title, 'introduction-to-sql' AS slug, 'Getting started with SQL' AS description, 'Learn the basics of SQL and database querying.' AS content, 'https://www.youtube.com/watch?v=example-sql1' AS video_url, 600 AS video_duration, 1 AS order_index, 1 AS is_free, 1 AS is_published
    UNION ALL SELECT 'SELECT Statements', 'select-statements', 'Retrieving data with SELECT', 'Master the SELECT statement to query databases effectively.', 'https://www.youtube.com/watch?v=example-sql2', 480, 2, 1, 1
    UNION ALL SELECT 'Filtering and Sorting', 'filtering-and-sorting', 'WHERE and ORDER BY clauses', 'Learn to filter and sort your query results.', 'https://www.youtube.com/watch?v=example-sql3', 420, 3, 0, 1
    UNION ALL SELECT 'JOIN Operations', 'join-operations', 'Combining data from multiple tables', 'Master INNER JOIN, LEFT JOIN, and other join types.', 'https://www.youtube.com/watch?v=example-sql4', 720, 4, 0, 1
    UNION ALL SELECT 'Module 3 Quiz', 'data-analysis-module-3-quiz', 'Test your SQL skills', 'Test what you have learned in Module 3.', '', 300, 5, 0, 1
) l
JOIN modules m ON m.title = 'SQL Fundamentals'
JOIN courses c ON c.id = m.course_id AND c.slug = 'data-analysis-fundamentals';

-- ============================================
-- STEP 3: Insert lessons for Data Analysis - Module 4
-- ============================================
INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published)
SELECT m.id, l.title, l.slug, l.description, l.content, l.video_url, l.video_duration, l.order_index, l.is_free, l.is_published
FROM (
    SELECT 'Python Basics' AS title, 'python-basics' AS slug, 'Introduction to Python programming' AS description, 'Learn the fundamentals of Python for data analysis.' AS content, 'https://www.youtube.com/watch?v=example-py1' AS video_url, 720 AS video_duration, 1 AS order_index, 1 AS is_free, 1 AS is_published
    UNION ALL SELECT 'Pandas Fundamentals', 'pandas-fundamentals', 'Working with Pandas DataFrames', 'Master the Pandas library for data manipulation.', 'https://www.youtube.com/watch?v=example-py2', 600, 2, 1, 1
    UNION ALL SELECT 'Data Cleaning with Python', 'data-cleaning-python', 'Cleaning data using Python', 'Learn advanced data cleaning techniques with Python.', 'https://www.youtube.com/watch?v=example-py3', 540, 3, 0, 1
    UNION ALL SELECT 'Data Visualization with Python', 'data-visualization-python', 'Creating charts with Matplotlib', 'Visualize your data using Python libraries.', 'https://www.youtube.com/watch?v=example-py4', 480, 4, 0, 1
    UNION ALL SELECT 'Module 4 Quiz', 'data-analysis-module-4-quiz', 'Test your Python skills', 'Test what you have learned in Module 4.', '', 300, 5, 0, 1
) l
JOIN modules m ON m.title = 'Python for Data Analysis'
JOIN courses c ON c.id = m.course_id AND c.slug = 'data-analysis-fundamentals';

-- ============================================
-- STEP 3: Insert lessons for Data Analysis
-- ========================================= - Module 5===
INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published)
SELECT m.id, l.title, l.slug, l.description, l.content, l.video_url, l.video_duration, l.order_index, l.is_free, l.is_published
FROM (
    SELECT 'Introduction to Power BI' AS title, 'introduction-to-power-bi' AS slug, 'Getting started with Power BI' AS description, 'Learn the basics of Power BI for data visualization.' AS content, 'https://www.youtube.com/watch?v=example-pbi1' AS video_url, 600 AS video_duration, 1 AS order_index, 1 AS is_free, 1 AS is_published
    UNION ALL SELECT 'Power BI Desktop', 'power-bi-desktop', 'Using Power BI Desktop', 'Create reports and dashboards with Power BI Desktop.', 'https://www.youtube.com/watch?v=example-pbi2', 720, 2, 1, 1
    UNION ALL SELECT 'DAX Formulas', 'dax-formulas', 'Power BI DAX formulas', 'Master DAX for calculated columns and measures.', 'https://www.youtube.com/watch?v=example-pbi3', 540, 3, 0, 1
    UNION ALL SELECT 'Power BI Service', 'power-bi-service', 'Publishing and sharing reports', 'Publish and share your reports on Power BI Service.', 'https://www.youtube.com/watch?v=example-pbi4', 480, 4, 0, 1
    UNION ALL SELECT 'Final Exam', 'data-analysis-final-exam', 'Comprehensive final exam', 'Demonstrate your mastery of data analysis concepts.', '', 600, 5, 0, 1
) l
JOIN modules m ON m.title = 'Power BI Visualization'
JOIN courses c ON c.id = m.course_id AND c.slug = 'data-analysis-fundamentals';

-- ============================================
-- STEP 3: Insert lessons for Data Automation - Module 1
-- ============================================
INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published)
SELECT m.id, l.title, l.slug, l.description, l.content, l.video_url, l.video_duration, l.order_index, l.is_free, l.is_published
FROM (
    SELECT 'What is Automation?' AS title, 'what-is-automation' AS slug, 'Understanding workflow automation' AS description, 'Learn the fundamentals of automation and why it matters for businesses.' AS content, 'https://www.youtube.com/watch?v=example-auto1' AS video_url, 480 AS video_duration, 1 AS order_index, 1 AS is_free, 1 AS is_published
    UNION ALL SELECT 'Benefits of Automation', 'benefits-of-automation', 'Why automate your workflows', 'Discover the key benefits of implementing automation.', 'https://www.youtube.com/watch?v=example-auto2', 420, 2, 1, 1
    UNION ALL SELECT 'Automation Tools Overview', 'automation-tools-overview', 'Comparing automation platforms', 'An overview of popular automation tools available.', 'https://www.youtube.com/watch?v=example-auto3', 540, 3, 0, 1
    UNION ALL SELECT 'Planning Your Automation', 'planning-your-automation', 'Strategy for automation success', 'Learn how to identify tasks worth automating.', 'https://www.youtube.com/watch?v=example-auto4', 360, 4, 0, 1
    UNION ALL SELECT 'Module 1 Quiz', 'automation-module-1-quiz', 'Test your automation knowledge', 'Test what you have learned in Module 1.', '', 300, 5, 0, 1
) l
JOIN modules m ON m.title = 'Introduction to Automation'
JOIN courses c ON c.id = m.course_id AND c.slug = 'data-automation-mastery';

-- ============================================
-- STEP 3: Insert lessons for Data Automation - Module 2
-- ============================================
INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published)
SELECT m.id, l.title, l.slug, l.description, l.content, l.video_url, l.video_duration, l.order_index, l.is_free, l.is_published
FROM (
    SELECT 'Getting Started with Zapier' AS title, 'getting-started-with-zapier' AS slug, 'Introduction to Zapier' AS description, 'Learn the basics of Zapier and how to create your first zap.' AS content, 'https://www.youtube.com/watch?v=example-zap1' AS video_url, 600 AS video_duration, 1 AS order_index, 1 AS is_free, 1 AS is_published
    UNION ALL SELECT 'Zapier Triggers and Actions', 'zapier-triggers-actions', 'Understanding triggers and actions', 'Master the core concepts of triggers and actions in Zapier.', 'https://www.youtube.com/watch?v=example-zap2', 480, 2, 1, 1
    UNION ALL SELECT 'Popular Zapier Integrations', 'popular-zapier-integrations', 'Top integrations to use', 'Explore the most popular and useful Zapier integrations.', 'https://www.youtube.com/watch?v=example-zap3', 540, 3, 0, 1
    UNION ALL SELECT 'Multi-Step Zaps', 'multi-step-zaps', 'Creating complex workflows', 'Build advanced automation with multi-step zaps.', 'https://www.youtube.com/watch?v=example-zap4', 600, 4, 0, 1
    UNION ALL SELECT 'Module 2 Quiz', 'automation-module-2-quiz', 'Test your Zapier skills', 'Test what you have learned in Module 2.', '', 300, 5, 0, 1
) l
JOIN modules m ON m.title = 'Zapier Mastery'
JOIN courses c ON c.id = m.course_id AND c.slug = 'data-automation-mastery';

-- ============================================
-- STEP 3: Insert lessons for Data Automation - Module 3
-- ============================================
INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published)
SELECT m.id, l.title, l.slug, l.description, l.content, l.video_url, l.video_duration, l.order_index, l.is_free, l.is_published
FROM (
    SELECT 'Introduction to Make.com' AS title, 'introduction-to-make' AS slug, 'Getting started with Make' AS description, 'Learn the basics of Make.com (formerly Integromat).' AS content, 'https://www.youtube.com/watch?v=example-make1' AS video_url, 600 AS video_duration, 1 AS order_index, 1 AS is_free, 1 AS is_published
    UNION ALL SELECT 'Make.com Scenarios', 'make-scenarios', 'Building automation scenarios', 'Create powerful automation scenarios with Make.', 'https://www.youtube.com/watch?v=example-make2', 540, 2, 1, 1
    UNION ALL SELECT 'Make Modules', 'make-modules', 'Using Make modules', 'Master the various modules available in Make.', 'https://www.youtube.com/watch?v=example-make3', 480, 3, 0, 1
    UNION ALL SELECT 'Error Handling', 'make-error-handling', 'Handling errors in automation', 'Learn how to handle errors in your Make scenarios.', 'https://www.youtube.com/watch?v=example-make4', 420, 4, 0, 1
    UNION ALL SELECT 'Module 3 Quiz', 'automation-module-3-quiz', 'Test your Make.com skills', 'Test what you have learned in Module 3.', '', 300, 5, 0, 1
) l
JOIN modules m ON m.title = 'Make.com (Integromat)'
JOIN courses c ON c.id = m.course_id AND c.slug = 'data-automation-mastery';

-- ============================================
-- STEP 3: Insert lessons for Data Automation - Module 4
-- ============================================
INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published)
SELECT m.id, l.title, l.slug, l.description, l.content, l.video_url, l.video_duration, l.order_index, l.is_free, l.is_published
FROM (
    SELECT 'Getting Started with Airtable' AS title, 'getting-started-with-airtable' AS slug, 'Introduction to Airtable' AS description, 'Learn the basics of Airtable databases.' AS content, 'https://www.youtube.com/watch?v=example-air1' AS video_url, 600 AS video_duration, 1 AS order_index, 1 AS is_free, 1 AS is_published
    UNION ALL SELECT 'Airtable Bases and Tables', 'airtable-bases-tables', 'Organizing data in Airtable', 'Master the structure of Airtable bases and tables.', 'https://www.youtube.com/watch?v=example-air2', 480, 2, 1, 1
    UNION ALL SELECT 'Automations in Airtable', 'airtable-automations', 'Built-in automation features', 'Use Airtable''s built-in automation capabilities.', 'https://www.youtube.com/watch?v=example-air3', 540, 3, 0, 1
    UNION ALL SELECT 'Airtable Integrations', 'airtable-integrations', 'Connecting with other tools', 'Integrate Airtable with other platforms.', 'https://www.youtube.com/watch?v=example-air4', 420, 4, 0, 1
    UNION ALL SELECT 'Module 4 Quiz', 'automation-module-4-quiz', 'Test your Airtable skills', 'Test what you have learned in Module 4.', '', 300, 5, 0, 1
) l
JOIN modules m ON m.title = 'Airtable Databases'
JOIN courses c ON c.id = m.course_id AND c.slug = 'data-automation-mastery';

-- ============================================
-- STEP 3: Insert lessons for Data Automation - Module 5
-- ============================================
INSERT IGNORE INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published)
SELECT m.id, l.title, l.slug, l.description, l.content, l.video_url, l.video_duration, l.order_index, l.is_free, l.is_published
FROM (
    SELECT 'Introduction to N8N' AS title, 'introduction-to-n8n' AS slug, 'Getting started with N8N' AS description, 'Learn about N8N and self-hosted automation.' AS content, 'https://www.youtube.com/watch?v=example-n8n1' AS video_url, 600 AS video_duration, 1 AS order_index, 1 AS is_free, 1 AS is_published
    UNION ALL SELECT 'N8N Workflows', 'n8n-workflows', 'Building N8N workflows', 'Create automation workflows with N8N.', 'https://www.youtube.com/watch?v=example-n8n2', 540, 2, 1, 1
    UNION ALL SELECT 'N8N Nodes', 'n8n-nodes', 'Using N8N nodes', 'Master the various nodes available in N8N.', 'https://www.youtube.com/watch?v=example-n8n3', 480, 3, 0, 1
    UNION ALL SELECT 'Self-Hosting N8N', 'self-hosting-n8n', 'Setting up your own N8N instance', 'Install and configure your own N8N server.', 'https://www.youtube.com/watch?v=example-n8n4', 600, 4, 0, 1
    UNION ALL SELECT 'Final Exam', 'automation-final-exam', 'Comprehensive final exam', 'Demonstrate your mastery of automation concepts.', '', 600, 5, 0, 1
) l
JOIN modules m ON m.title = 'N8N Workflow Automation'
JOIN courses c ON c.id = m.course_id AND c.slug = 'data-automation-mastery';

-- ============================================
-- STEP 4: Insert quizzes for Data Analysis course
-- ============================================
INSERT IGNORE INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published)
SELECT 
    c.id AS course_id,
    m.id AS module_id,
    (SELECT id FROM lessons WHERE module_id = m.id ORDER BY order_index DESC LIMIT 1) AS lesson_id,
    q.title, q.description, q.time_limit, q.passing_score, q.is_final, q.published
FROM (
    SELECT 'Data Analysis Fundamentals Quiz' AS title, 'Test your understanding of data analysis basics' AS description, 10 AS time_limit, 70.00 AS passing_score, 0 AS is_final, 1 AS published
    UNION ALL SELECT 'Excel for Data Analysis Quiz', 'Test your advanced Excel skills', 15, 70.00, 0, 1
    UNION ALL SELECT 'SQL Fundamentals Quiz', 'Test your SQL querying skills', 15, 70.00, 0, 1
    UNION ALL SELECT 'Python for Data Analysis Quiz', 'Test your Python and Pandas skills', 15, 70.00, 0, 1
    UNION ALL SELECT 'Data Analysis Final Exam', 'Comprehensive final exam for Data Analysis', 45, 70.00, 1, 1
) q
JOIN courses c ON c.slug = 'data-analysis-fundamentals'
JOIN modules m ON (
    (q.title = 'Data Analysis Fundamentals Quiz' AND m.title = 'Introduction to Data Analysis')
    OR (q.title = 'Excel for Data Analysis Quiz' AND m.title = 'Excel for Data Analysis')
    OR (q.title = 'SQL Fundamentals Quiz' AND m.title = 'SQL Fundamentals')
    OR (q.title = 'Python for Data Analysis Quiz' AND m.title = 'Python for Data Analysis')
    OR (q.title = 'Data Analysis Final Exam' AND m.title = 'Power BI Visualization')
);

-- ============================================
-- STEP 4: Insert quizzes for Data Automation course
-- ============================================
INSERT IGNORE INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published)
SELECT 
    c.id AS course_id,
    m.id AS module_id,
    (SELECT id FROM lessons WHERE module_id = m.id ORDER BY order_index DESC LIMIT 1) AS lesson_id,
    q.title, q.description, q.time_limit, q.passing_score, q.is_final, q.published
FROM (
    SELECT 'Automation Fundamentals Quiz' AS title, 'Test your automation concepts' AS description, 10 AS time_limit, 70.00 AS passing_score, 0 AS is_final, 1 AS published
    UNION ALL SELECT 'Zapier Quiz', 'Test your Zapier automation skills', 15, 70.00, 0, 1
    UNION ALL SELECT 'Make.com Quiz', 'Test your Make.com automation skills', 15, 70.00, 0, 1
    UNION ALL SELECT 'Airtable Quiz', 'Test your Airtable and automation skills', 15, 70.00, 0, 1
    UNION ALL SELECT 'Automation Final Exam', 'Comprehensive final exam for Data Automation', 45, 70.00, 1, 1
) q
JOIN courses c ON c.slug = 'data-automation-mastery'
JOIN modules m ON (
    (q.title = 'Automation Fundamentals Quiz' AND m.title = 'Introduction to Automation')
    OR (q.title = 'Zapier Quiz' AND m.title = 'Zapier Mastery')
    OR (q.title = 'Make.com Quiz' AND m.title = 'Make.com (Integromat)')
    OR (q.title = 'Airtable Quiz' AND m.title = 'Airtable Databases')
    OR (q.title = 'Automation Final Exam' AND m.title = 'N8N Workflow Automation')
);
