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
INSERT INTO experience (id, usr_id, title, company, duration, description, tags, curr) VALUES (1, 2, 'Product Manager', 'Verizon', '2', 'Post-merger integration with Oath', 'ui design, product management, presentation, marketing');
INSERT INTO experience (id, usr_id, title, company, duration, description, tags, curr) VALUES (1, 2, 'Marketing Analyst', 'Yahoo', '2', 'Online marketing for ICOs', 'blockchain, press release, brand development, pr, blogging');