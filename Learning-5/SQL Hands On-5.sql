-- Get Into Required Databse
Use DEMO;

-- View / Fetch Data
Select * From EMP;
Select * From EMP_SAL;

-- From EMP Table to Display

-- 1) EID NAME CITY DOJ DEPT DESI SALARY of the Delhi Employees 

-- First Way
Select EMP.EID, EMP.NAME, EMP.CITY, EMP_SAL.DOJ, EMP_SAL.DEPT, EMP_SAL.DESI, EMP_SAL.SALARY
From EMP
INNER JOIN EMP_SAL
ON EMP.EID = EMP_SAL.EID
Where CITY = 'Delhi';

-- Second Way
Select E1.EID, E1.NAME, E1.CITY, E2.DOJ, E2.DEPT, E2.DESI, E2.SALARY
From EMP E1
INNER JOIN EMP_SAL E2
ON E1.EID = E2.EID
Where CITY = 'Delhi';

-- Thired Way
Select EMP.EID, NAME, CITY, DOJ, DEPT, DESI, SALARY
From EMP
INNER JOIN EMP_SAL
ON EMP.EID = EMP_SAL.EID
Where CITY = 'Delhi';

-- 2) Details of All the Employees Whose SALARY Details are Not Available. 
Select EMP.EID,  NAME, DOJ, DEPT, DESI, SALARY 
From EMP
Left Join EMP_SAL
ON EMP.EID = EMP_SAL.EID;
