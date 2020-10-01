CREATE DATABASE testdb;
USE testdb;
DROP TABLE IF EXISTS roles;
CREATE TABLE roles (
    id int AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    createdAt TIMESTAMP,
    updatedAt TIMESTAMP
);

TRUNCATE roles;
INSERT INTO roles (id, name) VALUES
(1,	'ROLE_USER'),
(2,	'ROLE_MODERATOR'),
(3,	'ROLE_ADMIN');


DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id bigint AUTO_INCREMENT PRIMARY KEY,
    email character varying(50),
    password character varying(120),
    username character varying(20),
    createdAt TIMESTAMP,
    updatedAt TIMESTAMP
);

DROP TABLE IF EXISTS user_roles;
CREATE TABLE user_roles (
    userId bigint NOT NULL,
    roleId integer NOT NULL,
    createdAt TIMESTAMP,
    updatedAt TIMESTAMP,
    PRIMARY KEY (userId,roleId),
    FOREIGN KEY (roleId) REFERENCES roles(id),
    FOREIGN KEY (userId) REFERENCES users(id)
);