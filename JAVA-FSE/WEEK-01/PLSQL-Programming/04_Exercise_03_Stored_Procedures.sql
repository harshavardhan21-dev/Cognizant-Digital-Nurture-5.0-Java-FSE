USE cognizant_plsql;

DROP PROCEDURE IF EXISTS ProcessMonthlyInterest;

DELIMITER $$

CREATE PROCEDURE ProcessMonthlyInterest()
BEGIN
    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01)
    WHERE AccountType = 'Savings';
END $$

DELIMITER ;

CALL ProcessMonthlyInterest();

SELECT * FROM Accounts;



DROP PROCEDURE IF EXISTS UpdateEmployeeBonus;

DELIMITER $$

CREATE PROCEDURE UpdateEmployeeBonus(
    IN p_Department VARCHAR(50),
    IN p_BonusPercentage DECIMAL(5,2)
)
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * p_BonusPercentage / 100)
    WHERE Department = p_Department;
END $$

DELIMITER ;

CALL UpdateEmployeeBonus('IT', 10);

SELECT * FROM Employees;



DROP PROCEDURE IF EXISTS TransferFunds;

DELIMITER $$

CREATE PROCEDURE TransferFunds(
    IN p_FromAccount INT,
    IN p_ToAccount INT,
    IN p_Amount DECIMAL(10,2)
)
BEGIN
    DECLARE v_Balance DECIMAL(10,2);

    SELECT Balance
    INTO v_Balance
    FROM Accounts
    WHERE AccountID = p_FromAccount;

    IF v_Balance >= p_Amount THEN

        UPDATE Accounts
        SET Balance = Balance - p_Amount
        WHERE AccountID = p_FromAccount;

        UPDATE Accounts
        SET Balance = Balance + p_Amount
        WHERE AccountID = p_ToAccount;

        SELECT 'Fund Transfer Successful' AS Message;

    ELSE

        SELECT 'Insufficient Balance' AS Message;

    END IF;

END $$

DELIMITER ;

CALL TransferFunds(1, 2, 1000);

SELECT * FROM Accounts;