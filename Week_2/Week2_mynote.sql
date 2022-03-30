-- lower() and upper()
select lower('TeST')
from dual;

select lower('1@hg')
from dual;

select employee_id, first_name, lower(first_name)
from employees;

select lower(first_name) || 'gmail.com' as email
from employees;

select first_name || ', ' || last_name as "Employee Name"
from employees;

select concat(concat(lower(first_name),'.'),last_name)as "Employee Name"
from employees;

-- Error
select concat(first_name,'.',last_name)
from employees;

-- length
select length('Nasim')
from dual;

select first_name, length(first_name)
from employees
where length(first_name)>4
order by length(first_name) desc;

select distinct length(first_name)
from employees
order by length(first_name);

select distinct length(job_title) as "Job Length"
from employees
where length(job_title)>10
order by length(job_title) desc;

select initcap('14tor')
from dual;

select initcap('test')
from dual;

select initcap(category_name)
from product_categories;

select initcap(lower(category_name))
from product_categories;

select instr('Hello World!','o')
from dual;

select first_name
from employees
where instr(first_name, 's') > 0;

select first_name, lpad(first_name,20,'*')
from contacts;

select first_name, rpad(first_name,20,'*')
from contacts;

select first_name, replace(lower(first_name),'s','$')
from contacts
where lower(first_name) like '%s%';

select trunc(4.35,1) --無條件捨去
from dual;
select trunc(4.7)
from dual;

select round(4.34,1) --四捨五入
from dual;

select round(4.35,1) --四捨五入
from dual;

select mod(4,3) -- mod == % in C++
from dual;

select mod(4,2) --0
from dual;

SELECT employee_id
from employees
where mod(employee_id, 2) = 0;