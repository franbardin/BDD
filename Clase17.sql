SELECT * FROM customers;
CREATE INDEX postalCode ON customers(postalCode);

ALTER TABLE products  
ADD FULLTEXT(productDescription,productLine);

CREATE FULLTEXT INDEX address
ON offices(addressLine1,addressLine2);

ALTER TABLE offices
DROP INDEX address;

ALTER TABLE products 
ADD FULLTEXT(productline);

SELECT productName, productline
FROM products
WHERE MATCH(productline) AGAINST('Classic');

SELECT productName, productline
FROM products
WHERE MATCH(productline) AGAINST('Classic,Vintage');

-- 1

SELECT address,CONCAT_WS(" ",first_name,last_name) AS "Nombre"
FROM address
INNER JOIN customer USING(address_id);

SELECT * FROM address
WHERE postal_code IN (SELECT postal_code 
					  FROM address 
					  WHERE postal_code LIKE '%3%');
					  
CREATE INDEX codigo_direccion ON address(postal.code);
