-- DBS 311 - Week 7 
-- Intro to PL/SQL
-- Lecture Demo File
-- Clint MacDonald


SET SERVEROUTPUT ON    -- turns on manual output so we see it :)

-- NON-SAVED PROCEDURE - Just executing some PL/SQL code

BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello World !');
END;


-- DECLARE
DECLARE
  productId NUMBER := 2;
  pID2 NUMBER := 0;
BEGIN
    SELECT 4 INTO pID2 FROM dual;
    DBMS_OUTPUT.PUT_LINE('The product ID is: ' || productID);
    DBMS_OUTPUT.PUT_LINE('The 2nd product ID is: ' || pID2);
END;


-- Let's use this with real tables
-- USING   SELECT INTO
DECLARE
  productId NUMBER := 2;
  productName VARCHAR2(255 BYTE);
  price NUMBER(9,2);
BEGIN
  DBMS_OUTPUT.PUT_LINE ('------------  START ---------');
  SELECT product_name, List_price INTO productName, price
  FROM products
  WHERE product_id = productID;
  DBMS_OUTPUT.PUT_LINE ('Product Name: ' || productName);
  DBMS_OUTPUT.PUT_LINE ('Product Price: ' || price);
  DBMS_OUTPUT.PUT_LINE ('-------------  END ---------');
END;

-- Now SELECT INTO only retrieves ONE ROW, what happens if we have more than one row
DECLARE
  categoryId NUMBER := 2;
  productName VARCHAR2(255 BYTE);
  price NUMBER(9,2);
BEGIN
  DBMS_OUTPUT.PUT_LINE ('------------  START ---------');
  SELECT product_name, List_price INTO productName, price
  FROM products
  WHERE category_id = categoryId;
  DBMS_OUTPUT.PUT_LINE ('Product Name: ' || productName);
  DBMS_OUTPUT.PUT_LINE ('Product Price: ' || price);
  DBMS_OUTPUT.PUT_LINE ('--------------  END ---------');
END;
-- we get some big complicated error message, that is no good to give back to software

-- let us handle errors gracefully
DECLARE
  categoryId NUMBER := 2;
  productName VARCHAR2(255 BYTE);
  price NUMBER(9,2);
BEGIN
  DBMS_OUTPUT.PUT_LINE ('--------------  START ---------');
  SELECT product_name, List_price INTO productName, price
  FROM products
  WHERE category_id = categoryId;
  DBMS_OUTPUT.PUT_LINE ('Product Name: ' || productName);
  DBMS_OUTPUT.PUT_LINE ('Product Price: ' || price);
  DBMS_OUTPUT.PUT_LINE ('--------------  END ---------');
EXCEPTION
WHEN TOO_MANY_ROWS
  THEN 
      DBMS_OUTPUT.PUT_LINE ('Too Many Rows Returned!');
END;


-- LET US MAKE OUR FIRST saved Procedure,
    -- reusable or repeatable

CREATE OR REPLACE PROCEDURE spHelloWorld AS
    MyName NVARCHAR2(25) := 'Clint MacDonald';
BEGIN
    DBMS_OUTPUT.PUT_LINE ('Hello World ' || MyName);
END;

-- Now let us execute it
BEGIN
    spHelloWorld();
END;

CREATE TABLE xPeople (
    pID INT GENERATED BY DEFAULT ON NULL AS IDENTITY  PRIMARY KEY,
    firstName varchar2(25) NOT NULL,
    lastName varchar2(25) NOT NULL,
    DOB date,                           -- date of birth
    isActive NUMERIC(1) DEFAULT 1 NOT NULL,
    favNum INT CHECK (favNum BETWEEN 0 AND 99)
    );

CREATE OR REPLACE PROCEDURE spInsertPeople(
    firstName varchar2,         -- IN
    lastName varchar2,          -- IN
    DOB date,                   -- IN
    isActive NUMERIC,           -- IN
    favNum INT                 -- IN
    ) AS
    newPID INT := 0;
BEGIN
    INSERT INTO xpeople
        VALUES (NULL, firstName, lastName, DOB, isActive, favNum);
    DBMS_OUTPUT.PUT_LINE('Insert Successful');
EXCEPTION
    WHEN OTHERS
        THEN
            DBMS_OUTPUT.PUT_LINE('An Error Occured');
END spInsertPeople;

-- let us execute it
BEGIN
    spInsertPeople('Clint','MacDonald',TO_DATE('051672','mmddyy'),1,16);
END;

SELECT * FROM xPeople;
BEGIN
    spInsertPeople('Bob', 'MacDogoul', TO_DATE('051672','mmddyy'), 1, 16);
END;
SELECT * FROM xPeople;



