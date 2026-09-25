# SQL Analytics Platform — Phase 2

Learning SQL from scratch by writing real queries 
on the Northwind business database.

## Repository Structure

northwind_queries/
├── day1_basic_select.sql
├── day2_filter_sort.sql
├── day3_aggregations.sql
src/
projects/

## Progress

**Day 1 — Basic SELECT and Filtering**
- Retrieved customer IDs and contact names from customers table
- Selected all products and counted total product count
- Filtered products with unit price above 20
- Sorted products alphabetically ascending and descending
- Retrieved top 10 products by unit price

**Day 2 — WHERE Filtering and ORDER BY**
- Filtered orders by year using EXTRACT function
- Searched products containing 'chef' using ILIKE
  for case-insensitive matching
- Sorted orders by freight cost descending

**Day 3 — GROUP BY and Aggregations**
- Counted orders per customer using COUNT with GROUP BY
- Calculated total revenue per product category using SUM
- Computed average order value across all orders
- Found customers with more than 5 orders using HAVING
- Identified categories with average price above 30
- Ranked top 5 revenue generating products

**Day 4 — JOINS — Combining Tables**
- Retrieved products with their category names using INNER JOIN
- Retrieved orders with customer names across two tables
- Found products never ordered using LEFT JOIN with IS NULL
- Built a self JOIN to show employees with their managers
- Combined 4 tables in one query: orders, customers, 
  products, and order details

  **Day 5 — Subqueries**
- Found products more expensive than the average price
  using a scalar subquery
- Found customers who ordered a specific product
  using a nested subquery with IN
- Found the most expensive product in each category
  using a correlated subquery
- Found customers who never placed an order
  using NOT IN with a subquery

## Database
PostgreSQL — Northwind sample business database

## Tech Stack
PostgreSQL • SQL • Docker

## Key Insight
HAVING filters groups after aggregation while WHERE 
filters rows before grouping. Using WHERE instead of 
HAVING on aggregated results is one of the most common 
SQL mistakes beginners make.