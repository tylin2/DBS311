-- *********************** 
-- Student1 Name: Ting-Yeh Lin Student1 ID: 141726182
-- Student2 Name: Your Name Student2 ID: ######### 
-- Student3 Name: Your Name Student3 ID: ######### 
-- Date: 2020/11/01 
-- Purpose: Assignment 1 - DBS311 
-- ***********************

-- Question 1 ¡VDisplay the employee info. hired in September.  
-- Q1 SOLUTION -- 
SELECT
   employee_id,
   last_name || ', ' || first_name AS "FULL name",
   job_title,
   to_char(hire_date, '"["Month ddth "of" yyyy"]"') AS "START DAY" 
FROM
   employees 
WHERE
   hire_date >= to_date('01-SEP-16') 
   AND hire_date < to_date('1-OCT-16') 
ORDER BY
   hire_date DESC,
   employee_id;

-- Question 2 ¡VDisplay the total sale amount per sales person (salesman) for all orders  
-- Q2 SOLUTION -- 
--to_number(nvl(o.salesman_id, 0))
SELECT
   nvl(o.salesman_id, 0) AS "Employee Number",
   to_char(SUM(oi.quantity * unit_price), '$999,999,999.00') AS amount 
FROM
   order_items oi 
   INNER JOIN
      orders o 
      ON oi.order_id = o.order_id 
GROUP BY
   o.salesman_id 
ORDER BY
   o.salesman_id; 

-- Question 3 ¡VCount orders by customer ID is in values from 35 to 45 
-- Q3 SOLUTION -- 
SELECT
   c.customer_id,
   c.name,
   COUNT(o.order_id) AS "total orders" 
FROM
   orders o 
   RIGHT JOIN
      customers c 
      ON o.customer_id = c.customer_id 
WHERE
   c.customer_id BETWEEN 35 AND 45 
GROUP BY
   c.customer_id,
   c.name 
ORDER BY
   "total orders";

-- Question 4 ¡VDisplay orders with customer ID 44  
-- Q4 SOLUTION -- 
SELECT
   o.customer_id,
   c.name,
   oi.order_id,
   o.order_date,
   SUM(oi.quantity) AS "total items",
   to_char(SUM(oi.quantity * oi.unit_price), '$999,999,999.00') AS "total amount" 
FROM
   order_items oi 
   RIGHT JOIN
      orders o 
      ON oi.order_id = o.order_id 
   INNER JOIN
      customers c 
      ON c.customer_id = o.customer_id 
GROUP BY
   oi.order_id,
   o.customer_id,
   o.order_date,
   c.name 
HAVING
   o.customer_id = 44 
ORDER BY
   "total amount" DESC;

-- Question 5 ¡VDisplay customers who have more than 30 orders  
-- Q5 SOLUTION -- 
SELECT
   o.customer_id,
   c.name,
   COUNT(o.customer_id) AS "total number OF orders",
   SUM(oi.quantity) AS "total items",
   to_char(SUM(oi.quantity*oi.unit_price), '$999,999,999.00') AS "total amount" 
FROM
   order_items oi 
   INNER JOIN
      orders o 
      ON oi.order_id = o.order_id 
   INNER JOIN
      customers c 
      ON o.customer_id = c.customer_id 
GROUP BY
   o.customer_id,
   c.name 
HAVING
   COUNT(o.customer_id) > 30 
ORDER BY
   "total number OF orders",
   "total items" DESC;

-- Question 6 ¡VDisplay the lowest product standard cost which is more than $500 or less then $200 for Warehouse and category  
-- Q6 SOLUTION --
SELECT
   i.warehouse_id,
   w.warehouse_name,
   p.category_id,
   pc.category_name,
   to_char(MIN(p.standard_cost), '$99,999.00') AS "lowest cost" 
FROM
   inventories i, 
   products p,
   product_categories pc,
   warehouses w
WHERE i.product_id = p.product_id 
AND p.category_id = pc.category_id 
AND i.warehouse_id = w.warehouse_id 
GROUP BY
   i.warehouse_id,
   w.warehouse_name,
   p.category_id,
   pc.category_name 
HAVING
   MIN(p.standard_cost) > 500.00 
   OR MIN(p.standard_cost) < 200 
ORDER BY
   i.warehouse_id,
   w.warehouse_name,
   p.category_id,
   pc.category_name;

-- Question 7 ¡V Display the total number of orders per month.
-- Q7 SOLUTION --
SELECT
   to_char(order_date, 'Month') AS MONTH,
   COUNT(order_date) 
FROM
   orders 
GROUP BY
   to_char(order_date, 'Month') 
ORDER BY
   to_date(to_char(order_date, 'Month'), 'Month');

-- Question 8 ¡V 206 isn't in the inventories Table, how can I get warehouse?
-- Q8 SOLUTION --
SELECT
   p.product_id,
   p.product_name,
   to_char(MAX(p.list_price), '$99,999.00') AS price 
FROM
   products p 
   INNER JOIN
      inventories i 
      ON p.product_id = i.product_id 
   LEFT JOIN
      warehouses w 
      ON i.warehouse_id = w.warehouse_id 
   LEFT JOIN
      locations l 
      ON l.location_id = w.location_id 
   LEFT JOIN
      countries c 
      ON c.country_id = l.country_id 
   LEFT JOIN
      regions r 
      ON r.region_id = c.region_id 
   LEFT JOIN
      (
         SELECT
            w.warehouse_id,
            MAX(p.standard_cost) AS maximum 
         FROM
            products p,
            inventories i,
            warehouses w,
            locations l 
         WHERE
            p.product_id = i.product_id 
            AND i.warehouse_id = w.warehouse_id 
            AND l.location_id = w.location_id 
         GROUP BY
            w.warehouse_id
      )
      m 
      ON m.warehouse_id = i.warehouse_id 
WHERE
   r.region_id <> 2 
   AND p.list_price > m.maximum 
GROUP BY
   p.product_id,
   p.product_name,
   p.list_price 
ORDER BY
   p.product_id;

-- Question 9 ¡V display the most expensive and the cheapest product
-- Q9 SOLUTION --
SELECT
   product_id,
   product_name,
   to_char(list_price, '$99,999.00') AS price 
FROM
   products 
WHERE
   list_price = 
   (
      SELECT
         MAX(list_price) 
      FROM
         products
   )
UNION
SELECT
   product_id,
   product_name,
   to_char(list_price, '$99,999.00') AS price 
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
;

-- Question 10 ¡V display the number of customers with total order amount over the average amount of all orders,
--                  the number of customers with total order amount under the average amount of all orders, 
--                  number of customers with no orders, and the total number of customers
-- Q10 SOLUTION --
SELECT
   'Number of customers with total purchase amount over average: ' || COUNT(customer_id) AS "customer report" 
FROM
   (
      SELECT
         o.customer_id,
         SUM(st.subtotal) AS total 
      FROM
         orders o 
         INNER JOIN
            (
               SELECT
                  order_id,
                  SUM(quantity*unit_price) AS subtotal 
               FROM
                  order_items 
               GROUP BY
                  order_id
            )
            st 
            ON st.order_id = o.order_id 
      GROUP BY
         o.customer_id 
      HAVING
         SUM(st.subtotal) > (
         SELECT
            AVG(oi.quantity*oi.unit_price) 
         FROM
            order_items oi)
   )
UNION ALL
SELECT
   'Number of customers with total purchase amount below average: ' || COUNT(customer_id) 
FROM
   (
      SELECT
         o.customer_id,
         SUM(st.subtotal) AS total 
      FROM
         orders o 
         INNER JOIN
            (
               SELECT
                  order_id,
                  SUM(quantity*unit_price) AS subtotal 
               FROM
                  order_items 
               GROUP BY
                  order_id
            )
            st 
            ON st.order_id = o.order_id 
      GROUP BY
         o.customer_id 
      HAVING
         SUM(st.subtotal) < (
         SELECT
            AVG(oi.quantity*oi.unit_price) 
         FROM
            order_items oi)
   )
UNION ALL
SELECT
   'Number of customers with no orders: ' || COUNT(customer_id) 
FROM
   (
      SELECT
         c.customer_id,
         o.order_id 
      FROM
         customers c 
         LEFT JOIN
            orders o 
            ON c.customer_id = o.customer_id 
      WHERE
         o.order_id IS NULL
   )
UNION ALL
SELECT
   'Number of customers: ' || COUNT(customer_id) 
FROM
   customers;



   