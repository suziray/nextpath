-- heroku pg:psql < initial_data.sql

-- -- Countries
-- INSERT INTO country (id, name) VALUES (1, 'United States');
-- INSERT INTO country (id, name) VALUES (2, 'England');
-- INSERT INTO country (id, name) VALUES (3, 'Argentina');
-- INSERT INTO country (id, name) VALUES (4, 'Scotland');

-- -- Authors
-- INSERT INTO author (id, country_id, name) VALUES (1, 1, 'Edgar Allan Poe');
-- INSERT INTO author (id, country_id, name) VALUES (2, 1, 'Mark Twain');
-- INSERT INTO author (id, country_id, name) VALUES (3, 4, 'Arthur Conan Doyle');
-- INSERT INTO author (id, country_id, name) VALUES (4, 3, 'Jorge Luis Borges');

-- Users
INSERT INTO usr (id, first_name, last_name, title, company, education) VALUES (1, 'Ray', 'Su', 'Investment Manager', 'Rothschild', 'Cornell Tech');
INSERT INTO usr (id, first_name, last_name, title, company, education) VALUES (2, 'Alex', 'Johnson-Leung', 'Product Manager', 'Verizon', 'New York University');
INSERT INTO usr (id, first_name, last_name, title, company, education) VALUES (3, 'Charles', 'Deng', 'Data Scientist', 'Two Sigma', 'Cornell University');
INSERT INTO usr (id, first_name, last_name, title, company, education) VALUES (4, 'Jonathan', 'Kroll', 'Partner', 'Founders Fund', 'UCSB');

-- Experience
INSERT INTO experience (id, usr_id, title, company, duration, description, tags, curr) VALUES (1, 2, 'Product Manager', 'Verizon', '2', 'Post-merger integration with Oath', 'UI Design,Product Management,Presentation,Marketing', TRUE);
INSERT INTO experience (id, usr_id, title, company, duration, description, tags, curr) VALUES (2, 2, 'Marketing Analyst', 'Yahoo', '2', 'Online marketing for ICOs', 'Blockchain,Press Release,Brand Development,Pr,Blogging', FALSE);
INSERT INTO experience (id, usr_id, title, company, duration, description, tags, curr) VALUES (3, 1, 'Investment Manager', 'Rothschild', '2', 'LBO', 'Valuation,Presentation,Excel,Finance', TRUE);
INSERT INTO experience (id, usr_id, title, company, duration, description, tags, curr) VALUES (4, 1, 'Marketing Analyst', 'Yahoo', '2', 'Online marketing for ICOs', 'Blockchain,Press Release,Brand Development,Pr,Blogging', FALSE);
INSERT INTO experience (id, usr_id, title, company, duration, description, tags, curr) VALUES (4, 1, 'Software Engineer', 'Apple', '1', 'Software engineering of Apple Watch', 'Software Development,Data,Machine Learning,', FALSE);

-- Project
INSERT INTO project (id, title, skill, description, create_time) VALUES (1,'Digit Recognition','Machine Learning,Neural Networks','Handwritten Digit Recognition using Convolutional Neural Networks','2018-05-03 21:23:54');
INSERT INTO project (id, title, skill, description, create_time) VALUES (2,'The Deal Competition','Investment Banking,Finance,Valuation','In this project, participants are required to function as financial advisor to work on a deal involving a publicly listed company and a target company within the same industry in emerging Asia.You will analyze the hypothetical acquisition and explain your strategic rationale for the acquisition and the issues requiring consideration.','2018-05-03 21:23:54');
INSERT INTO project (id, title, skill, description, create_time) VALUES (3,'Google Advertisement team product management challenge','Product Management,Software Development','Develop an innovative google cloud product','2018-02-02 10:23:54');


-- Company
INSERT INTO company (id, name, type, url, size) VALUES (1, 'JP Morgan','investment banking,finance','https://www.jpmorganchase.com', 3);
INSERT INTO company (id, name, type, url, size) VALUES (2, 'Kensho Technologies','data analytics,big data,artificial intelligence,machine learning','https://www.jpmorganchase.com', 1);
INSERT INTO company (id, name, type, url, size) VALUES (3, 'Google','software engineering,technology,advertisement,product management','https://www.google.com', 3);

-- user project relationship 
INSERT INTO usrprojectrel (id, usr_id, project_id, score, register_time, finish_time) VALUES (1, 4, 3, 98, '2018-05-03 10:00:54', '2018-05-04 10:00:00');
INSERT INTO usrprojectrel (id, usr_id, project_id, score, register_time, finish_time) VALUES (2, 2, 3, 98, '2018-05-03 10:05:00', '2018-05-04 11:00:00');
INSERT INTO usrprojectrel (id, usr_id, project_id, score, register_time, finish_time) VALUES (3, 3, 1, 95, '2018-04-01 10:00:00', '2018-04-05 14:00:00');
INSERT INTO usrprojectrel (id, usr_id, project_id, score, register_time, finish_time) VALUES (4, 1, 1, 95, '2018-04-01 11:00:00', '2018-05-01 15:00:00');


-- company project relationship
INSERT INTO companyprojectrel (id, company_id, project_id, list_time, start_time, expire_time) VALUES (1,3,3, '2018-02-02 08:00:00', '2018-02-02 12:00:00', '2018-10-05 12:00:00');
INSERT INTO companyprojectrel (id, company_id, project_id, list_time, start_time, expire_time) VALUES (2,1,2, '2018-03-01 09:00:00', '2018-03-01 12:00:00', '2018-09-01 12:00:00');
INSERT INTO companyprojectrel (id, company_id, project_id, list_time, start_time, expire_time) VALUES (3,2,1, '2018-01-01 07:00:00','2018-01-01 9:00:00', '2018-12-05 12:00:00');




