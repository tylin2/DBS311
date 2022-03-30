-- ************************************
-- DBS 311 - Week 8 - Lecture 2
-- Intro to PL/SQL Demo Continued 
-- Clint MacDonald
-- ************************************

SET SERVEROUTPUT ON

-- LOOPS continued

-- CONTINUE AND CONTINUE WHEN Statements
-- immediately jumps to next iteration of the loop.
DECLARE
    Counter INT := 0;
    eNum INT := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('----------------------------------');
    LOOP
        Counter := Counter + 1;
        IF Counter = 3 THEN
            CONTINUE;
        END IF;
        DBMS_OUTPUT.PUT_LINE('- ' || Counter || ' -');

        EXIT WHEN Counter = eNum;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('----------------------------------');
END;

-- CONTINUE WHEN
DECLARE
    Counter INT := 0;
    eNum INT := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('----------------------------------');
    LOOP
        Counter := Counter + 1;
        CONTINUE WHEN Counter = 3;
        DBMS_OUTPUT.PUT_LINE('- ' || Counter || ' -');
        EXIT WHEN Counter = eNum;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('----------------------------------');
END;

-- FOR LOOP
BEGIN
    FOR i IN 0..10 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
    
-- FOR Using REVERSE
BEGIN
    FOR i IN REVERSE 0..10 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;

-- Nested FOR Loops - redo Nest LOOP from last class
DECLARE 
    max# NUMBER := &Num;
    rowString VARCHAR2(255) := '';
BEGIN
    DBMS_OUTPUT.PUT_LINE('-----------------------');
    FOR r IN 0..max# LOOP 
        rowString := LPAD(r, 3, ' ') || ' - ';
        FOR c IN 0..max# LOOP
            rowString := rowString || LPAD(r * c, 4, ' ');
        END LOOP;
        DBMS_OUTPUT.PUT_LINE(rowString);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('-----------------------');
END;

-- WHILE LOOP
DECLARE 
    i INT := 0;
    max# INT := 10;
BEGIN
    WHILE i <= Max# LOOP
        DBMS_OUTPUT.PUT_LINE('- ' || i || ' -');
        i := i + 1;
    END LOOP;
END;

-- CURSORS

-- Built in Implicit Cursors

-- already shown you 
-- SQL%ROWCOUNT
    -- returns the number of rows affected by the previous DML or SELECT statement
-- SQL%FOUND  - is boolean and is true if at least one row is affected.
-- SQL%NOTFOUND - boolean opposite of FOUND,  returns true if NO rows affected by prev. DML or SELECT

-- EXPLICIT CURSORS

DECLARE 
    CURSOR c1 IS
        SELECT last_name, job_title
        FROM employees
        WHERE UPPER(job_title) LIKE 'A%T%'
        ORDER BY last_name;

    lname employees.last_name%type;
    jtitle employees.job_title%type;

BEGIN
    DBMS_OUTPUT.PUT_LINE('-----------------------');
    
    OPEN c1;

    LOOP
        FETCH c1 INTO lname, jtitle;   -- FETCH moves to the next returned row automatically.
        EXIT WHEN c1%notfound;
        DBMS_OUTPUT.PUT_LINE(RPAD(lname,15,' ') || jtitle);
    END LOOP;
    
    CLOSE c1;
    
    DBMS_OUTPUT.PUT_LINE('-----------------------');
END;

-- Using Parameters in CURSOR

DECLARE 
    prod products%rowtype;
    
    CURSOR prodCur (lowPrice NUMBER, highPrice NUMBER) IS
        SELECT * FROM products
        WHERE list_price BETWEEN lowPrice AND highPrice;
BEGIN
    OPEN ProdCur(1100, 1200);
    
    LOOP
        FETCH ProdCur INTO prod;
        EXIT WHEN ProdCur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(RPAD(prod.product_name || ':', 40, ' ') || ' $' || prod.list_price);
    END LOOP;
    
    CLOSE ProdCur;
END;
       
       
-- Using a FOR Cursor LOOP
DECLARE 
    CURSOR prodCur (lowPrice NUMBER, highPrice NUMBER) IS
        SELECT * FROM products
        WHERE list_price BETWEEN lowPrice AND highPrice;
BEGIN
    FOR item IN ProdCur(1100, 1200) LOOP
        DBMS_OUTPUT.PUT_LINE(RPAD(item.product_name || ':', 40, ' ') || ' $' || item.list_price);
    END LOOP;
    IF prodCur%ISOPEN THEN
        CLOSE ProdCur;
    END IF;
END;


-- -----------------------------------
-- USER DEFINED Functions
-- -----------------------------------
CREATE OR REPLACE FUNCTION fncFindHigherNumber(Num1 INT, Num2 INT) RETURN INT 
IS
BEGIN
    IF Num1 > Num2 THEN
        RETURN Num1;
    ELSE
        RETURN Num2;
    END IF;
END fncFindHigherNumber;

-- Execute it
BEGIN
    DBMS_OUTPUT.PUT_LINE(fncFindHigherNumber(12, 45));
    DBMS_OUTPUT.PUT_LINE(fncFindHigherNumber(23, 14));
    DBMS_OUTPUT.PUT_LINE(fncFindHigherNumber(22, 22));
END;


-- With SQL
CREATE OR REPLACE FUNCTION fncMaxListPrice RETURN NUMBER
IS
    maxP NUMBER := 0;
BEGIN
    SELECT MAX(list_price) INTO maxP
    FROM products;
    
    RETURN maxP;
END;

-- Execute it.
BEGIN
    DBMS_OUTPUT.PUT_LINE('The highest priced item costs $' || fncMaxListPrice());
END;

-- --------------------
SELECT * FROM PRODUCTS;

SELECT product_name, list_price, 
    fncMaxListPrice() AS Largest, 
    fncMaxListPrice() - list_price AS diff
FROM products;
