CREATE DATABASE amazon_sales;
USE amazon_sales;
SELECT DATABASE();
SELECT COUNT(*) FROM sales;
SELECT ROUND(SUM(sales_amount),2) AS total_revenue
FROM sales;
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM sales;
SELECT SUM(quantity) AS total_quantity
FROM sales;
SELECT 
ROUND(SUM(sales_amount) / COUNT(DISTINCT order_id),2) 
AS avg_order_value
FROM sales;
SELECT 
    month,
    ROUND(SUM(sales_amount),2) AS monthly_revenue
FROM sales
GROUP BY month
ORDER BY month;
SELECT 
    ship_state,
    ROUND(SUM(sales_amount),2) AS total_sales
FROM sales
GROUP BY ship_state
ORDER BY total_sales DESC
LIMIT 5;
SELECT 
    category,
    ROUND(SUM(sales_amount),2) AS total_sales
FROM sales
GROUP BY category
ORDER BY total_sales DESC;
SELECT 
    b2b,
    ROUND(SUM(sales_amount),2) AS total_sales
FROM sales
GROUP BY b2b;
SELECT 
    month,
    SUM(sales_amount) AS monthly_revenue,
    ROUND(
        (SUM(sales_amount) -
         LAG(SUM(sales_amount)) OVER (ORDER BY month))
        /
         LAG(SUM(sales_amount)) OVER (ORDER BY month)
        * 100, 2
    ) AS growth_percentage
FROM sales
GROUP BY month;
