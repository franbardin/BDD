-- 1

SELECT customer_id,CONCAT_WS(' ',First_name,Last_Name ) AS 'Nombre', address, postal_code AS 'Codigo ZIP', phone, city, country, store_id,
CASE active
    WHEN "1" THEN "Activo"
    WHEN "0" THEN "Inactivo"
ELSE "Inactivo"
END AS "Estado"
FROM customer
INNER JOIN address USING(address_id)
INNER JOIN city USING(city_id)
INNER JOIN country USING(country_id)
INNER JOIN store USING(store_id);

SELECT * FROM list_of_customers;

-- 2

SELECT film_id,title, description,  category.name,  payment.amount,film.`length`, film.rating, GROUP_CONCAT(first_name)
FROM film
INNER JOIN film_category USING(film_id)
INNER JOIN category USING(category_id)
INNER JOIN film_actor USING(film_id)
INNER JOIN actor USING(actor_id)
INNER JOIN inventory USING(film_id)
INNER JOIN rental USING(inventory_id)
INNER JOIN payment USING(rental_id)
GROUP BY 1,2,3,4,5,6,7;

-- 3

DROP VIEW IF EXISTS sales_by_film_category2

CREATE VIEW sales_by_film_category2 AS
SELECT name, SUM(amount) AS total_rental
FROM category
JOIN film_category USING (category_id)
JOIN film USING (film_id)
JOIN inventory USING (film_id)
JOIN rental USING (inventory_id)
JOIN payment USING (rental_id)
GROUP BY name

-- 4

DROP VIEW IF EXISTS actor_information

CREATE VIEW actor_information AS
SELECT actor_id, CONCAT_WS(' ', first_name, last_name) AS actor, COUNT(film.film_id) AS total_films
FROM actor
JOIN film_actor USING (actor_id)
JOIN film USING (film_id)
GROUP BY actor_id