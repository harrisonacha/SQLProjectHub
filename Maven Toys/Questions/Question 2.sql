/* Q2: How much money is tied up in inventory at the toy stores? How long will it last? */
	
SELECT * FROM inventory;
SELECT * FROM sales;


SELECT
	SUM (stock_on_hand * product_cost) AS amount_in_inventory
FROM
	inventory as i
FULL JOIN
	products as p
ON 
	p.product_id = i.product_id
WHERE
    p.product_category = 'Toys';
	
/* Paer A Result: $99,861.47 is tied up in inventory at the Toys stores. */

SELECT
	AVG(i.stock_on_hand / s.average_daily_sales) AS estimated_days_last
FROM
    inventory AS i
JOIN
    products AS p ON p.product_id = i.product_id
JOIN
    (
        SELECT
            product_id,
            AVG(units) AS average_daily_sales
        FROM
            sales
        GROUP BY
            product_id
    ) AS s ON s.product_id = p.product_id
WHERE
    p.product_category = 'Toys';

/* Part B Result: It would last for about 14 days. */

