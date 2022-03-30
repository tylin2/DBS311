-- ************************************
-- DBS 311 - Week 8 - Lecture 1
-- Intro to PL/SQL Demo Continued 
-- Clint MacDonald
-- ************************************

-- Quick review of last class
SET SERVEROUTPUT ON

-- parameters with the same name as the field
CREATE OR REPLACE PROCEDURE spInsertPeople2 (
    firstName varchar2,         -- IN
    lastName varchar2,          -- IN
    DOB date,                   -- IN
    isActive NUMERIC,           -- IN
    favNum INT                 -- IN
    ) AS
BEGIN
    INSERT INTO xPeople p (p.firstName, p.lastName, p.DOB, p.isActive, p.favNum)
        VALUES (spInsertPeople2.firstName, spInsertPeople2.lastName,
            spInsertPeople2.DOB, spInsertPeople2.isActive, spInsertPeople2.favNum);
    DBMS_OUTPUT.PUT_LINE('Insert Successful');
EXCEPTION
    WHEN OTHERS
        THEN
            DBMS_OUTPUT.PUT_LINE('An error occurred!');
END spInsertPeople2;
-- execute it
BEGIN
    spInsertPeople2('Jim', 'Smith', TO_DATE('030689', 'mmddyy'), 1, 4);
END;

SELECT * FROM xPeople;

-- SPs with Parameters
    -- IN, OUT, IN OUT
CREATE OR REPLACE PROCEDURE spInsertPeople3 (
    firstName VARCHAR2,         -- IN
    lastName VARCHAR2,          -- IN
    DOB DATE,                   -- IN
    isActive IN NUMERIC,        -- IN
    favNum IN INT,              -- IN
    peepID OUT INT              -- OUT
    ) AS
BEGIN
    INSERT INTO xPeople 
        VALUES (NULL, firstName, lastName, DOB, isActive, favNum);
    DBMS_OUTPUT.PUT_LINE('Insert Successful');
    
    SELECT pID INTO peepID
        FROM xPeople
        WHERE rowNum = 1
        ORDER BY pID DESC;
EXCEPTION
    WHEN OTHERS
        THEN
            DBMS_OUTPUT.PUT_LINE('An error occurred!');
END spInsertPeople3;
-- Execute it
DECLARE 
    NewPeepID INT := 0;
BEGIN
    spInsertPeople3('Sarah', 'Jones', TO_DATE('030689', 'mmddyy'), 1, 4, NewPeepID);
    DBMS_OUTPUT.PUT_LINE('The new peopleID is: ' || NewPeepID || '.');
END;
SELECT * FROM xPeople;

------------------------
CREATE OR REPLACE PROCEDURE spInsertPeople4 (
    firstName VARCHAR2,         -- IN
    lastName VARCHAR2,          -- IN
    DOB DATE,                   -- IN
    isActive IN NUMERIC,        -- IN
    favNum IN INT,              -- IN
    peepID OUT INT,             -- OUT
    NumPeeps OUT INT            -- OUT
    ) AS
BEGIN
    INSERT INTO xPeople 
        VALUES (NULL, firstName, lastName, DOB, isActive, favNum);
    DBMS_OUTPUT.PUT_LINE('Insert Successful');
    
    SELECT pID INTO peepID
        FROM xPeople
        WHERE rowNum = 1
        ORDER BY pID DESC;
        
    SELECT COUNT(pID) INTO NumPeeps
        FROM xPeople;
EXCEPTION
    WHEN OTHERS
        THEN
            DBMS_OUTPUT.PUT_LINE('An error occurred!');
END spInsertPeople4;

-- Execute it
DECLARE 
    NewPeepID INT := 0;
    NumPeeps INT := 0;
BEGIN
    spInsertPeople4('Sarah', 'Jones', TO_DATE('030689', 'mmddyy'), 1, 4, NewPeepID, NumPeeps);
    DBMS_OUTPUT.PUT_LINE('The new peopleID is: ' || NewPeepID || '.');
    DBMS_OUTPUT.PUT_LINE('There are now ' || numPeeps || ' people in the database table.');
END;
SELECT * FROM xPeople;

-- IN OUT parameters
CREATE OR REPLACE PROCEDURE spNewSalary ( salary IN OUT FLOAT ) AS
BEGIN
    salary := salary * 1.2;
END spNewSalary;
-- execute it
DECLARE
    salary FLOAT := ROUND(74500.43/12, 2);
BEGIN
    DBMS_OUTPUT.PUT_LINE('The OLD salary was: $' || salary);
    spNewSalary(salary);
    DBMS_OUTPUT.PUT_LINE('The OLD salary was: $' || ROUND(salary,2));
END;
-- use user input
DECLARE
    salary FLOAT := ROUND(&AnnualSalary/12, 2);
BEGIN
    DBMS_OUTPUT.PUT_LINE('The OLD salary was: $' || salary);
    spNewSalary(salary);
    DBMS_OUTPUT.PUT_LINE('The OLD salary was: $' || ROUND(salary,2));
END;

-- --------
-- CONDITIONAL STATEMENTS
SELECT * FROM xPeople;

CREATE OR REPLACE PROCEDURE spDelPeep(peepID xpeople.pid%type) AS
BEGIN
    DELETE FROM xPeople WHERE pID = peepID;
    
    IF SQL%ROWCOUNT = 0 THEN 
        DBMS_OUTPUT.PUT_LINE('Person ' || peepID || ' did not exist, no records deleted');
    ELSIF SQL%ROWCOUNT = 1 THEN
        DBMS_OUTPUT.PUT_LINE('Person ' || peepID || ' deleted successfully');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Multiple rows were DELETED!');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An Error Occured!');
END spDelPeep;

-- Execute it
BEGIN
    spDelPeep(2);
END;
SELECT * FROM xPeople;
COMMIT; -- to make it permanent
ROLLBACK; -- does nothing after commit

BEGIN
    spDelPeep(199);
END;

-- SELECT CASE
CREATE OR REPLACE PROCEDURE spDelPeep2(peepID xpeople.pid%type) AS
BEGIN
    DELETE FROM xPeople WHERE pID = peepID;
    
    CASE SQL%ROWCOUNT
        WHEN 0 THEN 
            DBMS_OUTPUT.PUT_LINE('Person ' || peepID || ' did not exist, no records deleted');
        WHEN 1 THEN
            DBMS_OUTPUT.PUT_LINE('Person ' || peepID || ' deleted successfully');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Multiple rows were DELETED!');
    END CASE;
EXCEPTION
    WHEN CASE_NOT_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('An Error Occured! - could not see how many records were effected');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An Error Occured!');
END spDelPeep2;

-- test it
BEGIN 
    spDelPeep2(5);
END;



-- LOOPS
-- 4 types of LOOPS
    -- BASIC LOOP
    -- WHILE LOOP
    -- FOR LOOP
    -- Cursor FOR LOOP

-- example of BASIC LOOP
-- Output the powers of 2
DECLARE 
    curNum INT := 0;
    maxNum INT := 16;
BEGIN
    DBMS_OUTPUT.PUT_LINE('----  Powers of 2  ----');
    LOOP
        DBMS_OUTPUT.PUT_LINE('Power: ' || curNum || ' - ' || POWER(2, curNum));
        curNum := curNum + 1;
        IF curNum > maxNum THEN 
            EXIT;
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('-----------------------');
END;
-- OR using EXIT WHEN 
DECLARE 
    curNum INT := 0;
    maxNum INT := 16;
BEGIN
    DBMS_OUTPUT.PUT_LINE('----  Powers of 2  ----');
    LOOP
        DBMS_OUTPUT.PUT_LINE('Power: ' || curNum || ' - ' || POWER(2, curNum));
        curNum := curNum + 1;
        
        EXIT WHEN curNum > maxNum;  -- replaces the IF in the previous example
        
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('-----------------------');
END;

-- NESTED BASIC LOOPS

DECLARE 
    r NUMBER := 0;
    c NUMBER := 0;
    max# NUMBER := &Num;
    rowString VARCHAR2(255) := '';
BEGIN
    DBMS_OUTPUT.PUT_LINE('-----------------------');
    LOOP 
        rowString := LPAD(r, 3, ' ') || ' - ';
        LOOP
            rowString := rowString || LPAD(r * c, 4, ' ');
            c := c + 1;
            EXIT WHEN c > max#;
        END LOOP;
        c := 0;
        DBMS_OUTPUT.PUT_LINE(rowString);
        r := r + 1;
        EXIT WHEN r > max#;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('-----------------------');
END;