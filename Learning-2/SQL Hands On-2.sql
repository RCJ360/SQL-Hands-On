-- Get Connect to Required Database
Use DEMO;

-- Table Creation
Create Table EMP_SAL(
EID char(6),
DEPT VarChar(10),
DESI VarChar(20),
DOJ Date,
SALARY Int
);

-- Inserting Data/Records E.g.1
Insert Into EMP_SAL (EID, DEPT, DESI, DOJ, SALARY)
Values('E0001', 'HR', 'Manager', '15-June-2020', 75000);

-- Inserting Data/Records E.g.2
Insert Into EMP_SAL
Values('E0002', 'IT', 'Developer', '10-April-2018', 60000);

-- Inserting Data/Records E.g.3
Insert Into EMP_SAL (SALARY, EID, DESI, DEPT, DOJ)
Values(45000, 'E0003',  'Analyst', 'Finance', '20-Sep-2019');

-- Inserting Multiple Data/Records at a Time E.g.1
Insert Into EMP_SAL (EID, DEPT, DESI, DOJ, SALARY)
Values('E0004', 'Sales', 'Executive', '12-Jan-2021', 50000),
      ('E0005', 'IT', 'Tester', '18-March-2022', 52000);

-- Inserting Multiple Data/Records at a Time E.g.2
Insert Into EMP_SAL
Values('E0006', 'Marketing', 'Co-ordinator', '05-Dec-2019', 40000),
      ('E0007', 'HR', 'Assistant', '25-Oct-2022', 65000);

-- Verfying/View Data
Select * from EMP_SAL;

-- Increase the Salary in EMP_SAL Table of all Managers By 10% 
Update EMP_SAL
Set SALARY = SALARY + (SALARY * 0.10)
Where DESI = 'Manager';

-- Verfying Updated Data
Select * from EMP_SAL;

-- From EMP Table Fetch All Employees Records with Last Name is Sharma
Select * from EMP
Where NAME Like '%Sharma';