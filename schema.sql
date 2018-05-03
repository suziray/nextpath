create table usr (
  id serial PRIMARY KEY,
  first_name text not null,
  last_name text not null,
  experience text,
  education text,
  skill text
);

create table project (
  id serial PRIMARY KEY,
  title text not null,
  skill text,
  description text,
  create_time timestamp not null
);

create table company (
  id serial PRIMARY KEY,
  name text not null,
  type text,
  url text,
  size integer
);

create table usrprojectrel (
  id serial PRIMARY KEY,
  usr_id integer REFERENCES usr (id),
  project_id integer REFERENCES project (id),
  score decimal,
  register_time timestamp not null,
  finish_time timestamp
);

create table companyprojectrel (
  id serial PRIMARY KEY,
  company_id integer REFERENCES company (id),
  project_id integer REFERENCES project (id),
  list_time timestamp not null,
  start_time timestamp not null,
  expire_time timestamp not null
);
