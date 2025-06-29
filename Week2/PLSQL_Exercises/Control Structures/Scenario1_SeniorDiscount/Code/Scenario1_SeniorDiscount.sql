-- Create the customers table
CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    age NUMBER,
    loan_interest_rate NUMBER
);

-- Insert sample data
INSERT INTO customers VALUES (101, 'David', 62, 10.0);
INSERT INTO customers VALUES (102, 'Eva', 45, 9.2);
INSERT INTO customers VALUES (103, 'Frank', 68, 11.5);
COMMIT;

-- Enable DBMS_OUTPUT
SET SERVEROUTPUT ON;

-- PL/SQL block to apply discount
BEGIN
    FOR cust IN (SELECT * FROM customers) LOOP
        IF cust.age > 60 THEN
            UPDATE customers
            SET loan_interest_rate = loan_interest_rate - 1
            WHERE customer_id = cust.customer_id;

            DBMS_OUTPUT.PUT_LINE('1% discount applied to: ' || cust.name);
        END IF;
    END LOOP;
END;
/

-- View the result
SELECT * FROM customers;