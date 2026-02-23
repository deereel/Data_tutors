-- SQL to add missing courses (run this first!)
-- This will insert Data Analysis and Data Automation courses

INSERT INTO courses (title, slug, description, short_description, category, level, price, duration_hours, featured, published) VALUES
('Data Analysis Fundamentals', 'data-analysis-fundamentals', 'Learn data analysis from scratch using Excel, SQL, Python, and Power BI. Transform raw data into actionable insights.', 'Master data analysis with Excel, SQL, Python & Power BI', 'data-analysis', 'beginner', 79.00, 35.00, 1, 1);

INSERT INTO courses (title, slug, description, short_description, category, level, price, duration_hours, featured, published) VALUES
('Data Automation Mastery', 'data-automation-mastery', 'Automate your workflows with Zapier, Make.com, Airtable, and N8N. Save time and increase productivity.', 'Automate workflows with Zapier, Make, Airtable & N8N', 'automation', 'intermediate', 69.00, 25.00, 1, 1);
