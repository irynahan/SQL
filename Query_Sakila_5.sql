CREATE TABLE positions(
position_id int PRIMARY KEY,
name varchar(100) CHARACTER SET utf8);

INSERT INTO positions values (1,"Developer");
INSERT INTO positions values (2,"Senior developer");
INSERT INTO positions values (3,"Senior QA engineer");
INSERT INTO positions values (4,"Team Lead");

CREATE TABLE employee 
(employee_id int PRIMARY KEY,
first_name varchar(100) CHARACTER SET utf8,
last_name varchar(100) CHARACTER SET utf8,
position_id int,
address_id smallint(5),
email varchar(100) CHARACTER SET utf8,
manager_id int);

INSERT INTO employee VALUES (1,"PAUL", "TROUT",1, 316, "PAUL.TROUT@sakilacustomer.org",2);
 INSERT INTO employee VALUES (2,"VLAD", "KOROLEV",2, 50, "VLAD.KOROLEV@sakilacustomer.org",4);
 INSERT INTO employee VALUES (3,"IVAN", "IVANOV",3, null, null,4);
 INSERT INTO employee VALUES (4,"MEGA", "BOSS",4, 77, "boss@sakilacustomer.org",null);
 INSERT INTO employee VALUES (5,"GRIGO", "URCH",2, 77, "GRIGO.URCH@sakilacustomer.org",4);
 INSERT INTO employee VALUES (6,"URA", "URCH",1, 77, "URA.URCH@sakilacustomer.org",2);
 
UPDATE employee SET position_id = 8 
WHERE employee_id = 6;

USE sakila;
SELECT emp1.first_name AS Name, emp1.last_name AS Surname, pos1.name as Position, emp2.first_name AS ManagersName, emp2.last_name AS ManagersSurname, pos2.name as ManagersPosition
FROM employee AS emp1
JOIN positions AS pos1 ON emp1.position_id = pos1.position_id 
JOIN employee AS emp2 ON emp1.manager_id = emp2.employee_id
JOIN positions AS pos2 ON emp2.position_id = pos2.position_id;

USE sakila;
SELECT emp1.first_name AS Name, emp1.last_name AS Surname, pos1.name as Position, emp2.first_name AS ManagersName, emp2.last_name AS ManagersSurname, pos2.name as ManagersPosition
FROM employee AS emp1
JOIN positions AS pos1 ON emp1.position_id = pos1.position_id
LEFT JOIN employee AS emp2 ON emp1.manager_id = emp2.employee_id
LEFT OUTER JOIN positions AS pos2 ON emp2.position_id = pos2.position_id;

USE sakila;
SELECT emp1.first_name AS Name, emp1.last_name AS Surname, pos1.name as Position, emp2.first_name AS ManagersName, emp2.last_name AS ManagersSurname, pos2.name as ManagersPosition
FROM employee AS emp1
JOIN positions AS pos1 ON emp1.position_id = pos1.position_id
JOIN employee AS emp2 ON emp1.manager_id = emp2.employee_id and emp1.address_id = emp2.address_id
JOIN positions AS pos2 ON emp2.position_id = pos2.position_id;

USE sakila;
SELECT emp.first_name AS Name, emp.last_name AS Surname, pos.name as Position
FROM employee AS emp
JOIN positions AS pos ON emp.position_id = pos.position_id
JOIN customer AS cust ON emp.first_name = cust.first_name AND emp.last_name = cust.last_name AND emp.address_id = cust.address_id;


select *
from employee e
left outer join positions p  on e.position_id = p.position_id

UNION all

select *
from employee e
right outer join positions p  on e.position_id = p.position_id;


select f.title, fa.*
from film as f
left join film_actor as fa on f.film_id = fa.film_id
where fa.actor_id is null
order by actor_id;
















