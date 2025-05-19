-- Switch to the Requered Database
Use TEST;

-- View the Records in the EMP and EMP_SAL Tables
Select * From EMP;
Select * From EMP_SAL;

-- Assignment 9

 -- 1) EID, NAME, CITY of Gurgaon Employees
Select EID, NAME, CITY
From EMP
Where CITY = 'Gurgaon';

 -- 2) EID, NAME, DOJ, DEPT, DESI and SALARY of all Managers
Select EMP.EID, NAME, DOJ, DEPT, DESI, SALARY
From EMP
INNER JOIN EMP_SAL
ON EMP.EID = EMP_SAL.EID
Where DESI = 'Manager';

 -- 3) Reduce the SALARY of all Delhi Employees By 10%
Update EMP_SAL Set SALARY = SALARY - (SALARY * 0.10)
Where EID IN (Select EID From EMP Where CITY = 'Delhi');

Select * From EMP_SAL
Where EID IN (Select EID From EMP Where CITY = 'Delhi');

 -- 4) Display the EID, NAME, CITY, DOJ, DEPT, DESI and SALARY of the Team Members of David & Ramesh Gupta.
Select EMP.EID, NAME, CITY, DOJ, DEPT, DESI, SALARY
From EMP
INNER JOIN EMP_SAL
ON EMP.EID = EMP_SAL.EID
Where DEPT IN (Select DEPT From EMP_SAL 
               Where EID IN (SELECT EID From EMP Where NAME IN ('David', 'Ramesh Gupta')));

 -- 5) Create a Training Table Containing EID, NAME, DEPT. Insert the Details Of OPS Team Members in the Training Table.
  -- Creating TRAINING Table
Create Table TRAINING(
EID Char(5),
NAME VarChar(45),
DEPT VarChar(40)
);

  -- Inserting the Details of OPS Team Members in the TRAINING Table
Insert into TRAINING (EID, NAME, DEPT)
Select EMP.EID, NAME, DEPT
From EMP
INNER JOIN EMP_SAL
ON EMP.EID = EMP_SAL.EID
Where DEPT = 'OPS';

  -- View the Records in TRAINING Table
Select * From TRAINING;

 -- 6) Details of Directors Should be Deleted From the TRAINING Table
Delete FROM TRAINING 
Where EID IN (Select EID From EMP_SAL Where DESI = 'Director');

 -- View the Remaining Records in TRAINING Table
Select * From TRAINING;

 -- 7) Display the SALARY Details of all Employees. If any of the Team Members has SALARY More than 200000
Select EMP.EID, NAME, DOJ, DEPT, DESI, SALARY
From EMP
INNER JOIN EMP_SAL
ON EMP.EID = EMP_SAL.EID
Where EXISTS(Select * From EMP_SAL Where SALARY > 200000);