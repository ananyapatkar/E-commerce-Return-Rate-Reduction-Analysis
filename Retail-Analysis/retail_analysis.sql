CREATE DATABASE retail_analysis;
USE retail_analysis;
CREATE TABLE superstore (
    row_id INT,
    order_id VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales FLOAT,
    quantity INT,
    profit FLOAT,
    returns VARCHAR(10),
    payment_mode VARCHAR(50)
);

SELECT *
FROM superstore
WHERE sales IS NULL 
   OR profit IS NULL 
   OR quantity IS NULL;
   
SELECT 
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    (SUM(profit) / SUM(sales)) * 100 AS profit_margin
FROM superstore
GROUP BY category;

SELECT 
    sub_category,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY sub_category
ORDER BY total_profit ASC;

SELECT 
    product_name,
    SUM(profit) AS total_loss
FROM superstore
GROUP BY product_name
HAVING total_loss < 0
ORDER BY total_loss ASC
LIMIT 10;

SELECT 
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY category;

SELECT 
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY region;

SELECT 
    MONTH(order_date) AS month,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY month
ORDER BY month;

SELECT 
    MONTH(order_date) AS month,
    category,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY month, category
ORDER BY month;

SELECT 
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY product_name
HAVING total_sales < 500 AND total_profit < 0;

SELECT 
    segment,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY segment;

SELECT 
    payment_mode,
    COUNT(*) AS total_orders,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY payment_mode;

SHOW VARIABLES LIKE 'secure_file_priv';

SELECT * 
FROM superstore
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/output.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';