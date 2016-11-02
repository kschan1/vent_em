CREATE DATABASE vent_em;

CREATE TABLE vents (
  id SERIAL4 PRIMARY KEY,
  body VARCHAR(140),
  creation_date_time TIMESTAMP,
  user_id INTEGER
);

CREATE TABLE comments (
  id SERIAL4 PRIMARY KEY,
  body VARCHAR(140),
  vent_id INTEGER
);

CREATE TABLE users (
  id SERIAL4 PRIMARY KEY,
  email VARCHAR(300),
  username VARCHAR(200),
  password_digest VARCHAR (400)
);
