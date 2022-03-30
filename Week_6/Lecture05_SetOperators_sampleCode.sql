----------------------------------------------------------------------------------------------------------
--Course: DBS311
--Section: BC
-- Fall 2020
-- Sample SQL SELECT statements (Set Operators)
------------------------------------------------------------------
-- Set Operators
-- S1 = {1,3,5,0,2} -- 5
-- S2 = {2,6,3,8} -- 4

-- union: S1 U S2 = {1,3,5,0,2,6,8} -- 7
-- intersect: S1 n S2 = {2,3} -- 2
-- minus: S1 - S2 = {1,5,0}

-- union all: S1 Uall S2 = {1,3,5,0,2,2,6,3,8}

-- A = {a,e,r,c,g}
-- B = {a,e,r,c,g}
-- A U B = {a,e,r,c,g}
-- A n B = {a,e,r,c,g}
-- A - B = {}
--------------------------------------------------------------------------------------------------
-- UNION ALL (does not remove duplicates)
select *
from warehouses

union all

select *
from warehouses;

--------------------------------------------------------------------------------------------------
-- UNION (remove duplicates and sorts data)
select *
from warehouses

union

select *
from warehouses;

--------------------------------------------------------------------------------------------------
-- INTERSECT 
select *
from warehouses
intersect
select *
from warehouses;

--------------------------------------------------------------------------------------------------
-- MINUS 
(select *
from warehouses)
minus
(select *
from warehouses);

--------------------------------------------------------------------------------------------------
(select location_id, warehouse_id
from warehouses)
union all
(select location_id, warehouse_id
from warehouses);
--------------------------------------------------------------------------------------------------
(select warehouse_id, warehouse_name
from warehouses)
union all
(select warehouse_id, warehouse_name
from warehouses);
--------------------------------------------------------------------------------------------------
(select warehouse_id, warehouse_name
from warehouses)
union all
(select warehouse_id, location_id
from warehouses);
--------------------------------------------------------------------------------------------------
-- list of employees whose manager ID is 2 or 102, or 4.
select *
from employees
where manager_id in (2, 102, 4)
order by manager_id; -- manager_id = 2 or manager_id = 102 or manager_id = 4

--------------------------------------------------------------------------------------------------
-- show the result to display first employees with manager 2, and then employees with amanger 102 and employees
-- with manager 4
select employee_id, first_name, manager_id 
from employees
where manager_id = 2
union all
select employee_id, first_name, manager_id
from employees
where manager_id = 102
union all
select employee_id, first_name, manager_id
from employees
where manager_id = 4;

--------------------------------------------------------------------------------------------------
select employee_id, first_name, manager_id 
from employees
where manager_id = 2
intersect
select employee_id, first_name, manager_id
from employees
where manager_id = 102;
--------------------------------------------------------------------------------------------------
select employee_id, first_name, manager_id 
from employees
where manager_id = 2
minus
select employee_id, first_name, manager_id
from employees
where manager_id = 102;

--------------------------------------------------------------------------------------------------
--- find all products, first show the products that have been ordered and then show the products that have not been
--- ordered, show product ID and product name, and order ID (USE SET operators)

select distinct p.product_id, p.product_name, oi.order_id
from products p
inner join order_items oi
on p.product_id = oi.product_id

union all

select distinct p.product_id, p.product_name, nvl(oi.order_id, 0)
from products p
left join order_items oi
on p.product_id = oi.product_id
where oi.order_id is null;

--------------------------------------------------------------------------------------------------
--- find all products, first show the products that have been ordered and then show the products that have not been
--- ordered, show product ID and product name, order ID, and order date (USE SET operators)

select distinct p.product_id, p.product_name, oi.order_id, o.order_date
from products p
inner join order_items oi
on p.product_id = oi.product_id
inner join orders o
on o.order_id = oi.order_id

union all
-- we need to just fake the column order date because this column does not exist in the following query
select distinct p.product_id, p.product_name, nvl(oi.order_id, 0), to_date(null)
from products p
left join order_items oi
on p.product_id = oi.product_id
where oi.order_id is null;

--------------------------------------------------------------------------------------------------
-- show products that have not been ordered by any customers (show product ID and product name)
-- See the following sloutions:
-- one uses JOIN and SET operators and the other use JOIN
select product_id, product_name
from products
minus
select distinct p.product_id, p.product_name
from products p
inner join order_items oi
on p.product_id = oi.product_id;
-- or
select distinct p.product_id, p.product_name, nvl(oi.order_id, 0)
from products p
left join order_items oi
on p.product_id = oi.product_id
where oi.order_id is null;

--------------------------------------------------------------------------------------------------



