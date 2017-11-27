-- 3
SELECT c.customer_id, c.first_name, c.last_name
FROM rental r1, customer c
WHERE NOT EXISTS (SELECT *
							FROM rental r2
							WHERE r1.customer_id = r2.customer_id
							AND r1.rental_id <> r2.rental_id)
AND r1.customer_id = c.customer_id
ORDER BY 1;

-- 4
SELECT c.customer_id, c.first_name, c.last_name
FROM rental r1, customer c
WHERE EXISTS (SELECT *
							FROM rental r2
							WHERE r1.customer_id = r2.customer_id
							AND r1.rental_id <> r2.rental_id)
AND r1.customer_id = c.customer_id
ORDER BY 1;

-- 5


