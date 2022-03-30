-- ***********************
-- Name: Ting-Yeh Lin
-- ID: 141726182
-- Date: 2020/09/28
-- Purpose: Lab 02 DBS311
-- ***********************

-- Q1 SOLUTION --
SELECT
   job_title,
   COUNT(*) AS employees 
FROM
   employees 
GROUP BY
   job_title 
ORDER BY
   employees;
   
-- Q2 SOLUTION --
SELECT
   MAX(credit_limit) AS high,
   MIN(credit_limit)AS low,
   round(AVG(credit_limit), 2)AS average,
   MAX(credit_limit) - MIN(credit_limit)AS "High and Low Difference" 
FROM
   customers;
   
-- Q3 SOLUTION --
SELECT
   order_id,
   SUM(quantity)AS total_items,
   SUM(quantity*unit_price)AS total_amount 
FROM
   order_items 
GROUP BY
   order_id 
HAVING
   SUM(quantity*unit_price) > 1000000 
ORDER BY
   total_amount DESC;
   
-- Q4 SOLUTION --
SELECT
   i.warehouse_id,
   w.warehouse_name,
   SUM(i.quantity)AS total_products 
FROM
   inventories i 
   LEFT JOIN
      warehouses w 
      ON i.warehouse_id = w.warehouse_id 
GROUP BY
   i.warehouse_id,
   w.warehouse_name 
ORDER BY
   i.warehouse_id;
   
-- Q5 SOLUTION --
SELECT
   c.customer_id,
   c.name AS "customer name",
   COUNT(o.customer_id) AS "total number OF orders" 
FROM
   orders o 
   RIGHT JOIN
      customers c 
      ON o.customer_id = c.customer_id 
GROUP BY
   c.customer_id,
   c.name 
HAVING
   c.name LIKE 'O%e%' 
   OR c.name LIKE '%t' 
ORDER BY
   "total number OF orders" DESC;
   
-- Q6 SOLUTION --
SELECT
   p.category_id,
   SUM(quantity*unit_price)AS total_amount,
   round(AVG(quantity*unit_price), 2)AS average_amount 
FROM
   order_items o 
   LEFT JOIN
      products p 
      ON o.product_id = p.product_id 
GROUP BY
   p.category_id;