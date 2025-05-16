-- Switch to the Newly Created Database
Use TEST;

-- View the Records in the EMP and EMP_SAL Tables
Select * From EMP;
Select * From EMP_SAL;

 -- 1) Department Wise Team Size and Average Salary of All Employees

Select DEPT, 
       Count(EID) As TEAM_SIZE, 
	   AVG(SALARY) As AVERAGE_SALARY 
From EMP_SAL
Group By DEPT;

 -- 2) Count of Managers in the Company 
Select Count(DESI) As MANAGER_COUNT 
From EMP_SAL
Where DESI = 'Manager';

 -- 3) Maximum and Minimum Salary of an Associate
Select Max(SALARY) As MAX_SAL_ASSOCIATE,
       Min(SALARY) As MIN_SAL_ASSOCIATE
From EMP_SAL
Where DESI = 'Associate';

 -- 4) Department Wise Team Size and Average Salary of Delhi Employees
Select DEPT,
       Count(EMP.EID) As TEAM_SIZE,
	   Avg(SALARY) As AVERAGE_SALARY
From EMP
INNER JOIN EMP_SAL
ON EMP.EID = EMP_SAL.EID
Where CITY = 'Delhi'
Group By DEPT;

-- View the Records in the EMP
Select * From EMP;

 -- 5) Generate Official Email of the Employee Taking 1st Character of First Name, 1st Character of Last Name, Last 3 Digits of EID, Followed by 'RCG.COM'. Email Should be in Upper Case.
Select EID, NAME, CITY, PHONE, EMAIL,DOJ,
UPPER(Concat(LEFT(NAME, 1), SUBSTRING(RIGHT(NAME, Len(NAME) - CHARINDEX(' ', NAME)),1,1), RIGHT(EID, 3), '@RCG.com')) As OFFICIAL_EMAIL
From EMP;
 
 -- 6) NAME, CITY, PHONE & EMAIL of the Employees Whose Age >=40
Select NAME, CITY, PHONE, EMAIL, DATEDIFF(Year, DOB, GETDATE()) As AGE
From EMP
Where DATEDIFF(Year, DOB, GETDATE()) >= 40;

 -- 7) EID, NAME, DOJ of Employees Who Have Completed 5 Years in the Company
Select EID, NAME, DOJ, DATEDIFF(Year, DOJ, GETDATE()) As YEARS_COMPLETED
From EMP
Where DATEDIFF(Year, DOJ, GETDATE()) = 5;

 -- 8) Details of the Managers Having Birthday in the Current Month
Select EMP.EID, NAME, DOB, DEPT, DESI 
From EMP
INNER JOIN EMP_SAL
ON EMP.EID = EMP_SAL.EID
Where DESI = 'Manager' AND MONTH(DOB) = MONTH(GETDATE());

 -- 9) EID, DEPT, DESI, SALARY of the Employee Who is Getting the Maximum Salary
  -- First Way to Do
Select EID, DEPT, DESI, SALARY
From EMP_SAL
Order By (SALARY) DESC;

  -- Second Way to Do
Select EID, DEPT, DESI, SALARY
From EMP_SAL
Where SALARY = (Select MAX(SALARY) From EMP_SAL);

 -- 10) EID, NAME of Employee Who has Longest Name
  -- First Way to Do
Select EID, NAME, Len(NAME) As LENGTH_NAME
From EMP
Order By Len(NAME) DESC;

  -- Second Way to Do
Select EID, NAME, Len(NAME) As LENGTH_NAME
From EMP
Where Len(NAME) = (Select MAX(Len(NAME)) From EMP);


-- Correct Way to DO Q 9 And Q 10
-- 9) EID, DEPT, DESI, SALARY of the Employee Who is Getting the Maximum Salary
Select MAX(SALARY) From EMP_SAL;

Select EID, DEPT, DESI, SALARY From EMP_SAL
Where SALARY = 520000;

 -- 10) EID, NAME of Employee Who has Longest Name
Select MAX(LEN(NAME)) From EMP;

Select NAME From EMP
Where LEN(NAME) = 18;