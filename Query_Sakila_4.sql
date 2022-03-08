use sakila;
select a.first_name, a.last_name, count(title) as films_count
from actor a
join film_actor fa on a.actor_id=fa.actor_id
join film f on f.film_id = fa.film_id
where first_name = "WILLIAM" and last_name = "HACKMAN";

USE sakila;
SELECT film.film_id, film.title, category.*
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id;

USE sakila;
SELECT customer.customer_id, first_name, last_name, sum(amount)
FROM customer, payment
WHERE customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
ORDER BY customer_id, first_name, last_name; 

USE sakila;
SELECT film.title as FilmName, count(fa.actor_id) as ActorsNumber
FROM film
JOIN film_actor as fa ON film.film_id = fa.film_id
GROUP BY FilmName2
ORDER BY ActorsNumber2 desc;

USE sakila;
SELECT film.title as FilmName, count(film_category.category_id) as CategoriesNumber
FROM film
JOIN film_category ON film.film_id = film_category.film_id
GROUP BY film.film_id, film.title
ORDER BY CategoriesNumber desc;

SELECT p1.*, p2.*
FROM payment p1
JOIN payment p2
ON p1.customer_id = p2.customer_id
AND DATE(p1.payment_date) = DATE(p2.payment_date)
AND p1.amount + p2.amount = 9.98
AND p1.payment_id>p2.payment_id;

use sakila;
select 
	main_film.film_id, main_film.title, 
    main_actor.actor_id, main_actor.last_name,
	(select group_concat(concat(rest_actor.actor_id,' ',rest_actor.last_name),'') 
		from film_actor rest_film_actors
        inner join actor rest_actor on rest_actor.actor_id=rest_film_actors.actor_id
        where rest_film_actors.film_id=main_film.film_id
        and rest_film_actors.actor_id<>main_actor.actor_id
        )
from film main_film
inner join film_actor main_film_actor on main_film_actor.film_id=main_film.film_id
inner join actor main_actor on main_actor.actor_id=main_film_actor.actor_id

order by main_film.film_id, main_actor.actor_id;

use sakila;
select 
	main_film.film_id, main_film.title, 
    main_actor.actor_id, concat(main_actor.last_name,' ', main_actor.first_name),
	(select group_concat(concat(rest_actor.last_name,' ', rest_actor.first_name),'  ') 
		from film_actor rest_film_actors
        join actor rest_actor on rest_actor.actor_id=rest_film_actors.actor_id
        where rest_film_actors.film_id=main_film.film_id
        and rest_film_actors.actor_id<>main_actor.actor_id
        )
from film main_film
join film_actor main_film_actor on main_film_actor.film_id=main_film.film_id
join actor main_actor on main_actor.actor_id=main_film_actor.actor_id

order by main_film.film_id, main_actor.actor_id

















