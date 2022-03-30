-- ***********************
-- Name: Ting-Yeh Lin
-- ID: 141726182
-- Date: The current date
-- Purpose: Lab 03 DBS311
-- ***********************
-- Q1 SOLUTION --
SELECT
   last_name,
   hire_date 
FROM
   employees 
WHERE
   hire_date < (
   SELECT
      hire_date 
   FROM
      employees 
   WHERE
      employee_id IN 107) 
      AND hire_date >= trunc(to_date('22-APR-16'), 'MONTH') 
   ORDER BY
      hire_date,
      employee_id;
-- Q2 SOLUTION --
SELECT
   name,
   credit_limit 
FROM
   customers 
WHERE
   credit_limit IN 
   (
      SELECT
         MIN(credit_limit) 
      FROM
         customers
   )
ORDER BY
   customer_id;
-- Q3 SOLUTION --
SELECT
   category_id,
   product_id,
   product_name,
   list_price 
FROM
   products 
WHERE
   list_price = ANY (
   SELECT
      MAX(list_price) 
   FROM
      products 
   GROUP BY
      category_id) 
   ORDER BY
      category_id,
      product_id;
-- Q4 SOLUTION --
SELECT
   p.category_id,
   c.category_name 
FROM
   products p 
   INNER JOIN
      product_categories c 
      ON p.category_id = c.category_id 
WHERE
   list_price = 
   (
      SELECT
         MAX(list_price) 
      FROM
         products
   )
;
-- Q5 SOLUTION --
SELECT
   product_name,
   list_price 
FROM
   products 
WHERE
   list_price < ANY (
   SELECT
      MIN(list_price) 
   FROM
      products 
   GROUP BY
      category_id) 
      AND category_id IN 1 
   ORDER BY
      list_price DESC,
      product_id;
-- Q6 SOLUTION --
SELECT
   MAX(list_price) 
FROM
   products 
WHERE
   category_id = 
   (
      SELECT
         category_id 
      FROM
         products 
      WHERE
         list_price = 
         (
            SELECT
               MIN(list_price) 
            FROM
               products
         )
   )
;


