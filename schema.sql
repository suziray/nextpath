drop table if exists user;
create table user (
  id serial PRIMARY KEY,
  name text not null,
  experience text,
  education text,
  skill text

);

drop table if exists project;
create table project (
  id serial PRIMARY KEY,
  title text not null,
  skill text,
  description text,
  create_time timestamp not null
);

drop table if exists company;
create table company (
  id serial PRIMARY KEY,
  name text not null,
  type text,
  url text,
  size integer
);


drop table if exists userprojectrel;
create table userprojectrel (
  id serial PRIMARY KEY,
  user_id integer REFERENCES user (id),
  project_id integer REFERENCES project (id),
  score decimal,
  register_time timestamp not null,
  finish_time timestamp
);

drop table if exists companyprojectrel;
create table companyprojectrel (
  id serial PRIMARY KEY,
  company_id integer REFERENCES user (id),
  project_id integer REFERENCES project (id),
  list_time timestampe not null,
  start_time timestamp not null,
  expire_time timestamp not null
);


