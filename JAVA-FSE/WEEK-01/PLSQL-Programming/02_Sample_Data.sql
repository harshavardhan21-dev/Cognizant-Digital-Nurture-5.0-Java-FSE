USE cognizant_plsql;

INSERT INTO Customers VALUES
(1, 'John Doe', '1955-05-15', 15000.00, CURDATE(), FALSE),
(2, 'Jane Smith', '1990-07-20', 8000.00, CURDATE(), FALSE),
(3, 'Robert King', '1960-08-10', 12000.00, CURDATE(), FALSE);

INSERT INTO Accounts VALUES
(1, 1, 'Savings', 15000.00, CURDATE()),
(2, 2, 'Checking', 8000.00, CURDATE()),
(3, 3, 'Savings', 12000.00, CURDATE());

INSERT INTO Transactions VALUES
(1, 1, CURDATE(), 200.00, 'Deposit'),
(2, 2, CURDATE(), 300.00, 'Withdrawal');

INSERT INTO Loans VALUES
(1, 1, 5000.00, 5.00, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 20 DAY)),
(2, 2, 8000.00, 7.00, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 60 DAY)),
(3, 3, 4000.00, 6.00, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 15 DAY));

INSERT INTO Employees VALUES
(1, 'Alice Johnson', 'Manager', 70000.00, 'HR', '2015-06-15'),
(2, 'Bob Brown', 'Developer', 60000.00, 'IT', '2017-03-20');

SELECT * FROM Customers;
SELECT * FROM Accounts;
SELECT * FROM Transactions;
SELECT * FROM Loans;
SELECT * FROM Employees;