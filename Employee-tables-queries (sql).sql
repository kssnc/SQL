/*-Employee SQL Management Project 1. Table Creation-- Create Tables*/
CREATE TABLE Departments (    DeptID INT PRIMARY KEY,    DeptName VARCHAR(50) ); 

CREATE TABLE Employees (    EmpID INT PRIMARY KEY,    EmpName VARCHAR(100),    Gender CHAR(1),    Age INT,    DeptID INT,    JoinDate DATE,    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID) ); 

CREATE TABLE Salaries (    EmpID INT PRIMARY KEY,    BaseSalary DECIMAL(10, 2),    Bonus DECIMAL(10, 2),    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID) );  




/*2. Insert Data-- Insert Data */ 
INSERT INTO Departments VALUES (1, 'HR'), 
(2, 'IT'), 
(3, 'Finance');

 INSERT INTO Employees VALUES (101, 'Alice Johnson', 'F', 28, 1, '2022-03-15'), 
(102, 'Bob Smith', 'M', 35, 2, '2021-07-10'), 
(103, 'Charlie Brown', 'M', 40, 3, '2020-01-25'), 
(104, 'Diana Prince', 'F', 30, 2, '2023-01-05'); 

INSERT INTO Salaries VALUES (101, 50000.00, 3000.00),
(102, 65000.00, 4000.00),
(103, 70000.00, 5000.00), 
(104, 60000.00, 3500.00);




/*3. Sample Queries-- Sample SQL Queries--*/
/* 1. Show all employees*/
SELECT * FROM Employees; 

/*2. List names and ages*/
 SELECT EmpName, Age FROM Employees;

 /*-- 3. Find employees in the IT department*/
SELECT EmpName FROM Employees WHERE DeptID = 2;

/*-- 4. Employees older than 30 */
SELECT EmpName, Age FROM Employees WHERE Age > 30;

/*-- 5. Employee names and joining dates */
SELECT EmpName, JoinDate FROM Employees;

/*-- 6. Employees with department names*/
SELECT e.EmpName, d.DeptName FROM Employees e JOIN Departments d ON e.DeptID = d.DeptID;

/*-- 7. Total salary for each employee */
SELECT e.EmpName, s.BaseSalary + s.Bonus AS TotalSalary FROM Employees e JOIN Salaries s ON e.EmpID = s.EmpID;

/*-- 8. Average salary by department */ 
SELECT d.DeptName, AVG(s.BaseSalary) AS AvgSalary FROM Employees e JOIN Salaries s ON e.EmpID = s.EmpID JOIN Departments d ON e.DeptID = d.DeptID GROUP BY d.DeptName;

/*-- 9. Count employees by department */ SELECT d.DeptName, COUNT(*) AS EmployeeCount FROM Employees e JOIN Departments d ON e.DeptID = d.DeptID GROUP BY d.DeptName; 

/*-- 10. Highest paid employee*/ SELECT e.EmpName, s.BaseSalary + s.Bonus AS TotalSalary FROM Employees e JOIN Salaries s ON e.EmpID = s.EmpID ORDER BY TotalSalary DESC LIMIT 1;






















