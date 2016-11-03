CREATE DATABASE vent_em;

CREATE TABLE vents (
  id SERIAL4 PRIMARY KEY,
  body VARCHAR(139) NOT NULL,
  creation_date_time TIMESTAMP,
  user_id INTEGER,
  vent_type_id INTEGER
);

CREATE TABLE comments (
  id SERIAL4 PRIMARY KEY,
  body VARCHAR(139) NOT NULL,
  vent_id INTEGER
);

CREATE TABLE users (
  id SERIAL4 PRIMARY KEY,
  email VARCHAR(300) NOT NULL,
  username VARCHAR(200) NOT NULL,
  password_digest VARCHAR(400)
);

CREATE TABLE likes (
  id SERIAL4 PRIMARY KEY,
);

CREATE TABLE vent_types (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(200)
);

INSERT INTO vent_types (name) VALUES ('work');
INSERT INTO vent_types (name) VALUES ('home');
INSERT INTO vent_types (name) VALUES ('relationship');
INSERT INTO vent_types (name) VALUES ('transport');
INSERT INTO vent_types (name) VALUES ('money');
INSERT INTO vent_types (name) VALUES ('politics');
INSERT INTO vent_types (name) VALUES ('miscellaneous');

-- ALTER TABLE vents ALTER COLUMN body SET NOT NULL;
-- ALTER TABLE comments ALTER COLUMN body SET NOT NULL;
-- ALTER TABLE users ALTER COLUMN email SET NOT NULL;
-- ALTER TABLE users ALTER COLUMN username SET NOT NULL;
