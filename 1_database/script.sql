-- Write your SQL code here
--Using MySQL
CREATE DATABASE `153378_project`;
-- Use the created database
USE `153378_project`;

-- Grant all privileges to group members
CREATE USER '166222'@'%' IDENTIFIED BY '5trathm0re';
CREATE USER '169003'@'%' IDENTIFIED BY '5trathm0re';
CREATE USER '169975'@'%' IDENTIFIED BY '5trathm0re';
CREATE USER '169547'@'%' IDENTIFIED BY '5trathm0re';

GRANT ALL PRIVILEGES ON `153378_project`.* TO `166222`@`%`;
GRANT ALL PRIVILEGES ON `153378_project`.* TO `169003`@`%`;
GRANT ALL PRIVILEGES ON `153378_project`.* TO `169975`@`%`;
GRANT ALL PRIVILEGES ON `153378_project`.* TO `169547`@`%`;