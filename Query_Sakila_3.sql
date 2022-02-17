select address.address, city.city, country.country
from sakila.address
Join sakila.city on address.city_id = city.city_id
Join sakila.country on country.country_id = city.country_id
where city.city = "Kabul" ;

use sakila;
select actor.actor_id, actor.first_name, actor.last_name
from actor
join film_actor on actor.actor_id = film_actor.actor_id
join film on film_actor.film_id = film.film_id
where film.title = "CAUSE DATE";

use sakila;
select count(film.film_id) as FilmsNamber, concat_ws(" ", actor.first_name, actor.last_name) as Actor
from film, actor, film_actor
where film.film_id = film_actor.film_id and film_actor.actor_id = actor.actor_id and concat_ws(" ", actor.first_name, actor.last_name) = "William Hackman";













