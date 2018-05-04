-- Users
INSERT INTO usr (id, first_name, last_name, title, company, education) VALUES (1, 'Ray', 'Su', 'Investment Manager', 'Rothschild', 'Cornell Tech');
INSERT INTO usr (id, first_name, last_name, title, company, education) VALUES (2, 'Alex', 'Johnson-Leung', 'Product Manager', 'Verizon', 'New York University');
INSERT INTO usr (id, first_name, last_name, title, company, education) VALUES (3, 'Charles', 'Deng', 'Data Scientist', 'Two Sigma', 'Cornell University');
INSERT INTO usr (id, first_name, last_name, title, company, education) VALUES (4, 'Jonathan', 'Kroll', 'Partner', 'Founders Fund', 'UCSB');

-- Experience
INSERT INTO experience (id, usr_id, title, company, duration, description, tags, curr) VALUES (1, 2, 'Product Manager', 'Verizon', '2', 'Post-merger integration with Oath', 'UI Design,Product Management,Presentation,Marketing', TRUE);
INSERT INTO experience (id, usr_id, title, company, duration, description, tags, curr) VALUES (2, 2, 'Marketing Analyst', 'Yahoo', '2', 'Online marketing for ICOs', 'Blockchain,Press Release,Brand Development,PR,Blogging', FALSE);
INSERT INTO experience (id, usr_id, title, company, duration, description, tags, curr) VALUES (3, 1, 'Investment Manager', 'Rothschild', '2', 'LBO', 'Valuation,Presentation,Excel,Finance', TRUE);
INSERT INTO experience (id, usr_id, title, company, duration, description, tags, curr) VALUES (4, 1, 'Marketing Analyst', 'Yahoo', '2', 'Online marketing for ICOs', 'Blockchain,Press Release,Brand Development,PR,Blogging', FALSE);
INSERT INTO experience (id, usr_id, title, company, duration, description, tags, curr) VALUES (5, 1, 'Software Engineer', 'Apple', '1', 'Software engineering of Apple Watch', 'Software Development,Data,Product Design', FALSE);
INSERT INTO experience (id, usr_id, title, company, duration, description, tags, curr) VALUES (6, 3, 'Data Scientist', 'Two Sigma', '2', 'Macro data analytics', 'Valuation,Presentation,R,Finance', TRUE);
INSERT INTO experience (id, usr_id, title, company, duration, description, tags, curr) VALUES (7, 3, 'Marketing Analyst', 'Yahoo', '2', 'Online marketing for ICOs', 'Blockchain,Press Release,Brand Development,PR,Blogging', FALSE);
INSERT INTO experience (id, usr_id, title, company, duration, description, tags, curr) VALUES (8, 3, 'Software Engineer', 'Apple', '1', 'Software engineering of Apple Watch', 'Software Development,Data,Product Design', FALSE);
INSERT INTO experience (id, usr_id, title, company, duration, description, tags, curr) VALUES (9, 4, 'Partner', 'Founders Fund', '2', 'Investment in Facebook', 'Valuation,Presentation,Finance', TRUE);
INSERT INTO experience (id, usr_id, title, company, duration, description, tags, curr) VALUES (10, 4, 'Marketing Analyst', 'Yahoo', '2', 'Online marketing for ICOs', 'Blockchain,Press Release,Brand Development,PR,Blogging', FALSE);
INSERT INTO experience (id, usr_id, title, company, duration, description, tags, curr) VALUES (11, 4, 'Software Engineer', 'Apple', '1', 'Software engineering of Apple Watch', 'Software Development,Data,Product Design', FALSE);

-- Project
INSERT INTO project (id, title, skill, description, create_time) VALUES (1,'Digit Recognition','Machine Learning,Neural Networks','Handwritten Digit Recognition using Convolutional Neural Networks','2018-05-03 21:23:54');
INSERT INTO project (id, title, skill, description, create_time) VALUES (2,'The Deal Competition','Investment Banking,Finance,Valuation','In this project, participants are required to function as financial advisor to work on a deal involving a publicly listed company and a target company within the same industry in emerging Asia.You will analyze the hypothetical acquisition and explain your strategic rationale for the acquisition and the issues requiring consideration.','2018-05-03 21:23:54');
INSERT INTO project (id, title, skill, description, create_time) VALUES (3,'Google Advertisement team product management challenge','Product Management,Software Development','Develop an innovative google cloud product','2018-02-02 10:23:54');
INSERT INTO project (id, title, skill, description, create_time) VALUES (4,'Google Brain Bussiness Challenge','Product Management,Software Development,Deep Learning,Machine Learning','Develop an innovative plan to apply google brain technogloy to solve business problems','2018-02-02 10:23:54');
INSERT INTO project (id, title, skill, description, create_time) VALUES (5,'Google Venture Case Competition','Product Management,Business Strategy,Valuation,Technology,Software Engineering','Google VC competition asks you to complete an investor pitch for a potential target startup company','2018-04-02 11:00:00');
INSERT INTO project (id, title, skill, description, create_time) VALUES (6,'The Next Gen Payment System','Fintech,Software Engineering,Blockchain,Payment,Machine Learning,Big Data','Deliver technical proposal for blockchain-powered transaction system to revoluationize the bank to bank payment system ','2018-06-01 9:00:00');

-- Company
INSERT INTO company (id, name, type, url, size) VALUES (1, 'JP Morgan','Investment Banking,Finance','https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/J_P_Morgan_Logo_2008_1.svg/2000px-J_P_Morgan_Logo_2008_1.svg.png', 3);
INSERT INTO company (id, name, type, url, size) VALUES (2, 'Kensho Technologies','Data Analytics,Big Data,Artificial Intelligence,Machine Learning','https://www.iqt.org/wp-content/uploads/2016/10/Kensho-logo-for-web.png', 1);
INSERT INTO company (id, name, type, url, size) VALUES (3, 'Google','Software Engineering,Technology,Advertisement,Product Management','https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Google_2015_logo.svg/2000px-Google_2015_logo.svg.png', 3);

-- user project relationship 
INSERT INTO usrprojectrel (id, usr_id, project_id, score, register_time, finish_time) VALUES (1, 4, 3, 98, '2018-05-03 10:00:54', '2018-05-04 10:00:00');
INSERT INTO usrprojectrel (id, usr_id, project_id, score, register_time, finish_time) VALUES (2, 2, 3, 98, '2018-05-03 10:05:00', '2018-05-04 11:00:00');
INSERT INTO usrprojectrel (id, usr_id, project_id, score, register_time, finish_time) VALUES (3, 3, 1, 95, '2018-04-01 10:00:00', '2018-04-05 14:00:00');
INSERT INTO usrprojectrel (id, usr_id, project_id, score, register_time, finish_time) VALUES (4, 1, 1, 95, '2018-04-01 11:00:00', '2018-05-01 15:00:00');

-- company project relationship
INSERT INTO companyprojectrel (id, company_id, project_id, list_time, start_time, expire_time, time_limit) VALUES (1,3,3, '2018-02-02 08:00:00', '2018-02-02 12:00:00', '2018-10-05 12:00:00',24);
INSERT INTO companyprojectrel (id, company_id, project_id, list_time, start_time, expire_time, time_limit) VALUES (2,1,2, '2018-03-01 09:00:00', '2018-03-01 12:00:00', '2018-09-01 12:00:00',48);
INSERT INTO companyprojectrel (id, company_id, project_id, list_time, start_time, expire_time, time_limit) VALUES (3,2,1, '2018-01-01 07:00:00','2018-01-01 9:00:00', '2018-12-05 12:00:00',12);
INSERT INTO companyprojectrel (id, company_id, project_id, list_time, start_time, expire_time, time_limit) VALUES (4,3,4, '2018-01-01 07:00:00','2018-01-01 9:00:00', '2018-12-05 12:00:00',5);
INSERT INTO companyprojectrel (id, company_id, project_id, list_time, start_time, expire_time, time_limit) VALUES (5,3,5, '2018-01-01 07:00:00','2018-01-01 9:00:00', '2018-12-05 12:00:00',2);
INSERT INTO companyprojectrel (id, company_id, project_id, list_time, start_time, expire_time, time_limit) VALUES (6,1,6, '2018-06-01 07:00:00','2018-06-01 9:30:00', '2018-12-05 12:00:00',1);




