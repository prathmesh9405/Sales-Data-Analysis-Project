CREATE DATABASE sales_analysis;
USE sales_analysis;
CREATE TABLE sales (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    gender VARCHAR(10),
    age INT,
    city VARCHAR(50),
    state VARCHAR(50),
    region VARCHAR(20),
    product_id VARCHAR(20),
    product_name VARCHAR(100),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    unit_price DECIMAL(12,2),
    quantity INT,
    discount_percent DECIMAL(5,2),
    discount_amount DECIMAL(12,2),
    sales DECIMAL(12,2),
    profit DECIMAL(12,2),
    payment_method VARCHAR(50),
    order_status VARCHAR(20)
);
USE sales_analysis;

SELECT * FROM sales
LIMIT 10;

SELECT SUM(sales) AS total_sales
FROM sales;

SELECT SUM(profit) AS total_profit
FROM sales;

SELECT COUNT(DISTINCT order_id) AS total_orders
FROM sales;

SELECT 
    region,
    SUM(sales) AS total_sales
FROM sales
GROUP BY region
ORDER BY total_sales DESC;

SELECT 
    category,
    SUM(sales) AS total_sales
FROM sales
GROUP BY category
ORDER BY total_sales DESC;

SELECT 
    product_name,
    SUM(sales) AS total_sales
FROM sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

SELECT *
FROM sales
WHERE order_status = 'Delivered';

SELECT *
FROM sales
WHERE sales > 50000;

SELECT *
FROM sales
WHERE city = 'Pune';

SELECT *
FROM sales
WHERE category = 'Electronics';

SELECT AVG(sales) AS average_sales
FROM sales;

SELECT MAX(sales) AS maximum_sale
FROM sales;

SELECT MIN(sales) AS minimum_sale
FROM sales;

SELECT SUM(quantity) AS total_quantity
FROM sales;

SELECT 
    category,
    SUM(profit) AS total_profit
FROM sales
GROUP BY category
ORDER BY total_profit DESC;

SELECT 
    state,
    SUM(sales) AS total_sales
FROM sales
GROUP BY state
ORDER BY total_sales DESC;

SELECT 
    payment_method,
    SUM(sales) AS total_sales
FROM sales
GROUP BY payment_method
ORDER BY total_sales DESC;

SELECT 
    order_status,
    COUNT(*) AS total_orders
FROM sales
GROUP BY order_status;

SELECT 
    region,
    SUM(sales) AS total_sales
FROM sales
GROUP BY region
HAVING SUM(sales) > 5000000;

SELECT 
    category,
    SUM(profit) AS total_profit
FROM sales
GROUP BY category
HAVING SUM(profit) > 300000;

SELECT 
    order_id,
    customer_name,
    sales,
    CASE
        WHEN sales >= 30000 THEN 'High Sales'
        WHEN sales >= 10000 THEN 'Medium Sales'
        ELSE 'Low Sales'
    END AS sales_category
FROM sales;

SELECT 
    product_name,
    sales,
    profit,
    CASE
        WHEN profit > 5000 THEN 'High Profit'
        WHEN profit > 2000 THEN 'Medium Profit'
        ELSE 'Low Profit'
    END AS profit_category
FROM sales;

SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(sales) AS total_sales
FROM sales
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;

SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(profit) AS total_profit
FROM sales
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;

SELECT 
    product_name,
    SUM(sales) AS total_sales,
    RANK() OVER (ORDER BY SUM(sales) DESC) AS sales_rank
FROM sales
GROUP BY product_name;

SELECT 
    customer_name,
    SUM(sales) AS total_sales
FROM sales
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

SELECT 
    customer_name,
    COUNT(order_id) AS total_orders
FROM sales
GROUP BY customer_name
ORDER BY total_orders DESC;

SELECT 
    product_name,
    SUM(sales) AS total_sales
FROM sales
GROUP BY product_name
HAVING SUM(sales) > (
    SELECT AVG(product_sales)
    FROM (
        SELECT SUM(sales) AS product_sales
        FROM sales
        GROUP BY product_name
    ) AS product_summary
)
ORDER BY total_sales DESC;

