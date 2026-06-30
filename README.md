# Pizza Sales SQL Analysis

## Project Overview

This project performs SQL-based analysis on a pizza sales dataset to understand sales performance, revenue patterns, and product-level insights.

The project uses SQL queries to analyze business metrics and extract meaningful insights from sales data.

---

## Tools Used

- SQL
- SQLite
- DB Browser for SQLite
- VS Code

---

## Dataset

Pizza sales dataset containing:

- Order details
- Pizza name and category
- Pizza size
- Quantity sold
- Unit price
- Total price
- Order date
- Order time

---

## Analysis Performed

### Basic Analysis

- Viewed sample records
- Calculated total revenue
- Calculated total orders
- Calculated total pizzas sold
- Calculated average order value

### Filtering Analysis (WHERE Clause)

- Filtered large size pizzas
- Filtered pizzas based on category
- Found large pizzas with quantity greater than 2
- Filtered pizzas with total price greater than $20

### Sales Analysis

- Top 5 best-selling pizzas
- Bottom 5 selling pizzas
- Revenue by pizza category
- Revenue by pizza size
- Quantity sold by category

### Time Analysis

- Daily sales trend
- Monthly sales trend
- Peak ordering hours

### Advanced SQL Analysis

- Highest revenue pizza
- Pizzas with above average revenue
- Categories with above average quantity sold
- Average pizzas sold per order

### SQL Concepts Used

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- Aggregate Functions
- HAVING
- Subqueries

---

## Database

SQLite database file included:

- pizza_sales_database.db

---

## Project Structure

```text
Pizza-Sales-SQL-Project/

├── PIZZA_SALES_PROJECT.sql
├── pizza_sales.csv
├── pizza_sales_database.db
├── README.md
└── screenshots/
    ├── database_structure.png
    ├── sample_data.png
    ├── sales_summary.png
    ├── top_5_pizzas.png
    ├── monthly_sales.png
    └── advanced_analysis.png
```

---

## Key Insights

- Identified total revenue, total orders, and total pizzas sold from the dataset
- Analysed best-selling and lowest-selling pizzas based on quantity sold
- Compared revenue contribution across different pizza categories and sizes
- Studied daily and monthly sales trends to understand ordering patterns
- Analysed peak ordering hours to identify high-demand periods
- Used filtering, aggregation, grouping, HAVING, and subqueries for business analysis

---

## Author

Thilaka