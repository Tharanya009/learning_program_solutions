--Drop the table if it already exists
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE bank_accounts';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

--Create the bank_accounts table
CREATE TABLE bank_accounts (
    account_id NUMBER PRIMARY KEY,
    account_holder VARCHAR2(100),
    balance NUMBER
);

--Insert sample accounts
INSERT INTO bank_accounts VALUES (201, 'Arun', 8000);
INSERT INTO bank_accounts VALUES (202, 'Bhavna', 15000);
INSERT INTO bank_accounts VALUES (203, 'Chetan', 3000);
INSERT INTO bank_accounts VALUES (204, 'Diya', 12000);
COMMIT;

--Enable output
SET SERVEROUTPUT ON;

--Create the stored procedure for fund transfer
CREATE OR REPLACE PROCEDURE TransferFunds (
    from_acc_id IN NUMBER,
    to_acc_id IN NUMBER,
    amount IN NUMBER
) IS
    from_balance NUMBER;
BEGIN
    SELECT balance INTO from_balance FROM bank_accounts WHERE account_id = from_acc_id;

    IF from_balance < amount THEN
        DBMS_OUTPUT.PUT_LINE('Transfer failed: Insufficient funds in account ' || from_acc_id);
    ELSE
        UPDATE bank_accounts
        SET balance = balance - amount
        WHERE account_id = from_acc_id;

        UPDATE bank_accounts
        SET balance = balance + amount
        WHERE account_id = to_acc_id;

        DBMS_OUTPUT.PUT_LINE('Transfer of ' || amount || ' from account ' || from_acc_id ||
                             ' to account ' || to_acc_id || ' completed successfully.');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('One or both account IDs not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
/

--Test the procedure
BEGIN
    TransferFunds(201, 204, 5000);
END;
/

--Check final account balances
SELECT * FROM bank_accounts;