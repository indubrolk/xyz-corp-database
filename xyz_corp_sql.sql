-- 1. Create database "XYZ_Corp"
CREATE DATABASE XYZ_Corp;
USE XYZ_Corp;

-- 2. Create the Employee and Project tables
CREATE TABLE Employee (
    Emp_id VARCHAR(10) PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

CREATE TABLE Project (
    Project_id INT PRIMARY KEY,
    Project_name VARCHAR(100),
    Emp_id VARCHAR(10),
    FOREIGN KEY (Emp_id) REFERENCES Employee(Emp_id)
);

-- 3. Insert data into the tables
INSERT INTO Employee (Emp_id, First_name, Last_name, Department, Salary) VALUES
('E01', 'Alice', 'Brown', 'HR', 60000),
('E02', 'Bob', 'Smith', 'IT', 75000),
('E03', 'Charlie', 'Johnson', 'Finance', 80000),
('E04', 'Diana', 'Clark', 'IT', 72000),
('E05', 'Eva', 'Lewis', 'HR', 50000);

INSERT INTO Project (Project_id, Project_name, Emp_id) VALUES
(101, 'Payroll System', 'E03'),
(102, 'Recruitment Portal', 'E01'),
(103, 'Website Redesign', 'E02'),
(104, 'Mobile App Development', 'E04'),
(105, 'Employee Handbook', NULL);

-- 4. Display all Employee names whose salary is above 70000
SELECT First_name, Last_name 
FROM Employee 
WHERE Salary > 70000;

-- 5. Display Employee first name and last name from HR department
SELECT First_name, Last_name 
FROM Employee 
WHERE Department = 'HR';

-- 6. List employee first names and salaries in ascending order of salaries
SELECT First_name, Salary 
FROM Employee 
ORDER BY Salary ASC;

-- 7. Find the average salary of all employees
SELECT AVG(Salary) AS Average_Salary 
FROM Employee;

-- 8. Display employee's first name, last name and project names using INNER JOIN
SELECT e.First_name, e.Last_name, p.Project_name
FROM Employee e
INNER JOIN Project p ON e.Emp_id = p.Emp_id;

-- 9. Add new employee John Doe
INSERT INTO Employee (Emp_id, First_name, Last_name, Department, Salary) 
VALUES ('E06', 'John', 'Doe', 'Finance', 85000);

-- 10. Add Age column and update with values
ALTER TABLE Employee 
ADD COLUMN Age INT;

UPDATE Employee SET Age = 40 WHERE Emp_id = 'E01';
UPDATE Employee SET Age = 35 WHERE Emp_id = 'E02';
UPDATE Employee SET Age = 40 WHERE Emp_id = 'E03';
UPDATE Employee SET Age = 28 WHERE Emp_id = 'E04';
UPDATE Employee SET Age = 30 WHERE Emp_id = 'E05';
UPDATE Employee SET Age = 52 WHERE Emp_id = 'E06';

-- 11. Display Employee ids where age is between 30 to 40
SELECT Emp_id 
FROM Employee 
WHERE Age BETWEEN 30 AND 40;

-- 12. Update department to "Finance" where Emp_id is "E04"
UPDATE Employee 
SET Department = 'Finance' 
WHERE Emp_id = 'E04';

-- 13. Delete row from project table where Project_id is "104"
DELETE FROM Project 
WHERE Project_id = 104;

-- 14. Join Project_id and Project_name and display in a column named "Project"
SELECT CONCAT(Project_id, ' - ', Project_name) AS Project 
FROM Project;