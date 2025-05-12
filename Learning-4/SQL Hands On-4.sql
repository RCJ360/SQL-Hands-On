-- Set Database Context to DEMO
Use DEMO;

-- View the Data
Select * From EMP;
Select * From EMP_SAL;

-- From EMP Table to Display

-- 1) City Wise Count of Employees Arranged in Descending Order
Select CITY, Count(EID) As EMPLOYESS_COUNT 
From EMP
Group By CITY
Order By EMPLOYESS_COUNT DESC;

-- 2) Details of the Employess Who Does Not Have An Account on YAHOO Domain
Select * From EMP
Where EMAIL NOT LIKE ('%@yahoo.%');

-- From EMP_SAL Table to Display

-- 1) Desiganation Wise Totla Cost and Number of Members Arranged in Descending Order of the Totla Cost
Select DESI, Sum(SALARY) As TOTAL_COST, Count(EID) As Number_of_MEMBERS
From EMP_SAL
Group By DESI
Order By TOTAL_COST DESC;