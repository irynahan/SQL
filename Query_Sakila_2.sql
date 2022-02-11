select customer_id as Customer, date(payment_date) as PaymentDate,  avg(amount) as AverageAmonut, count(amount) as PaymentsNumber
from sakila.payment
group by Customer, PaymentDate
order by PaymentsNumber desc;

select customer_id as Customer, date(payment_date) as PaymentDate,  avg(amount) as AverageAmonut, count(amount) as PaymentsNumber
from sakila.payment
where amount > 5
group by Customer, PaymentDate
order by PaymentsNumber desc;

select payment.customer_id, first_name, last_name, payment_id, payment_date
from sakila.customer, sakila.payment
where payment.customer_id = customer.customer_id;

select p.customer_id, first_name, last_name, payment_id, payment_date
from customer as c, payment as p
where p.customer_id = c.customer_id;

select payment.customer_id, first_name, last_name, payment_id, payment_date
from customer
Join payment on  payment.customer_id = customer.customer_id;

select address.address, city.city, country.country
from sakila.address, sakila.city, sakila.country
where country.country_id = city.country_id and address.city_id = city.city_id;

select address.address, city.city, country.country
from sakila.address
Join sakila.city on address.city_id = city.city_id
Join sakila.country on country.country_id = city.country_id;











