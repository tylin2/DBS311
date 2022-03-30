-- Code Samples - May 29, 2020
-- lower upper

select first_name, lower(first_name) as "Lower Case", last_name, upper(last_name)
from employees;

select concat(concat(first_name, ', '), last_name)
from employees;

select first_name ||  ', ' || last_name
from employees;

select 'Contact Name:' || concat(concat(first_name, ' '),last_name) 
from contacts;

select first_name, 
substr(lower(first_name),1,1) || lower(last_name) || '@email.com' as "Email"
from contacts;

select product_name, length(product_name) as "Length of Name"
from products
order by length(product_name);

select first_name, length(first_name) as "First Name Length"
from contacts
where length(first_name) > 6
order by length(first_name);

select first_name, length(first_name) as "First Name Length"
from contacts
where length(first_name) > 3 and length(first_name) < 6
order by "First Name Length";

select email, initcap(email)
from employees;


select product_name, instr(product_name, 't')
from products;

select product_name, instr(product_name, ' ')
from products;

select first_name, instr(first_name, 'w') as "With w"
from contacts
where instr(first_name, 'w') > 1
order by "With w";

select first_name, instr(first_name, ' ') as "With space"
from contacts
where instr(first_name, ' ') > 1
order by "With space";

select first_name, lpad(first_name, 20, '*')
from contacts;

select first_name, rpad(first_name, 20, '*')
from contacts;

select first_name, replace(first_name, 's', '$')
from contacts
where first_name like '%s%';

select first_name, replace(lower(first_name), 's', '$')
from contacts
where lower(first_name) like '%s%';

select first_name, '$' || trim('S' from first_name)
from contacts
where first_name like 'S%';

select product_id, product_name, list_price, 
    list_price * 1.01 as "New Price",
    round(list_price * 1.01, 2) as "Rounded"
from products;

select round(2.552, 0)
from dual;

select trunc(2.352, 0)
from dual;

select mod(4,3)
from dual;

select employee_id, mod(employee_id, 2)
from employees;

select city, nvl(state, 'unkmown') as "State"
from locations;

select city, state, nvl2(state, 'state is known', 'state is unknown')
from locations;

select city, state, coalesce(state,city,'unknow')
from locations;

select * from locations;

-- use round, trunc, Mod function

--Date Type Data
select employee_id, hire_date from employees;

-- sysdate
select sysdate, current_date + 1
from dual;

select employee_id, (sysdate - hire_date) / 7 as "Weeks"
from employees;

select employee_id, trunc((sysdate - hire_date) / 7,0) as "Weeks"
from employees
order by "Weeks";

-- ADD_MONTHS
select hire_date, add_months(hire_date, 1)
from employees;

-- CURRENT_DATE
select add_months(current_date,2) 
from dual;

-- current_timestamp
select current_timestamp
from dual;

-- EXTRACT
select extract (year from current_date)
from dual;

select extract (month from current_date)
from dual;

select extract (day from current_date)
from dual;

-- LAST_DAY
select last_day(current_date)
from dual;

-- MONTHS_BETWEEN
select trunc(months_between(current_date , hire_date),0)
from employees;

-- NEXT_DAY
select next_day(current_date, 'Monday')
from dual;

-- TO_CHAR


-- TO_DATE


-- ROUND
select round(sysdate, 'MONTH')
from dual;

select round(sysdate, 'YEAR')
from dual;

-- TRUC
select trunc(sysdate, 'MONTH')
from dual;

select trunc(sysdate, 'MONTH')
from dual;

-- 

SELECT employee_id,
        hire_date,
      MONTHS_BETWEEN (SYSDATE, hire_date) "Seniority",
      ADD_MONTHS (hire_date, 6) "Review Date",
      NEXT_DAY (hire_date, 'Friday'),
       LAST_DAY (hire_date)
FROM employees
WHERE MONTHS_BETWEEN (SYSDATE, hire_date) > 70;

-- 
select last_name, hire_date,
    TO_CHAR (hire_date, 'YYYY-Month-DD')
from employees;

SELECT EMPLOYEE_ID,TO_CHAR (HIRE_DATE, 'MM/YY') Month_Hired
FROM EMPLOYEES
WHERE LAST_NAME like 'H%';

-- 
SELECT EMPLOYEE_ID,TO_CHAR (HIRE_DATE, 'fm   MM/DD/YY') HireDate
FROM EMPLOYEES 
WHERE LAST_NAME like 'H%';

SELECT EMPLOYEE_ID,TO_CHAR (HIRE_DATE, 'MM/DD/YY') HireDate
FROM EMPLOYEES 
WHERE LAST_NAME like 'H%';

-- MONTH
select to_char(sysdate, 'MONTH')
from dual;

select to_char(hire_date, 'MONTH')
from employees;

select to_char(sysdate + 90, 'MON')
from dual;

select to_char(sysdate, 'DAY')
from dual;

select to_char(sysdate, 'WW') || 'th week of the year'
from dual;

select to_char(sysdate, 'W') || 'th week of the month'
from dual;

select to_char(sysdate, 'DD "of" MONTH')
from dual;

select to_char(sysdate + 1, 'ddspth "of" MONTH')
from dual;

select to_char(sysdate + 20, 'ddspth "of" MONTH')
from dual;

select sysdate,to_char(sysdate + 10, 'DD-MONTH-YYYY')
from dual;
select to_char(sysdate + 10, 'FMDD-MONTH-YYYY')
from dual;


SELECT last_name,TO_CHAR(sysdate, 'Ddspth "of" Month  YYYY   HH:MI')
FROM employees;

SELECT product_name, TO_CHAR(list_price, '$99,999.00') as price
FROM products;

select to_number('1234') - 2
from dual;

-- TO_DATE
select current_date, to_date('09-01-2020', 'DD-MM-YYYY')
from dual;

select employee_id, hire_date
from employees
where hire_date > to_date('09-SEP-16', 'DD-MON-YY');

SELECT last_name, hire_date
from employees
where hire_date = to_date('May 24, 2016', 'Month DD, YYYY');







