SET SERVEROUTPUT ON
/
CREATE OR REPLACE PROCEDURE inc_p (price IN OUT FLOAT) AS    
BEGIN   
    price := price * 1.1;
    DBMS_OUTPUT.PUT_LINE ('price: '||price);
EXCEPTION
WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE ('Error!');
END;
/
DECLARE
    price NUMBER:=917.9;
BEGIN
    inc_p(price);
END;
/
create or replace spHelloWorld  AS
 MyName VARCHAR2(25 BYTE) := 'Henry Ford';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello World!' || 'World' || MyName);
EXCEPTION
WHEN OTHERS THEN
 DBMS_OUTPUT.PUT_LINE ('There was an error!');
END;

/
BEGIN
spHelloWorld();
END;
/
CREATE OR REPLACE PROCEDURE cheapest_product AS
    p_id products.product_id%type;
    p_name products.product_name%type;
    price products.list_price%type;
BEGIN
    SELECT product_id, product_name,list_price
    INTO p_id,p_name,price
    FROM products
    WHERE list_price=(SELECT min(list_price)
                        FROM products);
     DBMS_OUTPUT.PUT_LINE ('Product_id: '||p_id);
     DBMS_OUTPUT.PUT_LINE ('Product_name: '||p_name);
     DBMS_OUTPUT.PUT_LINE ('List_Price: '||price);   
EXCEPTION
WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE ('Error!');
END;
/
BEGIN
  cheapest_product();
END;
/
CREATE OR REPLACE PROCEDURE game(a_id IN NUMBER,b_id IN NUMBER,a_score IN NUMBER,b_score IN NUMBER, winner OUT NUMBER) AS    
BEGIN   
    IF a_score > b_score THEN
    winner:=a_id;
    ELSIF b_score > a_score THEN
    winner:=b_id;
    ELSIF b_score = a_score THEN
    winner:=0;
    ELSE
    winner:=-1;        
    END IF;    
EXCEPTION    
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE ('Error!');
END;

/
DECLARE
   winner NUMBER:=-1;
BEGIN
    game(1,2,0,1,winner);
    DBMS_OUTPUT.PUT_LINE ('winner: '||winner);
    game(1,2,1,0,winner);
    DBMS_OUTPUT.PUT_LINE ('winner: '||winner);
    game(1,2,1,1,winner);
    DBMS_OUTPUT.PUT_LINE ('winner: '||winner);
END;
/