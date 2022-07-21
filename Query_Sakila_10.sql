CREATE DATABASE IF NOT EXISTS db_cp1251cs CHARSET = "cp1251" COLLATE = "cp1251_general_cs";
-- inf_schema shows all databases, tables in server.This 2 rows help to receiwe information about default values of charset and collate of database
USE information_schema;
SELECT * FROM schemata WHERE schema_name='db_cp1251cs';

USE db_cp1251cs;
CREATE TABLE t1 (name VARCHAR(30));
INSERT INTO t1 (name) VALUE ("Николай");
INSERT INTO t1 (name) VALUE ("николай");

select * from t1 where name = "николай";

CREATE DATABASE IF NOT EXISTS db_cp1251ci CHARSET = "cp1251" COLLATE = "cp1251_general_ci" ;

USE information_schema;
SELECT * FROM schemata WHERE schema_name='db_cp1251ci';

USE db_cp1251ci;
CREATE TABLE t1 (name VARCHAR(30));
INSERT INTO t1 (name) VALUE ("Николай");
INSERT INTO t1 (name) VALUE ("николай");

select * from t1 where name = "николай";



-- to change some parameter of database
ALTER DATABASE db_cp1251ci COLLATE = "cp1251_general_ci";

CREATE DATABASE IF NOT EXISTS testDB1 CHARSET='utf8mb4';
use testDB1;
CREATE TABLE persons ( person_id mediumint NOT NULL UNIQUE, person_name varchar(50) NOT NULL);
INSERT INTO persons (person_id, person_name) VALUES (1, 'Юрий Гагарин'), (2, 'Neil Armstrong'),(3, 'Sigmund Jahn');
select * from persons;

USE testDB1;
CREATE TABLE tasks (task_id iNT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
					description VARCHAR(100) NOT NULL COMMENT 'Not comment',
                    task_status ENUM ('New', 'In progress', 'Closed') NOT NULL,
                    last_update TIMESTAMP NOT NULL DEFAULT current_timestamp ON UPDATE current_timestamp);
INSERT INTO tasks (task_id, description, task_status, last_update) VALUES (default, 'Generate a table with orders for the period', 'New', default);
select * from tasks;

select first_name,  case
	when first_name="Paul"
    then "hallo paul"
    when first_name="Vlad"
    then "hallo vlad"
    else "by"
    end as temp
    from Employee;










