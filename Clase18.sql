DROP PROCEDURE IF EXISTS classicmodels.GetAllProducts ;

DELIMITER $$
$$
CREATE PROCEDURE GetAllProducts()
	BEGIN
	SELECT *  FROM products;
	END  $$
DELIMITER ;

DECLARE total_products INT DEFAULT 0

SELECT COUNT(*) INTO total_products
FROM products

-- - - - - - - --

DROP PROCEDURE IF EXISTS classicmodels.GetOfficeByCountry ;

DELIMITER $$
$$
CREATE PROCEDURE GetOfficeByCountry(IN countryName VARCHAR(255))
    BEGIN
        SELECT * 
        FROM offices
        WHERE country = countryName;
    END $$
DELIMITER ;

CALL GetOfficeByCountry('USA');

CALL GetOfficeByCountry('France');

-- - - - - - --

DROP PROCEDURE IF EXISTS classicmodels.CountOrderByStatus ;

DELIMITER $$
$$
CREATE PROCEDURE CountOrderByStatus(
        IN orderStatus VARCHAR(25),
        OUT total INT)
BEGIN
    SELECT count(orderNumber)
    INTO total
    FROM orders
    WHERE status = orderStatus;
END$$ $$
DELIMITER ;

CALL CountOrderByStatus('Shipped',@total);
SELECT @total;

