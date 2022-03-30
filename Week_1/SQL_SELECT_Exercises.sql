-- In one or two sentences explain what each query returns:
-- For instance, see the following SQL SELECT statement
SELECT * 
FROM employees;

-- Answer: The query returns employee's information for all employees in the employee table.

----------------------------------------------------------------------------------------------
-- Now write what each of the following query returns:
select * -- all columns
from employees
where employee_id = 106; -- 0 or 1 row will be returned. Why?

-- Answer:


----------------------------------------------------------------------------------------------
select employee_id, first_name, last_name -- all columns
from employees
where employee_id = 106; -- 0 or 1
-- Answer:


----------------------------------------------------------------------------------------------
-- LIKE
select *
from employees
where first_name like 'Ell%'; -- % : anything or nothing
-- Answer:


----------------------------------------------------------------------------------------------
select *
from employees
where first_name like '%er'; -- % : anything or nothing
-- Answer:


----------------------------------------------------------------------------------------------
select *
from employees
where first_name like '_e%'; -- % : anything or nothing
-- Answer:


----------------------------------------------------------------------------------------------
-- logical operators
-- not and or

select * -- all columns
from employees
where employee_id = 106; -- 0 or 1
-- Answer:


----------------------------------------------------------------------------------------------
select *
from employees
where first_name like 'E%' and last_name like 'W%'; -- all conditions to be true
-- Answer:


----------------------------------------------------------------------------------------------
select *
from employees
where first_name like 'E%' or last_name like 'W%'; -- one condition to be true return the row
-- Answer:


----------------------------------------------------------------------------------------------
select *
from employees
where employee_id >= 100 and employee_id <= 200;
-- Answer:


----------------------------------------------------------------------------------------------
select *
from employees
where employee_id between 100 and 200;
-- Answer:


----------------------------------------------------------------------------------------------
select *
from employees
where employee_id not between 100 and 200;
-- Answer:


----------------------------------------------------------------------------------------------
select *
from employees
where employee_id > 100 and employee_id < 200;
-- Answer:


----------------------------------------------------------------------------------------------
-- IN operator
select *
from employees
where employee_id not in (102, 200, 27); -- 'A'
-- Answer:


----------------------------------------------------------------------------------------------
select hire_date, employee_id
from employees
where first_name like 'E%' or last_name like 'W%'
order by hire_date, employee_id;
-- Answer:


----------------------------------------------------------------------------------------------
select category_id, product_id
from products
where category_id = 5 or category_id = 2
order by 2;
-- Answer:


----------------------------------------------------------------------------------------------
select category_id, product_id as "Old Product ID", product_id * 2 as "New Product ID"
from products
where category_id = 2;
-- Answer:


----------------------------------------------------------------------------------------------
select * 
from employees
where manager_id is not null;
-- Answer:


----------------------------------------------------------------------------------------------
select products.product_id, products.product_name, products.category_id, product_categories.category_name
from products
inner join product_categories
on products.category_id = product_categories.category_id
order by products.product_id;
-- Answer:


----------------------------------------------------------------------------------------------
select p.product_id, 
    p.product_name, 
    p.category_id, 
    pc.category_name
from products p
inner join product_categories pc
on p.category_id = pc.category_id
order by p.product_id;
-- Answer:


----------------------------------------------------------------------------------------------
select p.product_id, 
    p.product_name, 
    p.category_id,
    pc.category_id,
    pc.category_name
from products p
right join product_categories pc
on p.category_id = pc.category_id
order by pc.category_id;
-- Answer:


----------------------------------------------------------------------------------------------



