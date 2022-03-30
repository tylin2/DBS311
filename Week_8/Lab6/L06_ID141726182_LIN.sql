-- ***********************
-- Name: Ting-Yeh Lin
-- ID: 141726182
-- Date: 2020/11/13
-- Purpose: Lab 6 DBS311
-- ***********************
SET SERVEROUTPUT ON
-- Question 1 ¡V calculates and displays its factorial
-- Q1 SOLUTION ¡V
CREATE OR REPLACE PROCEDURE fact(nu IN INT) AS    
    total INT := 1;
    rowString VARCHAR2(255) := nu || '!'||' = '||'fact('||nu||') = ';
BEGIN
    IF nu=0 THEN
        DBMS_OUTPUT.PUT_LINE ('0! = 1');
    ELSE
        FOR i IN REVERSE 1..nu LOOP 
            total := total * i;
            IF i=nu THEN
                rowString := rowString || i;
            ELSE
                rowString := rowString || ' * '|| i;
            END IF;
        END LOOP;
        DBMS_OUTPUT.PUT_LINE (rowString || ' = ' || total);
    END IF;
EXCEPTION
WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE ('Error!');
END;

/
BEGIN
    fact(5);
END;
/

-- Question 2 ¡V calculating amount is increased by 5% per year from the salary of 10,000 after the employee is employed.
-- Q2 SOLUTION ¡V
CREATE OR REPLACE PROCEDURE calculate_salary(emp_id IN NUMBER) AS
  fname VARCHAR2(255 BYTE);
  lname VARCHAR2(255 BYTE); 
  hdate DATE;
  during_year INT;
  salary NUMBER(8,2) := 10000;
BEGIN   
    SELECT first_name, last_name,hire_date
    INTO fname, lname, hdate
    FROM employees
    WHERE employee_id =emp_id;
    during_year := FLOOR(MONTHS_BETWEEN(SYSDATE,hdate)/12);
    FOR i IN 1..during_year LOOP
        salary := salary * 1.05;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE ('First name: ' || fname);
    DBMS_OUTPUT.PUT_LINE ('Last name: ' || lname);    
    DBMS_OUTPUT.PUT_LINE ('Salary:' || TO_CHAR(salary, '$999,999.99'));
EXCEPTION
WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE ('The employee with ID '||emp_id||' does not exist.');
WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE ('Error!');
END;

/
BEGIN
  calculate_salary(0);
END;
/

-- Question 3 ¡V Listing all the warehouses info.(id, name, city and state)
-- Q3 SOLUTION ¡V
CREATE OR REPLACE PROCEDURE warehouses_report AS
    w_id warehouses.warehouse_id%type;
    w_name warehouses.warehouse_name%type;
    l_city locations.city%type;
    l_state locations.state%type;
    i warehouses.warehouse_id%type := 1;
BEGIN   
   LOOP        
        SELECT w.warehouse_id,w.warehouse_name,l.city,NVL(l.state,'no state')
        INTO w_id,w_name,l_city,l_state
        FROM warehouses w
        JOIN locations l ON w.location_id=l.location_id
        WHERE w.warehouse_id = i;        
        DBMS_OUTPUT.PUT_LINE ('Warehouse ID: ' || w_id);
        DBMS_OUTPUT.PUT_LINE ('Warehouse name: ' || w_name);
        DBMS_OUTPUT.PUT_LINE ('City: ' || l_city);
        DBMS_OUTPUT.PUT_LINE ('State: ' || l_state);
        DBMS_OUTPUT.PUT_LINE ('');
        i := i + 1;
        EXIT WHEN i>9;
   END LOOP;
EXCEPTION
WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE ('There is no data found.');
WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE ('Error!');
END;

/
BEGIN
    warehouses_report();
END;
/
