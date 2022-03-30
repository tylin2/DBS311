-- *********************** 
-- Name: Ting-Yeh Lin
-- ID: 141726182
-- Date: 2020/11/02
-- Purpose: Lab 5 DBS311
-- ***********************
SET SERVEROUTPUT ON
-- Question 1 ¡V checking nu is even or odd
-- Q1 SOLUTION ¡V
CREATE PROCEDURE find(nu IN INTEGER) AS    
BEGIN   
    IF MOD(nu,2) = 0 THEN
    DBMS_OUTPUT.PUT_LINE ('The number is even.');
    ELSE
    DBMS_OUTPUT.PUT_LINE ('The number is odd.');        
    END IF;
EXCEPTION
WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE ('Error!');
END;

BEGIN
    find(10);
END;

-- Question 2 ¡V Display the employee information by employee id 
-- Q2 SOLUTION ¡V  
CREATE OR REPLACE PROCEDURE find_employee(emp_id IN NUMBER) AS
  fname VARCHAR2(255 BYTE);
  lname VARCHAR2(255 BYTE);
  mail VARCHAR2(255 BYTE);
  phone VARCHAR2(50 BYTE);
  hdate DATE;
  jtitle VARCHAR2(255 BYTE);
BEGIN   
    SELECT first_name, last_name, email,phone,hire_date,job_title 
    INTO fname, lname, mail, phone, hdate, jtitle
    FROM employees
    WHERE employee_id =emp_id;
    DBMS_OUTPUT.PUT_LINE ('First name: ' || fname);
    DBMS_OUTPUT.PUT_LINE ('Last name: ' || lname);
    DBMS_OUTPUT.PUT_LINE ('Email: ' || mail);
    DBMS_OUTPUT.PUT_LINE ('Phone: ' || phone);
    DBMS_OUTPUT.PUT_LINE ('Hire date: ' || hdate);
    DBMS_OUTPUT.PUT_LINE ('Job title: ' || jtitle);
EXCEPTION
WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE ('The employee with ID '||emp_id||' does not exist.');
WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE ('Error!');
END;

BEGIN
  find_employee(1);
END;

-- Question 3 ¡V Update the list_price by the categoties 
-- Q3 SOLUTION ¡V  
CREATE OR REPLACE PROCEDURE update_price_by_cat(category_id IN NUMBER, amount products.list_price%type) AS
    Rows_updated NUMBER;
BEGIN   
    UPDATE products
    SET products.list_price = products.list_price + amount
    WHERE products.category_id = update_price_by_cat.category_id
    AND products.list_price > 0;
    Rows_updated:= sql%rowcount;
    DBMS_OUTPUT.PUT_LINE (Rows_updated||' rows were affected by the update query,');
EXCEPTION
WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE ('Error!');
END;
  
BEGIN
  update_price_by_cat(1,5);
END;

-- Question 4 ¡V Update the list_price if it is less than the average 
-- Q4 SOLUTION ¡V  
CREATE OR REPLACE PROCEDURE update_price_under_avg AS
    Rows_updated NUMBER;
    avg_price products.list_price%type;    
BEGIN
    SELECT avg(list_price)
    INTO avg_price
    FROM products;
    UPDATE products
    SET products.list_price = products.list_price *1.02
    WHERE products.list_price<avg_price AND products.list_price<=1000;
    Rows_updated:= sql%rowcount;
    DBMS_OUTPUT.PUT_LINE (Rows_updated||' products are increased 2%.');
    Rows_updated:=0;
    UPDATE products
    SET products.list_price = products.list_price *1.01
    WHERE products.list_price<avg_price AND products.list_price>1000;
    Rows_updated:= sql%rowcount;
    DBMS_OUTPUT.PUT_LINE (Rows_updated||' products are increased 1%.');
EXCEPTION
WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE ('Error!');
END;
  
BEGIN
  update_price_under_avg();
END;

-- Question 5 ¡V Update the list_price if it is less than the average 
-- Q5 SOLUTION ¡V  
CREATE OR REPLACE PROCEDURE product_price_report AS
    avg_price products.list_price%type; 
    min_price products.list_price%type;
    max_price products.list_price%type;
    price products.list_price%type;
    cheap_count NUMBER := 0;
    fair_count NUMBER := 0;
    exp_count NUMBER := 0;
BEGIN
    SELECT min(list_price),max(list_price),avg(list_price)
    INTO min_price,max_price,avg_price
    FROM products;
    SELECT count(*)
    INTO cheap_count
    FROM products
    WHERE list_price<(avg_price - min_price) / 2;
    SELECT count(*)
    INTO exp_count
    FROM products
    WHERE list_price>(max_price - avg_price) / 2;
    SELECT count(*)
    INTO fair_count
    FROM products
    WHERE list_price<=(max_price - avg_price) / 2 AND  list_price>=(avg_price - min_price) / 2;
    DBMS_OUTPUT.PUT_LINE ('Cheap: '||cheap_count);
    DBMS_OUTPUT.PUT_LINE ('Fair: '||exp_count);    
    DBMS_OUTPUT.PUT_LINE ('Expensive: '||fair_count);
EXCEPTION
WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE ('Error!');
END;
  
BEGIN
  product_price_report();
END;






