-- ***********************
-- Name: Ting-Yeh Lin
-- ID: 141726182
-- Date: 09/21/2020
-- Purpose: Lab 01 DBS311
-- ***********************
-- Q1 SOLUTION --
SELECT
   to_char(sysdate + 1, 'Month ddth "of year" yyyy') 
FROM
   DUAL;
-- Q2 Solution --
SELECT
   product_id,
   product_name,
   list_price,
   round(list_price*1.02) AS "NEW price",
   round(list_price*1.02) - list_price AS "price difference" 
FROM
   products 
WHERE
   category_id IN 
   (
      2,
      3,
      5
   )
ORDER BY
   category_id,
   product_id;
-- Q3 Solution --
SELECT
   last_name || ', ' || first_name || ' is ' || job_title 
FROM
   employees 
WHERE
   manager_id = 2 
ORDER BY
   employee_id;
-- Q4 Solution --
SELECT
   last_name,
   hire_date,
   trunc((sysdate - hire_date) / 365) AS "years worked" 
FROM
   employees 
WHERE
   trunc(hire_date) < to_date('01/10/2016', 'dd/mm/yyyy') 
ORDER BY
   hire_date,
   "years worked" DESC;
-- Q5 Solution --
SELECT
   last_name,
   hire_date,
   to_char(next_day(add_months(hire_date, 12), 'TUESDAY'), 'DAY, Month "the" ddspth "of year" yyyy') AS "Review Day" 
FROM
   employees 
WHERE
   trunc(hire_date) > to_date('01/01/2016', 'dd/mm/yyyy') 
ORDER BY
   hire_date;
-- Q6 Solution --
SELECT
   w.warehouse_id,
   w.warehouse_name,
   l.city,
   nvl(l.state,'unknow')   
FROM
   warehouses w 
   LEFT JOIN
      locations l 
      ON w.location_id = l.location_id 
ORDER BY
   w.warehouse_id;

