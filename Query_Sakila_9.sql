select c.customer_id, c.first_name, c.last_name, sum(p.amount) as sum
from payment p
left join customer c using(customer_id)
where p.amount>3
group by c.customer_id, c.first_name, c.last_name
order by sum(p.amount) desc;

select c.customer_id, c.first_name, c.last_name, sum(p.amount) as sum
from payment p
left join customer c using(customer_id)
where p.amount>3
group by c.customer_id, c.first_name, c.last_name
order by sum(p.amount) desc;

select first_name,  case
	when first_name="Paul"
    then "hallo paul"
    when first_name="Vlad"
    then "hallo vlad"
    else "by"
    end as temp
    from Employee;
    
create table t(
fild int(4) zerofill);
insert into t (fild) value (100), (99999);

create table t2(
fild boolean);
insert into t2 (fild) value (true), (false);

-- creation of database

create database db1;
Use db1;
create table t1 (name VARCHAR(20));
INSERT INTO T1(name) value ("Ivan");
INSERT INTO T1(name) value ("Vova");
select * from t1;

create database db2 charset = "utf8mb4";
show charset;

show databases;

use information_schema;
show tables;
select * from schemata where schema_name='db1';
show collation like "%utf8mb4%";
show variables like "%CHAR%";








