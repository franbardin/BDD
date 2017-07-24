-- 1
SELECT country, (SELECT COUNT(*)
						FROM city c2
						WHERE c1.country_id = c2.country_id) AS city
FROM country c1;
 
-- 1 
SELECT country, COUNT(*)
FROM city b, country a
WHERE b.country_id = a.country_id;

-- 2 
SELECT country, COUNT(*)
FROM city b, country a
WHERE b.country_id = a.country_id
GROUP BY country
HAVING COUNT(*) > 10;

-- 2
SELECT country_id, country, COUNT(*) num_of_cities
FROM country
INNER JOIN city USING (country_id)
GROUP BY country_id, country
HAVING COUNT(*) > 10
ORDER BY num_of_cities DESC;

-- 3
SELECT c.first_name, c.last_name, address.address, COUNT(rental.rental_id), SUM(payment.amount)
	FROM customer c    
		INNER JOIN address USING(address_id)
		INNER JOIN rental USING(customer_id)
		INNER JOIN payment USING(rental_id)
GROUP BY 1,2,3
ORDER BY 5 DESC;

-- 4 Find all the films titles that are not in the inventory
SELECT film.title
	FROM film
	WHERE film.film_id NOT IN (SELECT film_id FROM inventory);
	
-- 5 Find all the films that are in the inventory but were never rented.
	-- Show title and inventory_id
-- Mal hecho
SELECT film.title, inventory.inventory_id
FROM film
INNER JOIN inventory USING (film_id)
LEFT OUTER JOIN rental USING (inventory_id)
GROUP BY 2;


-- 5
SELECT *
FROM (SELECT title,inventory_id
			FROM film
				INNER JOIN inventory USING(film_id)) a
WHERE inventory_id NOT IN(SELECT DISTINCT inventory_id
									FROM rental);

-- 5
SELECT film.title, inventory.inventory_id
FROM film
INNER JOIN inventory USING (film_id)
LEFT  JOIN rental USING (inventory_id)
WHERE rental.rental_id IS NULL;

-- 6
SELECT first_name, last_name, customer.store_id, title, rental_date, return_date
FROM customer 
JOIN rental USING(customer_id)
JOIN inventory USING (inventory_id)
JOIN film USING (film_id)
ORDER BY customer.store_id, last_name;

SELECT title, MIN(`length`)   	
FROM film f1
WHERE `length` = MIN(`length`);