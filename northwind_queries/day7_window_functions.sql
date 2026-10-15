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
--  running monthly revenue total
WITH MonthlySales AS (
    -- Step 1: Calculate the total revenue for each month
    SELECT 
        TO_CHAR(o.order_date, 'YYYY-MM') AS order_month, 
        ROUND(SUM(od.unit_price * od.quantity * (1.0 - od.discount))::numeric, 2) AS monthly_revenue
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    GROUP BY TO_CHAR(o.order_date, 'YYYY-MM')
)
-- Step 2: Use a Window Function to calculate the cumulative running total
SELECT 
    order_month,
    monthly_revenue,
    ROUND(
        SUM(monthly_revenue) OVER (
            ORDER BY order_month
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        )::numeric, 2
    ) AS running_total
FROM MonthlySales
ORDER BY order_month;
-- top 3 customers per country
WITH CustomerSpending AS (
    -- Step 1: Calculate total spending for each customer
    SELECT 
        c.country,
        c.customer_id,
        c.company_name,
        ROUND(SUM(od.unit_price * od.quantity * (1.0 - od.discount))::numeric, 2) AS total_spent
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_details od ON o.order_id = od.order_id
    GROUP BY c.country, c.customer_id, c.company_name
),
RankedCustomers AS (
    -- Step 2: Rank customers within each country using a Window Function
    SELECT 
        country,
        customer_id,
        company_name,
        total_spent,
        DENSE_RANK() OVER (
            PARTITION BY country 
            ORDER BY total_spent DESC
        ) AS spending_rank
    FROM CustomerSpending
)
-- Step 3: Filter for only the top 3 per country
SELECT 
    country,
    spending_rank,
    customer_id,
    company_name,
    total_spent
FROM RankedCustomers
WHERE spending_rank <= 3
ORDER BY country ASC, spending_rank ASC;



