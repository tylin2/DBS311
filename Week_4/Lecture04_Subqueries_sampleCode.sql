----------------------------------------------------------------------------------------------------------
--Course: DBS311
--Section: BC
-- Fall 2020
-- Sample SQL SELECT statements (Sub-queries)
------------------------------------------------------------------
-- display customers with credit limit more than 2000
select customer_id, name, credit_limit
from customers
where credit_limit > 2000
order by credit_limit;

-- find customers that their credit limit is more than or equal to the credit 
-- limit of customer 178
-- first find the credit limit of customer with ID 178
select credit_limit -- 5000
from customers
where customer_id = 178;

-- then you select all customers that their credit limit is 5000
select customer_id, name, credit_limit
from customers
where credit_limit >= 5000
order by credit_limit;

-- You can answer the above question by one statement with a subquery
select customer_id, name, credit_limit
from customers
where credit_limit >= (select credit_limit -- 5000
                        from customers
                        where customer_id = 178)
order by credit_limit;

-- comparison operators you can use to compare the value returned by a subquery to a columns' value 
-- if the subquery returns only one value
-- < > <= >= <> = 
-- like
-- operand1 <> operand2
-- The following statement returns an error, bacause the subquery returns multiple values and the >= operator
-- is not allowed to be used here. It can be used with ANY or ALL
select customer_id, name, credit_limit
from customers
where credit_limit >= any (select credit_limit -- 5000
                        from customers)
order by credit_limit;

-- Using IN operator to compare a column's value with multiple values returned by the subquery
select customer_id, name, credit_limit
from customers
where credit_limit in (select credit_limit -- 5000
                        from customers
                        where customer_id between 178 and 190)
order by credit_limit;

-- The following query shows the values retuned by the previous query's subquery
select distinct credit_limit -- 5000
                        from customers
                        where customer_id between 175 and 190;

-- IN can be used with single values as well
SELECT customer_id, name, credit_limit
FROM customers
WHERE credit_limit in (select credit_limit -- 5000
                        from customers
                        where customer_id = 178)
order by credit_limit;

-- find all employees whose manager ID is the same as the manager ID of employee 9
select *
from employees
where manager_id = (select manager_id
                    from employees
                    where employee_id = 9)
and employee_id <> 9;

-- find all employees whose manager ID is not the same as the manager ID of employee 9
select *
from employees
where manager_id <> (select manager_id
                    from employees
                    where employee_id = 9);

-- find customers that their credit limit is more than the credit limit of customer 244, 239, 35
select credit_limit
from customers
where customer_id in (244, 239, 35);

select customer_id, credit_limit
from customers
where credit_limit > any (select credit_limit
                        from customers
                        where customer_id in (244, 239, 35));
                        
-- find customers that their credit limit is equal to the credit limit of any of customer 244, 239, 35
-- IN or (= ANY)
select customer_id, credit_limit
from customers
where credit_limit = any (select credit_limit
                        from customers
                        where customer_id in (244, 239, 35));


-- find customers that their credit_limit is more than the avergae credit limit

select customer_id, credit_limit
from customers
where credit_limit > (select avg(credit_limit)
                        from customers)
order by credit_limit, customer_id;


select avg(credit_limit)
from customers;

-- find warehouses with the most expensive prducts

select max(list_price)
from products;

select i.warehouse_id, p.product_id, p.list_price
from inventories i
inner join products p
on i.product_id = p.product_id
where p.list_price = (select max(list_price)
                        from products)
order by warehouse_id , product_id;

-- find warehouses with the most expensive prducts and also warehouses that have the cheapest product

select max(list_price)
from products;

select i.warehouse_id, p.product_id, p.list_price
from inventories i
inner join products p
on i.product_id = p.product_id
where p.list_price = (select max(list_price)
                        from products)
    or
    p.list_price = (select min(list_price)
                        from products)
order by warehouse_id , product_id;

-- find warehouses that have both most expensive and cheapest product
-- ???????????????????????????????????????????

-- for all warehouses that are in the same country ID as warehouse number 3, display warehouse_id, 
-- warehouse_name, and country_name

select w.warehouse_id , w.warehouse_name, c.country_name
from warehouses w
inner join locations l
on w.location_id  = l.location_id
inner join countries c
on l.country_id  = c.country_id
where l.country_id = (select l.country_id
                        from warehouses w
                        inner join locations l
                        on w.location_id  = l.location_id
                        where w.warehouse_id = 3)
order by warehouse_id;


select l.country_id
from warehouses w
inner join locations l
on w.location_id  = l.location_id
where w.warehouse_id = 3;

-- find warehouses that the average of number of products is more than any average number of products in each 
-- warehouse, diaply the warehouse ID

select warehouse_id, sum(quantity)
from inventories
group by warehouse_id
having avg(quantity) > any (select avg(quantity)
                            from inventories
                            group by warehouse_id)
order by warehouse_id;

select avg(quantity)
from inventories
group by warehouse_id;

-- Explain in simple English what each of the following SQL statements return
select list_price, count(*)
from products
group by list_price;

select product_id, product_name, list_price
from products
where list_price = (select list_price
                    from products
                    where product_id = 77)
    and 
        product_id <> 77;

-- the list price is euqal any oth the list price of products that have been ordered in order number 5
select product_id, product_name, list_price
from products
where list_price = any (select list_price
                    from products
                    where product_id = any (select product_id
                                        from order_items
                                        where order_id = 5));
select list_price
from products
where product_id = any (select product_id
                    from order_items
                    where order_id = 5);

select product_id
from order_items
where order_id = 5;

--------------------------------------------
select customer_id, order_id
from (select customer_id, order_id, order_date, status
        from orders)
where customer_id = 44
order by order_id;

-- find all orders for customer 44, customer name
select c.customer_id, c.name, o.order_id
from orders o
inner join customers c
on c.customer_id =o.customer_id
where c.customer_id = 44;

select c.customer_id, c.name, ordrs.order_id
from customers c
inner join
            (select *
            from orders
            where customer_id = 44) ordrs
on c.customer_id  = ordrs.customer_id;

-- Display the maximum price (list price) of the category(s) that has the lowest price product.


--  subquery1: find the lowest list price --> be a single value
--  subquery2: uses subquery1 to find the category ID with the lowest price
 
--  select *
--  from table1
--  where col1 = any (subquery2 (subquery1));
 


-- show the products that the list price is euqal any list price of products that have been ordered 
-- in order number 5
select product_name, product_id, list_price
from products
where list_price = any (
                        select list_price
                        from products
                        where product_id in (select product_id
                                            from order_items
                                            where order_id = 5));
select product_name, product_id, list_price
from products
where list_price = any (
                        select p.list_price
                        from products p
                        inner join order_items oi
                        on oi.product_id = p.product_id
                        where oi.order_id = 5);
                        
-----------------------------------------

select *
from order_items;

select w.warehouse_id, w.warehouse_name, sum(i.quantity) as total
from inventories i
inner join warehouses w
on w.warehouse_id = i.warehouse_id
group by w.warehouse_id, w.warehouse_name
having sum(i.quantity) =  (select max(sum(quantity)) -- 28613
                                from inventories
                                group by warehouse_id);

select max(sum(quantity)) -- 28613
from inventories
group by warehouse_id;

select sum(quantity)
from inventories
group by warehouse_id;

select *
from
    (select w.warehouse_id, w.warehouse_name, sum(i.quantity) as total
    from inventories i
    inner join warehouses w
    on w.warehouse_id = i.warehouse_id
    group by w.warehouse_id, w.warehouse_name)
where total = (select max(sum(quantity)) -- 28613
                from inventories
                group by warehouse_id);


select p.list_price
from products p
inner join order_items oi
on oi.product_id = p.product_id
where oi.order_id = 5
order by p.list_price;

select list_price
from products
where product_id in (select product_id
                     from order_items
                     where order_id = 5)
order by list_price;

select *
from order_items
where order_id = 5;

select c.customer_id, c.name, ordrs.order_id
from customers c
inner join
            (select *
            from orders
            where customer_id = 44) ordrs
on c.customer_id  = ordrs.customer_id;


select *
from orders
where customer_id = 44;

-- all any
-- find customers that their number of orders is graeter than the number of orders of all customer 44 to 50

select count(order_id)
from orders
where customer_id in (4,18)
group by customer_id;

select customer_id, count(order_id)
from orders
group by customer_id
having count(order_id) > any (select count(order_id)
                                from orders
                                where customer_id in (4,18)
                                group by customer_id);






