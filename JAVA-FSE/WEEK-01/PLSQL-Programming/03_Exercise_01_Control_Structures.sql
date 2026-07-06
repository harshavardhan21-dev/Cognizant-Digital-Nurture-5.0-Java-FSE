USE cognizant_plsql;

DROP PROCEDURE IF EXISTS ApplySeniorDiscount;

DELIMITER $$

CREATE PROCEDURE ApplySeniorDiscount()
BEGIN
    UPDATE Loans l
    JOIN Customers c
        ON l.CustomerID = c.CustomerID
    SET l.InterestRate = l.InterestRate - 1
    WHERE TIMESTAMPDIFF(YEAR, c.DOB, CURDATE()) > 60;
END $$

DELIMITER ;

CALL ApplySeniorDiscount();

SELECT * FROM Loans;



DROP PROCEDURE IF EXISTS PromoteVIPCustomers;

DELIMITER $$

CREATE PROCEDURE PromoteVIPCustomers()
BEGIN
    UPDATE Customers
    SET IsVIP = TRUE
    WHERE Balance > 10000;
END $$

DELIMITER ;

CALL PromoteVIPCustomers();

SELECT CustomerID, Name, Balance, IsVIP
FROM Customers;



DROP PROCEDURE IF EXISTS LoanReminder;

DELIMITER $$

CREATE PROCEDURE LoanReminder()
BEGIN
    SELECT
        LoanID,
        CustomerID,
        LoanAmount,
        EndDate,
        'Loan is due within 30 days' AS Reminder
    FROM Loans
    WHERE EndDate BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY);
END $$

DELIMITER ;

CALL LoanReminder();