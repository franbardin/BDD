-- Ejercicios
-- 1
SELECT first_name, last_name
FROM actor a1
WHERE last_name IN (SELECT last_name
							FROM actor a2
							WHERE a1.last_name = a2.last_name
							AND a1.actor_id <> a2.actor_id)
ORDER BY last_name;

-- 2
SELECT first_name, last_name
FROM actor
WHERE actor_id NOT IN (SELECT DISTINCT actor_id
						FROM film_actor);
						
-- 3
SELECT first_name, last_name
FROM customer c1
WHERE NOT EXISTS (SELECT *
							FROM rental r1, customer c2
							WHERE c2.customer_id = r1.customer_id
							AND c1.customer_id <> c2.customer_id);
							
-- 5 
SELECT DISTINCT first_name, last_name
FROM actor a, film f, film_actor fa
WHERE a.actor_id =  fa.actor_id
AND fa.film_id = f.film_id
AND f.title IN ('BETRAYED REAR', 'CATCH AMISTAD');

-- 6
SELECT DISTINCT first_name, last_name
FROM actor a, film f, film_actor fa
WHERE a.actor_id = fa.actor_id
AND fa.film_id = f.film_id
AND f.title IN ('%BETRAYED REAR%' AND '%CATCH AMISTAD%');
 