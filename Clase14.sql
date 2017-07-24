-- 1
SELECT CONCAT_WS(" ", customer.first_name, customer.last_name) 
FROM customer
INNER JOIN address USING (address_id)
INNER JOIN city USING (city_id)
INNER JOIN country USING (country_id)
WHERE country.country = "Argentina";

-- 2 
SELECT `language`.name, title,
CASE
WHEN rating = 'NC-17' THEN 'No One 17 and Under Admitted.'
WHEN rating = 'R' THEN 'Under 17 Requires Accompanying Parent Or Adult Guardian.'
WHEN rating = 'PG-13' THEN 'Some Material May Be Inappropriate For Children Under 13.'
WHEN rating = 'PG' THEN 'Some Material May Not Be Suitable For Children.'
WHEN rating = 'G' THEN 'All Ages Are Admitted.'
END AS description
FROM film
INNER JOIN `language` USING (language_id);

-- 3
SELECT title, release_year
FROM film 
INNER JOIN film_actor USING(film_id)
INNER JOIN actor USING(actor_id)
WHERE CONCAT_WS(" ",first_name,last_name) LIKE TRIM(UPPER("Adam Hopper"));

-- 4 No salió

-- 5

-- Ambos sirven para convertir el tipo de data. Se diferencian en que CONVERT es propio de SQL mientras que CAST es mas genérico. 
-- También se diferencian en que CONVERT es mas flexible cuando se convierte ciertos tipos de archivos como fechas, valores de tiempo o numeros fraccionales. 

SELECT CONVERT(rental_date, DATE) FROM rental;

SELECT CAST(rental_date AS DATE) FROM rental;

-- 6

-- NVL, ISNULL, IFNULL y COALESCE se utilizan para filtrar información segun si un valor es o no NULL.
-- MySQL utiliza la función ISNULL y COALESCE
;