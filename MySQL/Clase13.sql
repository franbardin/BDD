-- Add a new customer
SELECT 1, "Francisco", "Bardin", "franciscobardin@gmail.com", address_id FROM address
INNER JOIN city USING (city_id)
INNER JOIN country USING (country_id)
WHERE country.country = "United States"
ORDER BY address.address_id DESC
LIMIT 1;

INSERT INTO sakila.customer
(store_id, first_name, last_name, email, address_id, active, create_date)
SELECT 1, "Francisco", "Bardin", "franciscobardin@gmail.com", MAX(address_id), 1, CURRENT_TIMESTAMP FROM address
INNER JOIN city USING (city_id)
INNER JOIN country USING (country_id)
WHERE country.country = "United States";

-- 2 EL DOS
SELECT CURRENT_TIMESTAMP, MAX(inventory_id), 1, CURRENT_TIMESTAMP, staff_id FROM rental
INNER JOIN staff USING (staff_id)
INNER JOIN inventory USING (inventory_id)
INNER JOIN film USING (film_id)
WHERE film.title LIKE 'ACA%'
AND staff.store_id = 2
GROUP BY 3;

INSERT INTO sakila.rental
(rental_date, inventory_id, customer_id, return_date, staff_id)
SELECT CURRENT_TIMESTAMP, MAX(inventory_id), 1, CURRENT_TIMESTAMP, staff_id FROM rental
INNER JOIN staff USING (staff_id)
INNER JOIN inventory USING (inventory_id)
INNER JOIN film USING (film_id)
WHERE film.title LIKE 'ACA%'
AND staff.store_id = 2
GROUP BY 3;

INSERT INTO sakila.rental
(rental_date, inventory_id, customer_id, return_date, staff_id)
SELECT CURRENT_TIMESTAMP, MAX(inventory_id), 1, CURRENT_TIMESTAMP, staff_id FROM rental
INNER JOIN staff USING (staff_id)
INNER JOIN inventory USING (inventory_id)
INNER JOIN film USING (film_id)
WHERE film.title LIKE 'ACADEMY DINOSAUR'
AND staff.store_id = 2
GROUP BY staff_id;

-- 3
UPDATE film
SET release_year = '2001'
WHERE rating = 'G'

UPDATE film
SET release_year = '2002'
WHERE rating = 'PG'

UPDATE film
SET release_year = '2003'
WHERE rating = 'NC-17'

UPDATE film
SET release_year = '2004'
WHERE rating = 'PG-13'

UPDATE film
SET release_year = '2005'
WHERE rating = 'R'

-- 4 

SELECT title, rental.rental_id
FROM film
INNER JOIN inventory USING (film_id)
INNER JOIN rental USING (inventory_id)
WHERE rental.return_date IS NULL
LIMIT 1;

UPDATE rental
SET rental.return_date = CURRENT_TIMESTAMP
WHERE rental.rental_id = "14.098";

