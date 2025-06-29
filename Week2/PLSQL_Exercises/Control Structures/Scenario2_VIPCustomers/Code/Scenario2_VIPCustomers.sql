-- Create the customers table with balance and IsVIP flag
CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    balance NUMBER,
    isVIP CHAR(1) DEFAULT 'N'  -- 'Y' for VIP, 'N' for regular
);

-- Insert different sample data
INSERT INTO customers VALUES (301, 'David', 8000, 'N');
INSERT INTO customers VALUES (302, 'Emma', 15000, 'N');
INSERT INTO customers VALUES (303, 'Fiona', 20000, 'N');
INSERT INTO customers VALUES (304, 'George', 9500, 'N');
INSERT INTO customers VALUES (305, 'Helen', 11000, 'N');
COMMIT;

--Enable output
SET SERVEROUTPUT ON;

--PL/SQL block to promote VIPs
BEGIN
    FOR cust IN (SELECT * FROM customers) LOOP
        IF cust.balance > 10000 THEN
            UPDATE customers
            SET isVIP = 'Y'
            WHERE customer_id = cust.customer_id;

            DBMS_OUTPUT.PUT_LINE(cust.name || ' is now a VIP customer.');
        END IF;
    END LOOP;
END;
/

--View updated data
SELECT * FROM customers;