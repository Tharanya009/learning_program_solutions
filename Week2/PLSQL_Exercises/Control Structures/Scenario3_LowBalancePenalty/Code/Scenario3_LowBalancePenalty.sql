--Create the loans table
CREATE TABLE loans (
    loan_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(100),
    due_date DATE
);

-- Insert loan entries
-- Assuming today's date is 29-JUN-2025
INSERT INTO loans VALUES (501, 'Nina', SYSDATE + 15);   -- Due soon
INSERT INTO loans VALUES (502, 'Omar', SYSDATE + 40);   -- Not due soon
INSERT INTO loans VALUES (503, 'Priya', SYSDATE + 3);   -- Due very soon
INSERT INTO loans VALUES (504, 'Ravi', SYSDATE - 2);    -- Already overdue
COMMIT;

-- Enable DBMS output
SET SERVEROUTPUT ON;

-- PL/SQL block to send reminders
BEGIN
    FOR loan_rec IN (
        SELECT * FROM loans
        WHERE due_date BETWEEN SYSDATE AND SYSDATE + 30
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Reminder: Loan for ' || loan_rec.customer_name ||
                             ' is due on ' || TO_CHAR(loan_rec.due_date, 'DD-MON-YYYY'));
    END LOOP;
END;
/

-- View the loans table (optional)
SELECT * FROM loans;