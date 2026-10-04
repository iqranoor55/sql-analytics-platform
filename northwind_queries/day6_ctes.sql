
--  products more expensive than average
WITH my_cte AS (
    SELECT category_id,AVG(unit_price) AS average_price
    FROM products
    GROUP BY category_id
)
SELECT products.* , my_cte.average_price  
FROM products
JOIN my_cte
ON my_cte.category_id= products.category_id
WHERE products.unit_price > my_cte.average_price ;
--   customers who never placed an order.  
 WITH customer_order AS (
    SELECT customer_id
    FROM orders
    WHERE order_id is NOT NULL
 )
 SELECT  contact_name,customer_id
 FROM customers
 WHERE customer_id NOT IN ( SELECT customer_id FROM customer_order);
--   monthly revenue trend
WITH revenue_trend AS(
    SELECT order_id, unit_price*quantity*(1-discount) AS revenue
    FROM order_details
)
SELECT
EXTRACT(YEAR FROM orders.order_date) AS order_year,
EXTRACT(MONTH FROM orders.order_date) AS order_month,
    SUM(revenue_trend.revenue) AS total_monthly_revenu
FROM orders
JOIN revenue_trend
ON orders.order_id=revenue_trend.order_id
GROUP BY
EXTRACT(YEAR FROM orders.order_date),
EXTRACT(MONTH FROM orders. order_date)
ORDER BY 
    order_year, 
    order_month;
