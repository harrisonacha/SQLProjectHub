/* Which product categories drive the biggest profits? Is this the same across store locations? */

SELECT
    p.product_category,
    s.store_location,
    SUM(p.product_price - p.product_cost) AS total_profit
FROM
    products AS p
FULL JOIN
    inventory AS i ON p.product_id = i.product_id
FULL JOIN
    stores AS s ON i.store_id = s.store_id
GROUP BY
    p.product_category,
    s.store_location
ORDER BY
	total_profit DESC;
  
 /* Result: Toys category drives the biggest profits amongst the product categories at Maven Toys. Also, Toys drives the biggest profits across store locations.
 
