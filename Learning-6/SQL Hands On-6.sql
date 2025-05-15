-- Create a New Database
Create Database TEST

-- Switch to the Newly Created Database
Use TEST;

-- Update the Data Types for Date Columns in the EMP Table
Alter Table EMP
Alter Column DOB Date;

Alter Table EMP
Alter Column DOJ Date;

-- View the Records in the EMP and EMP_SAL Tables
Select * From EMP;
Select * From EMP_SAL;

-- Assignment 6

 -- 1) Create the View for Employee Salarie Details
Create View EMP_SAL_DETAILS
As
Select EMP.EID, NAME, DOJ, DEPT, DESI, 
       SALARY As BASIC, 
       (SALARY*0.15) As HRA, 
       (SALARY*0.9) As PF, 
       (SALARY + SALARY*0.15 + SALARY*0.9) As NET, 
       ((SALARY + SALARY*0.15 + SALARY*0.9) - (SALARY*0.9)) AS GROSS
From EMP
INNER JOIN EMP_SAL
ON EMP.EID = EMP_SAL.EID;

 -- Display the Data in EMP_SAL_DETAILS View
Select * From EMP_SAL_DETAILS;

 -- 2) Create the View For Managers Details
Create VIEW Manager
As
Select EMP.EID, NAME, DOJ, DESI, DEPT 
From EMP
INNER JOIN EMP_SAL
ON EMP.EID = EMP_SAL.EID
Where DESI = 'Manager' AND Year(DOJ) = 2019;

 -- Display the Data in Manager View
Select * From Manager;

 -- 3) Create the VIEW TO How Many Team Members are There in Each Departments City wise, There Total & Average Salary
Create VIEW Team_Member_Count
As
Select CITY, DEPT,
       Count(EMP.EID) As TEAM_MEMBER, 
       Sum(SALARY) As TOTAL_SAL,
	   Avg(SALARY) As AVERAGE_SAL
From EMP
INNER JOIN EMP_SAL
ON EMP.EID = EMP_SAL.EID
Group By CITY, DEPT;

 -- Display the Data in Team_Member_Count View
Select * From Team_Member_Count;