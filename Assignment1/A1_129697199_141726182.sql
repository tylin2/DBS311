-- ***********************
-- Student1 Name: Dongwook Hwang, Student1 ID: 129697199
-- Student2 Name: Ting Yeh Lin, Student2 ID: 141726182
-- Date: 11/01/2020
-- Purpose: Assignment 1 - DBS311
-- ***********************


-- Question 1 – to display employees' information who are hired in september
-- Q1 SOLUTION --

SELECT
    employee_id AS "Employee Number",
    last_name || ', ' || first_name AS "Full name",
    job_title AS "Job Title",
    '[' || INITCAP(TO_CHAR(hire_date, 'month ddth')) || ' of ' || TO_CHAR(hire_date, 'YYYY') || ']' AS "Start Date"    
FROM
    employees
WHERE
    LOWER(TO_CHAR(hire_date, 'month')) = 'september'
ORDER BY
    hire_date DESC,
    job_title;


-- Question 2 – to display the total sale amount per sales person for all order
-- Q2 SOLUTION --

SELECT
    NVL(o.salesman_id, 0) AS "Employee Number",
    TO_CHAR(SUM(oi.quantity * oi.unit_price), '$999,999,999.99') AS "Total Sale"
FROM
    orders o
LEFT JOIN
    order_items oi
ON
    o.order_id = oi.order_id
GROUP BY
    o.salesman_id
ORDER BY
    "Employee Number" NULLS FIRST;


-- Question 3 – to display the total number of orders for customers id with the range from 35 to 45
-- Q3 SOLUTION --

SELECT
    c.customer_id AS "Customer Id",
    c.name AS "Name",
    COUNT(order_id) AS "Total Orders"
FROM
    customers c
LEFT JOIN
    orders o
ON
    c.customer_id = o.customer_id
WHERE
    c.customer_id BETWEEN 35 AND 45
GROUP BY
    c.customer_id,
    c.name
ORDER BY
    "Total Orders";


-- Question 4 – to display the order-detail for the customer whose ID is 44
-- Q4 SOLUTION --

SELECT
    c.customer_id AS "Customer Id",
    c.name AS "Name",
    o.order_id AS "Order Id",
    o.order_date AS "Order Date",
    SUM(oi.quantity) "Total Items",
    TO_CHAR(SUM(oi.quantity * oi.unit_price), '$999,999,999.99') AS "Total Amount"
FROM
    customers c
LEFT JOIN
    orders o
ON
    c.customer_id = o.customer_id
LEFT JOIN
    order_items oi
ON
    o.order_id = oi.order_id
WHERE
    c.customer_id = 44
GROUP BY
    c.customer_id,
    c.name, o.order_id,
    o.order_date
ORDER BY
    "Total Amount" DESC;


-- Question 5 – to display the order-detail for the customers who ordered over 30 times
-- Q5 SOLUTION --

SELECT
    c.customer_id AS "Customer Id",
    c.name AS "Name",
    COUNT(o.order_id) AS "Total Number of Orders",
    SUM(oi.quantity) AS "Total Items",
    TO_CHAR(SUM(oi.quantity * oi.unit_price), '$999,999,999.99') AS "Total Amount"
FROM
    customers c
LEFT JOIN
    orders o
ON
    c.customer_id = o.customer_id
LEFT JOIN
    order_items oi
ON
    o.order_id = oi.order_id
GROUP BY
    c.customer_id,
    c.name
HAVING
    COUNT(o.order_id) > 30
ORDER BY
    "Total Number of Orders";


-- Question 6 – to display the lowest cost for the combination of the leading columns
-- Q6 SOLUTION --

SELECT
    w.warehouse_id AS "Warehouse ID",
    w.warehouse_name AS "Warehouse Name",
    pc.category_id AS "Category ID",
    pc.category_name "Category Name",
    TO_CHAR(MIN(p.standard_cost), '$999,999,999.99') AS "Lowest Cost"
FROM
    warehouses w
LEFT JOIN
    inventories i
ON
    w.warehouse_id = i.warehouse_id
LEFT JOIN
    products p
ON
    i.product_id = p.product_id
LEFT JOIN
    product_categories pc
ON
    p.category_id = pc.category_id
GROUP BY
    w.warehouse_id,
    w.warehouse_name,
    pc.category_id,
    pc.category_name
HAVING
    MIN(p.standard_cost) NOT BETWEEN 200 AND 500
ORDER BY
    w.warehouse_id,
    w.warehouse_name,
    pc.category_id,
    pc.category_name;


-- Question 7 – to display the total number of orders per month
-- Q7 SOLUTION --

SELECT
    INITCAP(TO_CHAR(order_date, 'month')) AS "Month",
    COUNT(order_id) AS "Number of Orders"
FROM
    orders
GROUP BY
    INITCAP(TO_CHAR(order_date, 'month')),
    TO_CHAR(order_date, 'mm')
ORDER BY
    TO_CHAR(order_date, 'mm');
  

-- Question 8 - to display the products which has the list price more than any hishest standard cost per warehouse outside Americas
-- Q8 SOLUTION --

SELECT
    product_id AS "Product ID",
    product_name AS "Product Name",
    TO_CHAR(list_price, '$999,999.99') AS "Price"
FROM
    products
WHERE
    list_price > ANY (  SELECT
                            MAX(p.standard_cost)
                        FROM
                            products p 
                        INNER JOIN
                            inventories i
                        ON
                            p.product_id = i.product_id
                        INNER JOIN
                            warehouses w
                        ON
                            i.warehouse_id = w.warehouse_id
                        INNER JOIN
                            locations l
                        ON 
                            w.location_id = l.location_id
                        INNER JOIN
                            countries c
                        ON
                            l.country_id = c.country_id
                        INNER JOIN
                            regions r
                        ON
                            c.region_id = r.region_id
                        WHERE
                            r.region_name != 'Americas'
                        GROUP BY
                            w.warehouse_id)
ORDER BY
    list_price DESC;
                            

-- Question 9 – to display the products of which price is the most expensive and the cheapest
-- Q9 SOLUTION --

SELECT
    product_id AS "Product ID",
    product_name AS "Product Name",
    TO_CHAR(list_price, '$999,999,999.99') AS "Price"
FROM
    products
WHERE
    list_price = (  SELECT
                        MAX(list_price)
                    FROM    
                        products)
UNION
SELECT
    product_id,
    product_name,
    TO_CHAR(list_price, '$999,999,999.99')
FROM
    products
WHERE
    list_price = (  SELECT
                        MIN(list_price)
                    FROM    
                        products);             


-- Question 10 – to display the customers who have a total order amount over or below the average amount of all orders
-- Q10 SOLUTION --
   
SELECT
    'Number of customers with total purchase amount over average: '
    || SUM(COUNT(DISTINCT customer_id)) AS "Customer Report"
FROM
    orders o
INNER JOIN
    order_items oi
ON
    o.order_id = oi.order_id
GROUP BY
    o.customer_id
HAVING
    SUM(oi.quantity * oi.unit_price) > (    SELECT
                                                AVG(quantity * unit_price)
                                            FROM
                                                order_items)
UNION ALL                 
SELECT
    'Number of customers with total purchase amount below average: '
    || SUM(COUNT(DISTINCT customer_id))
FROM
    orders o
INNER JOIN
    order_items oi
ON
    o.order_id = oi.order_id
GROUP BY
    o.customer_id
HAVING
    SUM(oi.quantity * oi.unit_price) < (    SELECT
                                                AVG(quantity * unit_price)
                                            FROM
                                                order_items)
UNION ALL
SELECT
    'Number of customers with no orders: '
    || COUNT(c.customer_id)
FROM
    customers c
LEFT JOIN
    orders o
ON
    c.customer_id = o.customer_id
WHERE
    order_id IS NULL
UNION ALL
SELECT
    'Total number of customers: '
    || COUNT(customer_id)
FROM
    customers;

