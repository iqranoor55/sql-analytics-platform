--  rank products by sales within category
SELECT 
    p.category_id,
    p.product_name,
    SUM(od.quantity * od.unit_price * (1 - od.discount)) AS total_sales,
    RANK() OVER (
        PARTITION BY p.category_id 
        ORDER BY SUM(od.quantity * od.unit_price * (1 - od.discount)) DESC
    ) AS ranked_by_sales
FROM products p
JOIN order_details od ON p.product_id = od.product_id
GROUP BY p.category_id, p.product_id, p.product_name;

