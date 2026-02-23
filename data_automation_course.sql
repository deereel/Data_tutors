-- ============================================
-- DATA AUTOMATION PROGRAM - COMPLETE CURRICULUM
-- 8 Modules, 40+ Lessons, 8 Quizzes, 3 Mini Projects, 1 Capstone Project
-- Duration: 6-8 Weeks | Level: Beginner → Automation Specialist
-- Tools Covered: Zapier, Make.com, Airtable, N8N
-- ============================================

-- ============================================
-- Update Data Automation Course Details
-- ============================================
UPDATE courses SET 
    title = 'Data Automation Mastery: Zapier, Make.com, Airtable & N8N',
    description = 'Master workflow automation from beginner to advanced. Learn to automate repetitive tasks using Zapier, Make.com, Airtable, and N8N. Build real-world automation projects and become an automation specialist.',
    short_description = 'Complete automation course with Zapier, Make.com, Airtable & N8N',
    price = 79.00,
    duration_hours = 40.00,
    level = 'beginner'
WHERE id = 10;

-- ============================================
-- PHASE 1: AUTOMATION FUNDAMENTALS (Beginner)
-- ============================================

-- ============================================
-- Module 1: Introduction to Automation
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(10, 'Introduction to Automation', 'Learn what automation is and why it matters', 1, 1);

SET @module1_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module1_id, 'What is Workflow Automation?', 'what-is-workflow-automation', 'Understanding automation basics', 'Workflow automation is the use of technology to automate repetitive, manual business processes. Learn how automation can save time, reduce errors, and improve efficiency.', 'https://www.youtube.com/watch?v=workflow-automation-intro', 300, 1, 1, 1),
(@module1_id, 'APIs Explained Simply', 'apis-explained-simply', 'How systems communicate', 'Application Programming Interfaces (APIs) are the building blocks of automation. Learn the basics of how different software systems communicate with each other.', 'https://www.youtube.com/watch?v=apis-simply', 480, 2, 1, 1),
(@module1_id, 'Webhooks Basics', 'webhooks-basics', 'Real-time communication', 'Webhooks allow for real-time communication between applications. Learn how to use webhooks to trigger automations based on events.', 'https://www.youtube.com/watch?v=webhooks-basics', 600, 3, 0, 1),
(@module1_id, 'Understanding Triggers & Actions', 'triggers-and-actions', 'Core automation concepts', 'Every automation has triggers (what starts it) and actions (what it does). Learn to identify these in your workflows.', 'https://www.youtube.com/watch?v=triggers-actions', 720, 4, 0, 1),
(@module1_id, 'Real Automation Examples', 'real-automation-examples', 'Industry applications', 'Explore real-world automation examples from various industries to understand what is possible.', 'https://www.youtube.com/watch?v=automation-examples', 480, 5, 0, 1),
(@module1_id, 'Module 1 Quiz', 'module-1-quiz', 'Test your fundamentals', 'Test your understanding of automation basics, APIs, webhooks, and core concepts.', '', 300, 6, 0, 1);

-- ============================================
-- PHASE 2: ZAPIER (Beginner to Intermediate)
-- ============================================

-- ============================================
-- Module 2: Zapier Basics
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(10, 'Zapier Basics', 'Learn the world''s most popular automation tool', 2, 1);

SET @module2_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module2_id, 'Creating Your First Zap', 'creating-first-zap', 'Build a simple automation', 'Create your first automation (Zap) in Zapier. Learn how to connect two applications and automate a simple task.', 'https://www.youtube.com/watch?v=creating-first-zap', 600, 1, 1, 1),
(@module2_id, 'Understanding Triggers', 'zapier-triggers', 'What starts your automation', 'Explore different types of triggers in Zapier and when to use them.', 'https://www.youtube.com/watch?v=zapier-triggers', 480, 2, 1, 1),
(@module2_id, 'Connecting Apps', 'connecting-apps', 'Integration basics', 'Learn how to connect hundreds of different applications in Zapier. Understand authentication and permissions.', 'https://www.youtube.com/watch?v=connecting-apps', 720, 3, 0, 1),
(@module2_id, 'Multi-Step Zaps', 'multi-step-zaps', 'Complex automation', 'Build zaps with multiple steps to handle more complex workflows. Learn about filters, paths, and logic.', 'https://www.youtube.com/watch?v=multi-step-zaps', 900, 4, 0, 1),
(@module2_id, 'Filters & Paths', 'filters-and-paths', 'Conditional logic', 'Add conditional logic to your zaps with filters and paths. Learn to branch your automation based on conditions.', 'https://www.youtube.com/watch?v=filters-paths', 780, 5, 0, 1),
(@module2_id, 'Module 2 Quiz', 'module-2-quiz', 'Test Zapier basics', 'Test your knowledge of Zapier fundamentals, triggers, actions, and multi-step zaps.', '', 300, 6, 0, 1);

-- ============================================
-- MINI PROJECT 1: Auto-Save Form Submissions to Google Sheets
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(10, 'Mini Project: Form Submissions to Google Sheets', 'Auto-save form data automatically', 3, 1);

SET @project1_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@project1_id, 'Project Overview', 'form-to-sheets-overview', 'What we will build', 'In this mini project, you will create an automation that automatically saves form submissions to Google Sheets.', 'https://www.youtube.com/watch?v=form-to-sheets-intro', 300, 1, 0, 1),
(@project1_id, 'Setting Up the Form', 'setting-up-form', 'Create a form', 'Create a Google Form or use an existing form service to collect data.', 'https://www.youtube.com/watch?v=setting-up-form', 480, 2, 0, 1),
(@project1_id, 'Creating the Zap', 'creating-form-zap', 'Build the automation', 'Create a Zap that connects your form to Google Sheets and automatically saves submissions.', 'https://www.youtube.com/watch?v=creating-form-zap', 900, 3, 0, 1),
(@project1_id, 'Testing the Automation', 'testing-automation', 'Ensure it works', 'Test your automation to make sure submissions are being saved correctly.', 'https://www.youtube.com/watch?v=testing-automation', 600, 4, 0, 1),
(@project1_id, 'Project Solution', 'form-to-sheets-solution', 'Complete walkthrough', 'Review the complete solution and best practices for this automation.', 'https://www.youtube.com/watch?v=form-to-sheets-solution', 600, 5, 0, 1);

-- ============================================
-- PHASE 3: MAKE.COM (Advanced Automation)
-- ============================================

-- ============================================
-- Module 3: Make.com Fundamentals
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(10, 'Make.com Fundamentals', 'Master the powerful automation platform', 4, 1);

SET @module3_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module3_id, 'Interface Overview', 'make-interface-overview', 'Navigate Make.com', 'Learn the Make.com interface, including scenarios, modules, and the connection manager.', 'https://www.youtube.com/watch?v=make-interface', 480, 1, 1, 1),
(@module3_id, 'Creating Scenarios', 'creating-scenarios', 'Build your first automation', 'Create your first scenario in Make.com. Learn how to connect apps and build workflows.', 'https://www.youtube.com/watch?v=creating-scenarios', 720, 2, 1, 1),
(@module3_id, 'Routers', 'make-routers', 'Branch your automation', 'Use routers to create branches in your scenarios for different paths based on conditions.', 'https://www.youtube.com/watch?v=make-routers', 600, 3, 0, 1),
(@module3_id, 'Error Handling', 'error-handling', 'Dealing with failures', 'Implement error handling in your scenarios to ensure your automations are robust.', 'https://www.youtube.com/watch?v=error-handling', 780, 4, 0, 1),
(@module3_id, 'Data Mapping', 'data-mapping', 'Transforming data', 'Learn how to map and transform data between different applications in Make.com.', 'https://www.youtube.com/watch?v=data-mapping', 900, 5, 0, 1),
(@module3_id, 'Module 3 Quiz', 'module-3-quiz', 'Test Make.com basics', 'Test your understanding of Make.com scenarios, routers, error handling, and data mapping.', '', 300, 6, 0, 1);

-- ============================================
-- Module 4: Advanced Make.com Scenarios
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(10, 'Advanced Make.com Scenarios', 'Build complex automation solutions', 5, 1);

SET @module4_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module4_id, 'HTTP Module', 'http-module', 'Custom API connections', 'Use the HTTP module to connect to any API that isn''t directly supported in Make.com.', 'https://www.youtube.com/watch?v=http-module', 720, 1, 1, 1),
(@module4_id, 'Webhooks in Make', 'webhooks-in-make', 'Real-time triggers', 'Implement webhooks in Make.com for real-time automation triggers.', 'https://www.youtube.com/watch?v=webhooks-in-make', 600, 2, 1, 1),
(@module4_id, 'Conditional Logic', 'conditional-logic', 'Advanced branching', 'Create complex conditional logic using if-else statements and switches.', 'https://www.youtube.com/watch?v=conditional-logic', 900, 3, 0, 1),
(@module4_id, 'Scheduling Automations', 'scheduling-automations', 'Time-based triggers', 'Schedule your scenarios to run at specific times or intervals.', 'https://www.youtube.com/watch?v=scheduling-automations', 480, 4, 0, 1),
(@module4_id, 'Module 4 Quiz', 'module-4-quiz', 'Test advanced Make.com', 'Test your knowledge of advanced Make.com features including HTTP modules, webhooks, and scheduling.', '', 300, 5, 0, 1);

-- ============================================
-- MINI PROJECT 2: Auto-Send Invoices on Payment
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(10, 'Mini Project: Auto-Send Invoices on Payment', 'Automate invoice generation', 6, 1);

SET @project2_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@project2_id, 'Project Overview', 'invoice-automation-overview', 'What we will build', 'Create an automation that automatically sends invoices when payments are received.', 'https://www.youtube.com/watch?v=invoice-automation-intro', 300, 1, 0, 1),
(@project2_id, 'Setting Up Payment System', 'payment-system-setup', 'Configure payment platform', 'Set up your payment system (Stripe, PayPal, etc.) and create invoice templates.', 'https://www.youtube.com/watch?v=payment-system-setup', 600, 2, 0, 1),
(@project2_id, 'Creating the Scenario', 'creating-invoice-scenario', 'Build the automation', 'Create a Make.com scenario that triggers on payment received and sends invoices.', 'https://www.youtube.com/watch?v=creating-invoice-scenario', 1200, 3, 0, 1),
(@project2_id, 'Testing the Automation', 'testing-invoice-automation', 'Ensure it works', 'Test your automation with test payments to ensure invoices are sent correctly.', 'https://www.youtube.com/watch?v=testing-invoice-automation', 600, 4, 0, 1),
(@project2_id, 'Project Solution', 'invoice-automation-solution', 'Complete walkthrough', 'Review the complete solution and best practices for invoice automation.', 'https://www.youtube.com/watch?v=invoice-automation-solution', 600, 5, 0, 1);

-- ============================================
-- PHASE 4: AIRTABLE (Database & Automation)
-- ============================================

-- ============================================
-- Module 5: Airtable Basics
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(10, 'Airtable Basics', 'Build databases and automations', 7, 1);

SET @module5_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module5_id, 'Creating Bases', 'creating-airtable-bases', 'Start with Airtable', 'Create your first Airtable base and understand the structure of bases, tables, and fields.', 'https://www.youtube.com/watch?v=creating-airtable-bases', 480, 1, 1, 1),
(@module5_id, 'Tables & Fields', 'airtable-tables-fields', 'Database structure', 'Learn about different field types in Airtable and how to organize your data.', 'https://www.youtube.com/watch?v=airtable-tables-fields', 600, 2, 1, 1),
(@module5_id, 'Views', 'airtable-views', 'Data visualization', 'Create different views of your data including grid, calendar, gallery, and kanban views.', 'https://www.youtube.com/watch?v=airtable-views', 480, 3, 0, 1),
(@module5_id, 'Automations in Airtable', 'airtable-automations', 'Built-in automation', 'Use Airtable''s built-in automation features to create simple workflows without code.', 'https://www.youtube.com/watch?v=airtable-automations', 720, 4, 0, 1),
(@module5_id, 'Module 5 Quiz', 'module-5-quiz', 'Test Airtable basics', 'Test your understanding of Airtable bases, tables, fields, views, and automations.', '', 300, 5, 0, 1);

-- ============================================
-- Module 6: Airtable as Backend
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(10, 'Airtable as Backend', 'Advanced database features', 8, 1);

SET @module6_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module6_id, 'Linking Tables', 'linking-airtable-tables', 'Relational databases', 'Create relationships between tables in Airtable for more complex data structures.', 'https://www.youtube.com/watch?v=linking-airtable-tables', 600, 1, 1, 1),
(@module6_id, 'Formula Fields', 'airtable-formulas', 'Calculated fields', 'Create formula fields in Airtable for calculations and data manipulation.', 'https://www.youtube.com/watch?v=airtable-formulas', 720, 2, 1, 1),
(@module6_id, 'Rollups', 'airtable-rollups', 'Aggregated data', 'Use rollup fields to aggregate data from linked tables.', 'https://www.youtube.com/watch?v=airtable-rollups', 480, 3, 0, 1),
(@module6_id, 'Using Airtable API', 'airtable-api', 'Programmatic access', 'Access your Airtable data programmatically using the Airtable API.', 'https://www.youtube.com/watch?v=airtable-api', 900, 4, 0, 1),
(@module6_id, 'Module 6 Quiz', 'module-6-quiz', 'Test advanced Airtable', 'Test your knowledge of relational databases, formulas, rollups, and the Airtable API.', '', 300, 5, 0, 1);

-- ============================================
-- MINI PROJECT 3: CRM System in Airtable
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(10, 'Mini Project: CRM System in Airtable', 'Build a custom CRM', 9, 1);

SET @project3_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@project3_id, 'Project Overview', 'crm-system-overview', 'What we will build', 'Create a complete Customer Relationship Management (CRM) system in Airtable.', 'https://www.youtube.com/watch?v=crm-system-intro', 300, 1, 0, 1),
(@project3_id, 'Designing the Database', 'designing-crm-database', 'Structure your CRM', 'Design the database structure for your CRM with tables for contacts, deals, and interactions.', 'https://www.youtube.com/watch?v=designing-crm-database', 720, 2, 0, 1),
(@project3_id, 'Creating Tables & Fields', 'crm-tables-fields', 'Build the CRM', 'Create all the necessary tables and fields for your CRM system.', 'https://www.youtube.com/watch?v=crm-tables-fields', 1200, 3, 0, 1),
(@project3_id, 'Adding Automations', 'crm-automations', 'Automate processes', 'Add automations to your CRM for things like follow-up reminders and task creation.', 'https://www.youtube.com/watch?v=crm-automations', 900, 4, 0, 1),
(@project3_id, 'Project Solution', 'crm-system-solution', 'Complete walkthrough', 'Review the complete CRM system and best practices for Airtable database design.', 'https://www.youtube.com/watch?v=crm-system-solution', 600, 5, 0, 1);

-- ============================================
-- PHASE 5: N8N (Advanced Automation)
-- ============================================

-- ============================================
-- Module 7: N8N Basics
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(10, 'N8N Basics', 'Self-hosted automation platform', 10, 1);

SET @module7_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module7_id, 'Installing N8N', 'installing-n8n', 'Set up your environment', 'Learn to install and configure N8N, both locally and on cloud platforms.', 'https://www.youtube.com/watch?v=installing-n8n', 600, 1, 1, 1),
(@module7_id, 'Creating Workflows', 'creating-n8n-workflows', 'Build automations', 'Create your first workflow in N8N. Learn the interface and basic node types.', 'https://www.youtube.com/watch?v=creating-n8n-workflows', 720, 2, 1, 1),
(@module7_id, 'Connecting APIs', 'connecting-apis-n8n', 'API integration', 'Connect to various APIs using N8N''s built-in nodes or custom HTTP requests.', 'https://www.youtube.com/watch?v=connecting-apis-n8n', 900, 3, 0, 1),
(@module7_id, 'Data Transformation', 'data-transformation-n8n', 'Manipulate data', 'Use N8N to transform and manipulate data between different formats and applications.', 'https://www.youtube.com/watch?v=data-transformation-n8n', 780, 4, 0, 1),
(@module7_id, 'Module 7 Quiz', 'module-7-quiz', 'Test N8N basics', 'Test your understanding of N8N installation, workflows, API connections, and data transformation.', '', 300, 5, 0, 1);

-- ============================================
-- Module 8: Advanced N8N Workflows
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(10, 'Advanced N8N Workflows', 'Production-ready automation', 11, 1);

SET @module8_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@module8_id, 'Conditional Logic', 'conditional-logic-n8n', 'Branching workflows', 'Implement complex conditional logic in your N8N workflows.', 'https://www.youtube.com/watch?v=conditional-logic-n8n', 720, 1, 1, 1),
(@module8_id, 'Looping', 'looping-n8n', 'Iterate through data', 'Use loops in N8N to process multiple items of data.', 'https://www.youtube.com/watch?v=looping-n8n', 600, 2, 1, 1),
(@module8_id, 'Error Handling', 'error-handling-n8n', 'Robust automation', 'Add error handling to your N8N workflows for production reliability.', 'https://www.youtube.com/watch?v=error-handling-n8n', 780, 3, 0, 1),
(@module8_id, 'Scheduling', 'scheduling-n8n', 'Time-based automation', 'Schedule your N8N workflows to run at specific times or intervals.', 'https://www.youtube.com/watch?v=scheduling-n8n', 480, 4, 0, 1),
(@module8_id, 'Production Deployment', 'production-deployment', 'Go live with your automation', 'Deploy your N8N workflows to production environments and set up monitoring.', 'https://www.youtube.com/watch?v=production-deployment', 900, 5, 0, 1),
(@module8_id, 'Module 8 Quiz', 'module-8-quiz', 'Test advanced N8N', 'Test your knowledge of advanced N8N features including conditional logic, looping, and production deployment.', '', 300, 6, 0, 1);

-- ============================================
-- CAPSTONE PROJECT: Complete Automation System
-- ============================================
INSERT INTO modules (course_id, title, description, order_index, is_published) VALUES
(10, 'Capstone Project: Complete Automation System', 'Build end-to-end automation', 12, 1);

SET @capstone_id = LAST_INSERT_ID();

INSERT INTO lessons (module_id, title, slug, description, content, video_url, video_duration, order_index, is_free, is_published) VALUES
(@capstone_id, 'Project Overview', 'complete-automation-overview', 'What we will build', 'Build a complete automation system integrating all the tools you''ve learned: Lead capture → CRM sync → Email marketing → Payment automation → Reporting.', 'https://www.youtube.com/watch?v=complete-automation-intro', 300, 1, 0, 1),
(@capstone_id, 'Lead Capture Automation', 'lead-capture-automation', 'Collect leads', 'Create a lead capture automation using forms and landing pages.', 'https://www.youtube.com/watch?v=lead-capture-automation', 900, 2, 0, 1),
(@capstone_id, 'CRM Sync', 'crm-sync', 'Update customer data', 'Sync your CRM with other systems using automation.', 'https://www.youtube.com/watch?v=crm-sync', 780, 3, 0, 1),
(@capstone_id, 'Email Marketing Flow', 'email-marketing-flow', 'Automate emails', 'Create email marketing automation flows for new leads and customers.', 'https://www.youtube.com/watch?v=email-marketing-flow', 1200, 4, 0, 1),
(@capstone_id, 'Payment Trigger Automation', 'payment-trigger-automation', 'Process payments', 'Set up automation to trigger actions based on payment events.', 'https://www.youtube.com/watch?v=payment-trigger-automation', 900, 5, 0, 1),
(@capstone_id, 'Reporting Automation', 'reporting-automation', 'Generate reports', 'Create automated reporting to track your automation system''s performance.', 'https://www.youtube.com/watch?v=reporting-automation', 720, 6, 0, 1),
(@capstone_id, 'Final Assessment', 'final-assessment', 'Real-world scenario challenge', 'Test your automation skills with a real-world scenario challenge.', '', 1800, 7, 0, 1);

-- ============================================
-- QUIZZES FOR ALL MODULES
-- ============================================

-- Get the last lesson id for each module to create quizzes
SET @lesson6_id1 = (SELECT id FROM lessons WHERE module_id = @module1_id AND order_index = 6);
SET @lesson6_id2 = (SELECT id FROM lessons WHERE module_id = @module2_id AND order_index = 6);
SET @lesson6_id3 = (SELECT id FROM lessons WHERE module_id = @module3_id AND order_index = 6);
SET @lesson5_id4 = (SELECT id FROM lessons WHERE module_id = @module4_id AND order_index = 5);
SET @lesson5_id5 = (SELECT id FROM lessons WHERE module_id = @module5_id AND order_index = 5);
SET @lesson5_id6 = (SELECT id FROM lessons WHERE module_id = @module6_id AND order_index = 5);
SET @lesson5_id7 = (SELECT id FROM lessons WHERE module_id = @module7_id AND order_index = 5);
SET @lesson6_id8 = (SELECT id FROM lessons WHERE module_id = @module8_id AND order_index = 6);
SET @lesson7_id9 = (SELECT id FROM lessons WHERE module_id = @capstone_id AND order_index = 7);

-- Quiz for Module 1 (Introduction to Automation)
INSERT INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(10, @module1_id, @lesson6_id1, 'Automation Fundamentals Quiz', 'Test your understanding of automation basics, APIs, webhooks, and core concepts', 15, 70.00, 0, 1);

-- Quiz for Module 2 (Zapier Basics)
INSERT INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(10, @module2_id, @lesson6_id2, 'Zapier Basics Quiz', 'Test your knowledge of Zapier fundamentals, triggers, actions, and multi-step zaps', 20, 70.00, 0, 1);

-- Quiz for Module 3 (Make.com Fundamentals)
INSERT INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(10, @module3_id, @lesson6_id3, 'Make.com Fundamentals Quiz', 'Test your understanding of Make.com scenarios, routers, error handling, and data mapping', 20, 70.00, 0, 1);

-- Quiz for Module 4 (Advanced Make.com)
INSERT INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(10, @module4_id, @lesson5_id4, 'Advanced Make.com Quiz', 'Test your knowledge of advanced Make.com features including HTTP modules, webhooks, and scheduling', 20, 70.00, 0, 1);

-- Quiz for Module 5 (Airtable Basics)
INSERT INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(10, @module5_id, @lesson5_id5, 'Airtable Basics Quiz', 'Test your understanding of Airtable bases, tables, fields, views, and automations', 15, 70.00, 0, 1);

-- Quiz for Module 6 (Advanced Airtable)
INSERT INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(10, @module6_id, @lesson5_id6, 'Advanced Airtable Quiz', 'Test your knowledge of relational databases, formulas, rollups, and the Airtable API', 20, 70.00, 0, 1);

-- Quiz for Module 7 (N8N Basics)
INSERT INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(10, @module7_id, @lesson5_id7, 'N8N Basics Quiz', 'Test your understanding of N8N installation, workflows, API connections, and data transformation', 15, 70.00, 0, 1);

-- Quiz for Module 8 (Advanced N8N)
INSERT INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(10, @module8_id, @lesson6_id8, 'Advanced N8N Quiz', 'Test your knowledge of advanced N8N features including conditional logic, looping, and production deployment', 20, 70.00, 0, 1);

-- Final Data Automation Exam
INSERT INTO quizzes (course_id, module_id, lesson_id, title, description, time_limit, passing_score, is_final, published) VALUES
(10, @capstone_id, @lesson7_id9, 'Data Automation Final Exam', 'Comprehensive final assessment covering all automation tools and concepts', 60, 70.00, 1, 1);

-- ============================================
-- SUCCESS MESSAGE
-- ============================================
SELECT '✅ Data Automation program successfully created!';
SELECT '🤖 8 modules, 40+ lessons, 8 quizzes, 3 mini projects, 1 capstone project';
SELECT '⏱ Duration: 6-8 weeks | Level: Beginner → Automation Specialist';
SELECT '📊 Tools Covered: Zapier, Make.com, Airtable, N8N';
