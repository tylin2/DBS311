----------------------------------------------------------------------------------------------------------
--Course: DBS311
--Section: BC
-- Fall 2020
-- Sample SQL SELECT statements (SQL Review)
----------------------------------------------------------------------------------------------------------
-- Display category Id, category name for all categories and sort the result according to category name.
select category_id as "Category Id" , category_name as "Category Name"
from product_categories
order by category_name;

-- Display all ware houses and sort them based on warehouse Id.
SELECT *
FROM warehouses
ORDER BY warehouse_name;

-- Display product Id, name, old and new prices. Sort the result according to first the category_id and then 
-- the product name descendingly.
select product_id, product_name, list_price as "Old Price", list_price * 1.02 as "New Price"
from products
order by category_id, product_name desc;

-- Find all products that their price falls into the range 2000 and 3000. (2000 and 3000 are included.) 
select *
from products
where list_price >=  2000 and list_price <= 3000 ;

-- 2000 > *** < 3000 --> and
-- *** < 200 -- 3000 > *** -- or
-- Find all products that their price is less than 200. Also include products to your result 
-- that their price is over 3000. (200 and 3000 are not included.)
select *
from products
where list_price <  200 or list_price > 3000 
order by list_price;

-- Find all products in category 1 that their price is less than 200. Also include products to your result from category 1
-- that their price is over 3000. (200 and 3000 are not included.)
-- *** < 200 -- 3000 > *** -- or to be in category 1
select *
from products
where (list_price <  200 or list_price > 3000) and category_id = 1
order by list_price;

-- IN (1,2,3)
-- between 2000 and 3000
-- NOT IN
-- NOT BETWEEN 200 and 3000
-- product LIKE 'CPU' same as product_name = 'CPU' you look for axact matches
-- product_name like 'CPU%' 
-- Display all products that their name contains 'er'.
select *
from products
where  product_name not like '%er%';

-- IS NULL / IS NOT NULL
-- Display the location info for all locations that do not have states.
select *
from locations
where state is null;

-- Display the location info for all locations that do have states.
select *
from locations
where state is not null;

-- characte string values 
-- grade in ('A', 'B', 'C', 'D')

-- name like 'Nick'

-- Select all cities that do have states.
select concat(concat(city,' '), state) as "City State"
from locations
where state is not null;


-- What categories do we have in table products?
-- Use distinct to remove duplicate values
select distinct category_id
from products
order by category_id;

-- see product name and product category name
-- products (child) <--> product_categories (parent)
-- Display product name, category name and the warehouse Id of all products.
-- When joining tables, you need to have the table qualifier before the name of your columns. The origin of each column
-- has to be determined. See the table name before the name of each column.
select products.product_name, product_categories.category_name, inventories.warehouse_id
from products
inner join product_categories
on products.category_id = product_categories.category_id
inner join inventories
on products.product_id = inventories.product_id
;
-- Intead of having the full name of tables before their columns' name, you can use the table alias which is a short temporay name
-- for tables. See the following example.
-- Display product name, category name and the warehouse Id of all products.
select p.product_name, pc.category_name, i.warehouse_id
from products p
inner join product_categories pc
on p.category_id = pc.category_id
inner join inventories i
on p.product_id = i.product_id
;

-- table1 left join table2 -- see all rows from table 1 but just see the matching rows from table2
-- All customer and their orders if the order exist
-- customers (parent) <--> orders (child)
-- We want to see all customers and their orders if there is any order for the customer. We want to include all customers 
-- in the result and show their orders if the customer has any.

select customers.name, orders.order_id, orders.order_date
from customers
left join orders
on customers.customer_id = orders.customer_id
order by customers.customer_id, orders.order_id;

-- table1 right join table2 
-- see all rows from table 2 but just see the matching rows from table1

-- display customer name, order Id, and order date. Include all customers in your result. It means the customer data will 
-- be returned even if the customer does not have any orther. It generates the same result as the previous query. 
select customers.name, orders.order_id, orders.order_date
from orders
right join customers
on customers.customer_id = orders.customer_id
order by customers.customer_id, orders.order_id;

-- see the manager info for employee 107

select emp.employee_id, emp.last_name, emp.manager_id, mng.first_name, mng.last_name
from employees emp
inner join employees mng
on emp.manager_id = mng.employee_id
where emp.employee_id = 107;

-- full outer join: see all matching rows from both tables and non matching rows from both

SELECT w.warehouse_id, 
w.warehouse_name, 
l.location_id
FROM warehouses w
FULL OUTER JOIN locations l
ON w.location_id = l.location_id
order by w.warehouse_id;


-- Find employees whose first name is 'summer'. Remeber that 'summer' is different from 'Summer'.
SELECT employee_id, first_name, last_name
FROM employees
WHERE lower(first_name) = 'summer';

-- Display employees whose first name starts with letter 'S'.
SELECT employee_id, first_name, last_name
FROM employees
WHERE first_name LIKE 'S%';

-- Find employees who the second letter of their first name is letter e.

SELECT employee_id, first_name, last_name
FROM employees
WHERE first_name LIKE '_e%';

-- BETWEEN / NOT BETWEEN
-- Display products with the list price which is in the range $10 and $50.
select *
from products
where list_price between 10 and 50
order by list_price;


-- Find all products that their list price is out of the range of $200 and $7000. 
-- Sort the result based on the list price descendingly.
select *
from products
where list_price Not between 20 and 7000
order by list_price desc;


-- Display the category id, list price for all prodcuts. Sort the result accordig to cateory id ascendingly 
-- and then by list price descendingly.
select category_id, list_price
from products
order by category_id, list_price desc;



-- Display product id, product name, list price, and the new price (increase the price by 5%).
select product_id as product, product_name as "Product Name", list_price as "Old Price", list_price * 1.05 as "New Price"
from products
order by "New Price" desc;

select product_id as product, product_name as "Product Name", list_price as old_price, list_price * 1.05 as new_price
from products
order by new_price desc;

-- IN/NOT
-- Display all products that are in categories 1, 4, and 5.
select *
from product 
where category_id in (1,4,5); -- category_id = 1 or category_id = 4 or category_id = 5

-- Display all products that are not in categories 1, 4, and 5.
select *
from product 
where category_id not in (1,4,5); -- category_id <> 1 and category_id <> 4 and category_id <> 5

-- is null / is not null
-- Display all warehouses that their location is not defined. (We do not know their location.)
select *
from warehouses 
where location_id is null;

-- Display warehouses that their location is defined. (Their location is known.)
select *
from warehouses
where location_id is not null;

-- distinct
select distinct category_id
from products;

-- concat
-- Display employees' first name and last name.
select first_name || ' ' || last_name as "Employee Name"
from employees;


select concat(concat(first_name, ' '), last_name)
from employees;

select 'First Name:' || first_name || ', Last Name:' || last_name as "Employee Name"
from employees;


-- JOINS

-- see customer id and name and also the contact first name and last name for all customers

select customers.customer_id, customers.name as "Customer Name", contacts.first_name as "Contact First Name", contacts.last_name 
from customers
inner join contacts
on customers.customer_id = contacts.customer_id
order by customer_id;

-- left join
-- table1 left join table2
-- see everything from table1 and just matching rows from table2
-- see the eatehouse id and name and its address
select warehouses.warehouse_id, warehouses.warehouse_name, locations.address
from warehouses
inner join locations
on warehouses.location_id = locations.location_id
order by warehouses.warehouse_id;

select warehouses.warehouse_id, warehouses.warehouse_name, locations.address
from warehouses
left join locations
on warehouses.location_id = locations.location_id
order by warehouses.warehouse_id;

-- right join
-- table1 right join table2
-- see everything from the second table and just matching rows from the first table

select warehouses.warehouse_id, warehouses.warehouse_name, locations.address
from warehouses
right join locations
on warehouses.location_id = locations.location_id
order by warehouses.warehouse_id;

-- full outer join
-- table1 outer join table2
-- see all matching rows (they satisfy the join condition) and all the rows from both table which do not satisfy the join condition
select warehouses.warehouse_id, warehouses.warehouse_name, locations.address
from warehouses
full outer join locations
on warehouses.location_id = locations.location_id
order by warehouses.warehouse_id;
