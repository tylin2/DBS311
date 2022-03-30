----------------------------------------------------------------------------------------------------------
--Course: DBS311
--Section: BC
-- Fall 2020
-- Sample SQL SELECT statements (Multi-row Functions)
------------------------------------------------------------------
-- 
select count(*)
from employees;

-- for each customer with orders display the total orders amount

select o.customer_id, o.order_id, oi.item_id, oi.product_id, oi.quantity, oi.unit_price, 
        oi.quantity * oi.unit_price as total_per_item
from orders o
inner join order_items oi
on o.order_id = oi.order_id
order by o.customer_id, o.order_id, item_id;


select o.customer_id, sum(oi.quantity * oi.unit_price) as total
from orders o
inner join order_items oi
on o.order_id = oi.order_id
group by o.customer_id
order by o.customer_id;

-- sort the result on total
select o.customer_id, sum(oi.quantity * oi.unit_price) as total
from orders o
inner join order_items oi
on o.order_id = oi.order_id
group by o.customer_id
order by sum(oi.quantity * oi.unit_price);

-- for each customer with orders display the total orders amount. Only show customers 
-- with ID 1, 10, 20 if their total amount is greater than 1000000

select o.customer_id, sum(oi.quantity * oi.unit_price) as total
from orders o
inner join order_items oi
on o.order_id = oi.order_id
where customer_id in (1,10,20)
group by o.customer_id
having sum(oi.quantity * oi.unit_price) > 1000000
order by total;


-- claculate the date of the day 30 days after the hire_date for each employee. 
-- Sort the result by the new_date. 
select hire_date, to_char(hire_date + 30, 'Month ddth "of the" year') as new_date
from employees
order by (hire_date + 30);













