# SQL Analytics Platform — Phase 2

Learning SQL from scratch by writing real queries 
on the Northwind business database.

## Repository Structure

northwind_queries/
├── day1_basic_select.sql
├── day2_filter_sort.sql
src/
projects/


## Progress

**Day 16 — Basic SELECT and Filtering**
- Retrieved customer IDs and contact names from customers table
- Selected all products and counted total product count
- Filtered products with unit price above 20
- Sorted products alphabetically ascending and descending
- Retrieved top 10 products by unit price

**Day 17 — WHERE Filtering and ORDER BY**
- Filtered orders by year using EXTRACT function
- Searched products containing 'chef' using ILIKE 
  for case-insensitive matching
- Sorted orders by freight cost descending

## Database
PostgreSQL — Northwind sample business database

## Tech Stack
PostgreSQL • SQL • Docker

## Key Insight
ILIKE performs case-insensitive pattern matching 
in PostgreSQL. Unlike LIKE, it matches regardless 
of uppercase or lowercase letters.