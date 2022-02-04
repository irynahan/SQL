show databases;
use sakila;
show tables;
select * from actor limit 10;
DESC actor;
select concat_ws("/", last_name, first_name) as fio from actor;

select *
from actor
where first_name = "Dan" or last_name = "Kilmer";

select *
from payment
where amount between 2 and 5;

select *
from sakila.payment
where customer_id = 7 and payment_date between DATE ('2005-05-01') and ('2005-06-01');

select payment_id, payment_date, last_update, amount
from sakila.payment
where (amount<2 or amount>7) and amount != 0
order by last_update desc, amount
limit 20;

select avg(amount), customer_id
from payment
group by customer_id;

select count(first_name), first_name
from actor
group by first_name
order by count(first_name) desc
limit 5;

select max(amount), date(payment_date) as paymentdate
from payment
group by paymentdate;

select *
from sakila.payment
where customer_id in (3,4) and amount >= 7;

select avg(amount) as AverageAmonut, customer_id as Customer
from sakila.payment
where amount > 7
group by customer_id;











