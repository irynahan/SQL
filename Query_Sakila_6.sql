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

select f.title, fa.*
from film as f
left join film_actor as fa on f.film_id = fa.film_id
where f.film_id is null
order by actor_id;

SELECT *
FROM employee e
NATURAL JOIN positions;

SELECT *
FROM film f
NATURAL JOIN film_text ft;

SELECT *
FROM city e
JOIN country c USING (country_id);

Use sakila;
SELECT f.title, a.first_name, a.last_name
FROM film f
JOIN film_actor fa USING (film_id)
JOIN actor a USING (actor_id)
WHERE f.title = "ANONYMOUS HUMAN";

USE sakila;
SELECT emp.first_name AS Name, emp.last_name AS Surname, pos.name as Position
FROM employee AS emp
JOIN positions AS pos ON emp.position_id = pos.position_id
JOIN customer AS cust ON emp.first_name = cust.first_name AND emp.last_name = cust.last_name and emp.address_id = cust.address_id;

USE sakila;
SELECT emp.first_name AS Name, emp.last_name AS Surname, sum(p.amount) AS TotalAmount
FROM employee emp
JOIN customer cust USING (first_name, last_name, address_id)
JOIN payment p USING (customer_id)
group by cust.customer_id;

select *
from positions p
left join employee using (position_id)
where employee_id is null

union

select *
from employee
right join positions using (position_id)
where employee_id is null;


select p.name, e.employee_id
from positions p
left join employee e using (position_id)
where employee_id is null;

SELECT e.first_name, e.last_name, count(s.employee_id)
FROM employee e
left join employee s ON s.manager_id = e.employee_id
group by e.first_name, e.last_name;

select e.first_name, e.last_name, count(s.employee_id)
from employee e
left join employee s ON s.manager_id = e.employee_id
group by e.first_name, e.last_name;


SELECT p.payment_id, p.amount, (select MAX(amount) from payment) as max_amount
FROM payment p;

select * ,
	(select count(m.position_id) from employee m where e.position_id = m.position_id)
from employee e;

SELECT p.payment_id, p.amount, 
	((select MAX(amount) from payment) - p.amount) as max_amount,
    (select concan(first_name, ' ' , last_name) from customer c where c.customer_id = p.customer_id) as first_name
FROM payment p;

select a.*,
	(select count(fa.film_id) from film_actor fa where a.actor_id = fa.actor_id) as film_number
from actor a;

select c.*, 
	(select count(film_id) from film_category as fc where fc.category_id = c.category_id)/
    (select count(film_id) from film f)*100 as percent
from category c;


select p.payment_id, p.amount, p.payment_date, p.customer_id, c.first_name, c.last_name,
	(p.payment_id)/(select count(pay.amount) from payment pay where pay.customer_id = p.customer_id)*100 as Percent
from customer c
left join payment p using(customer_id);

select *
from payment
where amount = (select MAX(p.amount) from payment p);

select *
from payment
where amount in (select p.amount from payment p where p.amount > 2 and p.amount < 5);

select c.customer_id, c.first_name, c.last_name, p.payment_id, p.payment_date, p.amount
from payment p
join customer c on c.customer_id = p.customer_id
where p.amount > (select avg(p.amount) from payment p) + 3 or p.amount > (select avg(p.amount) from payment p) - 3;

select *
from positions p
left join employee e using (position_id)
where employee_id is null;

select *
from positions 
where position_id not in (select position_id from employee);

select *
from positions p
where NOT exists (select position_id from employee e where p.position_id = e.position_id);

select c.category_id, c.name, count(fc.film_id) as filmNumber
from  category c
join film_category fc using (category_id)
group by c.category_id, c.name;

select c.category_id, c.name, (select count(fc.film_id) from film_category fc where c.category_id = fc.category_id) as filmNumber
from category c;

# how many actors took part in the films with category sport
select c.name, count(fa.actor_id)
from category c
join film_category fc using (category_id)
join film_actor fa using (film_id)
where c.name = 'Sports';

select f.title, fc.category_id
from film f
left join film_category fc using (film_id)
where fc.category_id is null;

select f.*
from film f
where f.film_id not in (select film_id from film_category);

select *
from payment pay
where pay.amount > all (select avg(amount) 
from payment p 
join customer c using (customer_id)
where concat_ws(' ', c.first_name, c.last_name) in ('BARBARA JONES', 'MARIA MILLER', 'SUSAN WILSON')
group by p.payment_date);

use sakila;
insert employee values (7, "LENA", "GROMOVA",1, 38,"qwe@qwe.de", 2);

use sakila;



use sakila;
insert into employee (employee_id,first_name,last_name)
values (7, "LENA", "GROMOVA"),
	   (8, "SVETA", "KOLOVA");
       
insert into employee (employee_id,first_name,last_name)
select employee_id+10, concat(first_name, ' ', last_name) from employee where employee_id in (8,9,7);

use sakila;
insert category (category_id, name, last_update) 
values (94, "sketch4",deault)
on duplicate key update category_id = category_id - 30;

insert into employee (employee_id,first_name,last_name)
values ((select max(employee_id) + 1), (select employee_id from employee e where e.last_name="IVANOV"),"Perova");

use sakila;
insert into customer (store_id, first_name, last_name, address_id, email, create_date)
values (2, (select first_name from employee where employee_id = 2), (select last_name from employee where employee_id = 2), (select address_id from employee where employee_id = 2), (select email from employee where employee_id = 2), now()),
	   (2, (select first_name from employee where employee_id = 4), (select last_name from employee where employee_id = 4), (select address_id from employee where employee_id = 4), (select email from employee where employee_id = 4), now())
       
use sakila;

insert into actor (actor_id, first_name, last_name, last_update) 
values (default, "ANDREY", "MIRONOV", default),
	   (default, "ANATOLII", "PAPANOV", default);
       
insert into language (name) values ('russisch');
       
insert into film (title, language_id) values ('Briliantovaya ruka', 7);

insert into film_actor (actor_id, film_id)
values (205, 1002),
	   (206, 1002)







