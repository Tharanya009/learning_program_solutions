--Create the employees table
CREATE TABLE employees (
    emp_id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    department VARCHAR2(50),
    salary NUMBER
);

--Insert sample employee records
INSERT INTO employees VALUES (101, 'Karan', 'IT', 50000);
INSERT INTO employees VALUES (102, 'Leela', 'HR', 48000);
INSERT INTO employees VALUES (103, 'Manoj', 'IT', 55000);
INSERT INTO employees VALUES (104, 'Neha', 'Sales', 47000);
COMMIT;

--Enable output
SET SERVEROUTPUT ON;

--Create the stored procedure
CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
    dept_name IN VARCHAR2,
    bonus_percent IN NUMBER
) IS
BEGIN
    FOR emp IN (
        SELECT * FROM employees WHERE department = dept_name
    ) LOOP
        UPDATE employees
        SET salary = salary + (salary * bonus_percent / 100)
        WHERE emp_id = emp.emp_id;

        DBMS_OUTPUT.PUT_LINE('Bonus applied to: ' || emp.name || 
                             ' | New Salary: ' || TO_CHAR(emp.salary + (emp.salary * bonus_percent / 100), '99999.99'));
    END LOOP;
END;
/

--Call the procedure (apply 10% bonus to IT department)
BEGIN
    UpdateEmployeeBonus('IT', 10);
END;
/

--View updated employee table
SELECT * FROM employees;