----------------------------------------------------------------------------------------------------------
--Course: DBS311
--Section: BC
-- Fall 2020
-- Sample SQL SELECT statements (Multi-row Functions)
------------------------------------------------------------------

-- How many employees  --> 107
select *
from employees;

-- count()
select count(*)
from employees;

-- smallest value for unit_price of ordered products
select min(unit_price)
from order_items;

select unit_price
from order_items
order by unit_price;

-- highest value of a column
select max(unit_price)
from order_items;

select unit_price
from order_items
order by unit_price desc;

-- sum -- find the total value of a column
-- what is total orderd amount
select sum(unit_price)
from order_items;

select order_id, item_id , quantity*unit_price
from order_items
order by order_id, item_id;

select sum(quantity*unit_price), sum(quantity)
from order_items
order by order_id, item_id;

-- how many different types of products do the company offer (available or unavailable)?
select count(*)
from products;

-- what is the quantity of all products offered by the company?
select sum(quantity)
from inventories;

-- How many products are sold in total?
select sum(quantity)
from order_items;

-- avg
-- what is the average of products' price (list price)
select round(avg(list_price),2)
from products;

select round(avg(list_price),2) as average
          , min(list_price) as minprice, 
          max(list_price) as "Maximum Price", 
          count(*) as "Number of Products"
from products;

-- 
select count(*)
from locations;

select count(location_id)
from locations; --23

select count(*)
from locations
where location_id is not null;

select count(city)
from locations; -- 23

select count(state)
from locations; -- 17

select count(*)
from locations
where state is not null; -- 17

select count(*)
from locations
where state is null;

-- How many categories do we have in table products
select count(distinct category_id)
from products;

select category_id, product_id
from products
order by category_id, product_id;

-- How many order lines do we have?
select count(*)
from order_items;

-- What is number of products (items) in each order
select order_id, sum(quantity)
from order_items
where order_id < 10
group by order_id
order by order_id;

select order_id, sum(quantity), sum(quantity*unit_price)
from order_items
group by order_id
having sum(quantity) > 800
order by order_id;

-- find the number of products in each category
select category_id, count(*) as numofproduct
from products
group by category_id
order by numofproduct desc;

select category_id, count(*) as numofproduct
from products
group by category_id
order by count(*) desc;

select category_id, count(*) as numofproduct
from products
group by category_id
having count(*) > 60
order by count(*) desc;

select category_id, count(*) as numofproduct
from products
where category_id = 1
group by category_id;

-- We want to see the products in each order with the quantity 
-- and the total price of those products
select *
from order_items
order by order_id, item_id;

-- Customers who have more than one order in the same date
-- You want to count the number of orders for a customer and a date
select customer_id, order_date, count(*)
from orders
group by customer_id, order_date
order by customer_id;

-- find the number of order in each day
select order_date, count(*)
from orders
group by order_date
order by count(*) desc;

-- For each category of products show the total amount of list price
select category_id, sum(list_price) as "Total Price"
from products
group by category_id
order by sum(list_price);

-- Display the location, the city name, the country ID, and the country name of all countries that do not have any 
--locations placed in them
select l.location_id, l.city, l.country_id, c.country_id, c.country_name 
from locations l
right join countries c
on l.country_id = c.country_id
where l.location_id is null
order by l.country_id;

-- Display the list of countries with not location
select c.country_id, c.country_name 
from locations l
right join countries c
on l.country_id = c.country_id
where l.location_id is null
order by l.country_id;

-- Display the counties and the number of locations for each country
select c.country_id, count(l.location_id)
from locations l
right join countries c
on l.country_id = c.country_id
group by c.country_id
order by c.country_id;

-- For each customer display the customer ID, customer name, and contact's full name
select c.customer_id, c.name, co.first_name || ' ' || co.last_name as "Contact Name" 
from customers c
inner join contacts co
on c.customer_id = co.customer_id
order by c.customer_id;

-- For each customer count the number of contacts
select c.customer_id, c.name, count(*) as "Number of Contacts"
from customers c
left join contacts co
on c.customer_id = co.customer_id
group by c.customer_id, c.name
order by c.customer_id;


-- For each city display the location_id, city name, country_id, and the country name
select l.location_id, l.city, l.country_id as "l.country_id", c.country_id as "c.country_id", c.country_name
from locations l
right join countries c
on l.country_id = c.country_id
order by l.country_id;




