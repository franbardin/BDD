-- 1

SELECT COUNT(*)
FROM inventory
INNER JOIN film USING(film_id)
INNER JOIN store USING(store_id)
WHERE film.title LIKE  ( 'ACADEMY DINOSAUR' )
AND store_id=1;

CREATE FUNCTION Copies_Amount(movie_name VARCHAR(100),movie_store INT) RETURNS INT
	DETERMINISTIC
BEGIN
    	DECLARE am INT;
    	SET am = (SELECT COUNT(*) FROM inventory
	INNER JOIN store USING(store_id)
	INNER JOIN film USING(film_id)
	WHERE film.title LIKE movie_name
	AND store_id = movie_store);
    RETURN (am);
END

SELECT Copies_Amount('ACADEMY DINOSAUR', 1);

-- 2 maomé(mas má que mé) 

SELECT datList(first_name, " " ,last_name SEPARATOR "; ") FROM customer
	INNER JOIN address USING(address_id)
	INNER JOIN city USING(city_id)
	INNER JOIN country USING(country_id);
	
CALL customerList("Inglaterra", @p_customerList);
SELECT @p_customerList;

SET @m_list = "";
CALL customerList("Inglaterra", @m_list);
SELECT @m_list;


-- Segunda parte

CREATE DEFINER=`root`@`%` PROCEDURE `sakila`.`customerList`(
    IN  p_countryName VARCHAR(50),
    OUT p_customerList  TEXT
)
BEGIN
   SELECT datList(first_name, " " ,last_name SEPARATOR " ; ") INTO p_customerList FROM customer
	INNER JOIN country USING(country_id)
	INNER JOIN city USING(city_id)
	INNER JOIN address USING(address_id)
	WHERE country = p_countryName;
END