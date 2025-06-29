--Create the savings_accounts table
CREATE TABLE savings_accounts (
    account_id NUMBER PRIMARY KEY,
    account_holder VARCHAR2(100),
    balance NUMBER
);

--Insert sample data
INSERT INTO savings_accounts VALUES (601, 'Alice', 10000);
INSERT INTO savings_accounts VALUES (602, 'Bob', 8500);
INSERT INTO savings_accounts VALUES (603, 'Carol', 12000);
INSERT INTO savings_accounts VALUES (604, 'David', 5000);
COMMIT;

--Enable output
SET SERVEROUTPUT ON;

--Create the procedure to apply 1% interest
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
BEGIN
    FOR acc IN (SELECT * FROM savings_accounts) LOOP
        UPDATE savings_accounts
        SET balance = balance + (balance * 0.01)
        WHERE account_id = acc.account_id;

        DBMS_OUTPUT.PUT_LINE('Interest applied for: ' || acc.account_holder ||
                             ' | New Balance: ' || TO_CHAR(acc.balance + (acc.balance * 0.01), '99999.99'));
    END LOOP;
END;
/

--Execute the procedure
BEGIN
    ProcessMonthlyInterest;
END;
/

--View updated balances
SELECT * FROM savings_accounts;
