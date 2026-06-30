-- =========================================
-- Pizza Sales SQL Project
-- Author : Thilaka
-- Description : SQL analysis on pizza sales dataset
-- =========================================


-- =========================================
-- BASIC ANALYSIS
-- =========================================

-- Q1. View the first 10 records

SELECT *
FROM pizza_sales
LIMIT 10;

-- Q2. Total Revenue

SELECT
    SUM(total_price) AS Total_Revenue
FROM pizza_sales;

-- Q3. Total Orders

SELECT
    COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales;

-- Q4. Total Pizzas Sold

SELECT
    SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales;

-- Q5. Average Order Value

SELECT
    ROUND(SUM(total_price) / COUNT(DISTINCT order_id), 2) AS Average_Order_Value
FROM pizza_sales;



-- =========================================
-- FILTERING ANALYSIS (WHERE Clause)
-- =========================================
-- Q6. Show all Large pizzas

SELECT *
FROM pizza_sales
WHERE pizza_size = 'L';

-- Q7. Show only Classic category pizzas

SELECT *
FROM pizza_sales
WHERE pizza_category = 'Classic';

-- Q8. Show Large pizzas with quantity greater than 2

SELECT *
FROM pizza_sales
WHERE pizza_size = 'L'
AND quantity > 2;

-- Q9. Show Large Pizzas with Total Price Greater Than $20

SELECT *
FROM pizza_sales
WHERE pizza_size = 'L'
AND total_price > 20;


-- =========================================
-- SALES ANALYSIS
-- =========================================

-- Q10. Top 5 Best Selling Pizzas

SELECT
    pizza_name,
    SUM(quantity) AS Total_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Sold DESC
LIMIT 5;

-- Q11. Bottom 5 Selling Pizzas

SELECT
    pizza_name,
    SUM(quantity) AS Total_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Sold ASC
LIMIT 5;

-- Q12. Revenue by Pizza Category

SELECT
    pizza_category,
    SUM(total_price) AS Revenue
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Revenue DESC;

-- Q13. Revenue by Pizza Size

SELECT
    pizza_size,
    SUM(total_price) AS Revenue
FROM pizza_sales
GROUP BY pizza_size
ORDER BY Revenue DESC;

-- Q14. Quantity Sold by Category

SELECT
    pizza_category,
    SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity DESC;


-- =========================================
-- TIME ANALYSIS
-- =========================================

-- Q15. Daily Sales Trend

SELECT
    order_date,
    SUM(total_price) AS Daily_Revenue
FROM pizza_sales
GROUP BY order_date
ORDER BY order_date;

-- Q16. Monthly Sales Trend

SELECT
    CASE
        WHEN length(order_date) - length(replace(order_date,'/','')) = 2
        THEN substr(order_date, 1, instr(order_date,'/')-1)
        END AS month,
    SUM(total_price) AS revenue
FROM pizza_sales
WHERE order_date IS NOT NULL
GROUP BY month
HAVING month IS NOT NULL
ORDER BY CAST(month AS INTEGER);

-- Q17. Peak Ordering Hour

SELECT
    strftime('%H', order_time) AS Hour,
    COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza_sales
GROUP BY Hour
ORDER BY Total_Orders DESC;

-- =========================================
-- ADVANCED ANALYSIS
-- =========================================

-- Q18. Highest Revenue Pizza

SELECT
    pizza_name,
    SUM(total_price) AS Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Revenue DESC
LIMIT 1;

-- Q19. Pizzas with Above Average Revenue

SELECT
    pizza_name,
    SUM(total_price) AS Revenue
FROM pizza_sales
GROUP BY pizza_name
HAVING SUM(total_price) >
(
    SELECT AVG(total_revenue)
    FROM
    (
        SELECT
            SUM(total_price) AS total_revenue
        FROM pizza_sales
        GROUP BY pizza_name
    )
)
ORDER BY Revenue DESC
LIMIT 5;

-- Q20. Categories with Above Average Quantity Sold

SELECT
    pizza_category,
    SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_category
HAVING SUM(quantity) >
(
    SELECT AVG(total_quantity)
    FROM
    (
        SELECT
            SUM(quantity) AS total_quantity
        FROM pizza_sales
        GROUP BY pizza_category
    )
);

-- Q21. Average Pizzas Sold Per Order

SELECT
    ROUND(
        SUM(quantity) * 1.0 / COUNT(DISTINCT order_id),
        2
    ) AS Average_Pizzas_Per_Order
FROM pizza_sales;



