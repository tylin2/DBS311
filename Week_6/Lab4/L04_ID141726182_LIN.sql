-- ***********************
-- Name: Ting-Yeh Lin
-- ID: 141726182
-- Date: 2020/10/19
-- Purpose: Lab 04 DBS311
-- ***********************

-- Q1 SOLUTION --
SELECT
   l.city 
FROM
   warehouses w 
   RIGHT JOIN
      locations l 
      ON l.location_id = w.location_id minus 
      SELECT
         l.city 
      FROM
         locations l,
         warehouses w 
      WHERE
         l.location_id = w.location_id 
      ORDER BY
         city;
         
-- Q2 SOLUTION --
SELECT
   p.category_id,
   pc.category_name,
   COUNT(*)AS"COUNT(*)" 
FROM
   products p,
   product_categories pc 
WHERE
   p.category_id = pc.category_id 
GROUP BY
   p.category_id,
   pc.category_name 
HAVING
   p.category_id IN 
   (
      1,
      2,
      5
   )
UNION
SELECT
   category_id,
   category_name,
   0 
FROM
   product_categories 
WHERE
   0 <> 0 
ORDER BY
   "COUNT(*)" DESC;
   
-- Q3 SOLUTION --
SELECT
   product_id 
FROM
   inventories 
WHERE
   quantity < 5 
INTERSECT
SELECT
   product_id 
FROM
   products;
   
-- Q4 SOLUTION --
SELECT
   w.warehouse_name,
   l.state 
FROM
   warehouses w 
   RIGHT JOIN
      locations l 
      ON l.location_id = w.location_id 
   UNION
   SELECT
      w.warehouse_name,
      l.state 
   FROM
      locations l,
      warehouses w 
   WHERE
      l.location_id = w.location_id;









