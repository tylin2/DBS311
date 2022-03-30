select employee_id, first_name, last_name -- all colums
from employees
where first_name ='Rose'; -- 0 or 1

select employee_id, first_name, last_name -- all colums
from employees
where first_name like 'El%'; -- % : anything or nothing

select employee_id, first_name, last_name -- all colums
from employees
where first_name like '%er'; -- % : anything or nothing

select employee_id, first_name, last_name -- all colums
from employees
where first_name like '_e%'; -- _ : anything or nothing