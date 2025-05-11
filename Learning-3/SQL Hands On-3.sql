-- Switch to the DEMO Database
Use DEMO;

-- View Data in EMP Table 
Select * from EMP;

-- View Data in EMP_SAL Table
Select * from EMP_SAL;

-- Applying Constraints on EMP Table

-- 1) Applying Primary Key Constraints on the EID Field
Alter Table EMP
Alter Column EID Char(5) Not Null;
Alter Table EMP
Add Constraint PK Primary Key(EID);

-- 2) Applying Not Null Constraints on the Name Field
Alter Table EMP
Alter Column NAME Varchar(30) Not Null;

-- 3) Applying Check Constraints on the ADDR Field to Ignore Specific Street/Area
Alter Table EMP
Add Constraint C1 Check (ADDR Not Like '%Uttam%Nagar%');

-- 4) Applying Check Constraints on the CITY Field for Specific Cities
Alter Table EMP
Add Constraint C2 Check (CITY IN ('Delhi', 'Gurgaon', 'Faridabad', 'Noida', 'Mumbai', 'Pune', 'Bangalore'));

-- Verfying/View EMP Table
Select * from EMP;

-- Resolving Conflict for C2 [EMP (4)]
Update EMP Set CITY = 'Delhi'
Where CITY = 'Jalgaon';

Update EMP Set CITY = 'Gurgaon'
Where CITY = 'Hyderabad';

Update EMP Set CITY = 'Mumbai'
Where CITY = 'Patna';

Update EMP Set CITY = 'Faridabad'
Where CITY = 'Chennai';

Update EMP Set CITY = 'Noida'
Where CITY = 'Jaipur';

Update EMP Set CITY = 'Bangalore'
Where CITY = 'Kolkata';

-- 5) Applying UNIQUE Constraints on the PHPNE_NO Field
Alter Table EMP
Add Constraint U1 Unique (PHONE_NO);

-- 6) Applying Check Constraints on the EMAIL Field for Specific Domain
Alter Table EMP
Add Constraint C3 Check (EMAIL Like '%gmail.%' OR EMAIL Like '%yahoo.%');

-- 7) Applying Check Constraints on the DOB Field 
Alter Table EMP
Add Constraint C4 Check (DOB <= '01-Jan-2000');


-- Applying Constraints on EMP_SAL Table

-- 1) Applying Foreign Key Constraints on the EID Field To Set Child and Parent Relationship
Alter Table EMP_SAL
Add Constraint FK1 Foreign Key (EID) References EMP(EID);

-- 2) Applying Check Constraints on the DEPT Field To Allow Specific Department Only
Alter Table EMP_SAL
Add Constraint C5 Check (DEPT IN ('HR', 'MIS', 'OPS', 'IT ADMIN', 'TEMP'));

-- 3) Applying Default Constraints on the DEPT Field To Filed with TEMP By Defalut
Alter Table EMP_SAL
Add Constraint D1 Default 'TEMP' For DEPT;

-- Verfying/View EMP Table
Select * from EMP_SAL;

-- Resolving Conflict for C5 [EMP_SAL (2)]
Update EMP_SAL Set DEPT = 'IT ADMIN'
Where DEPT = 'IT';

Update EMP_SAL Set DEPT = 'OPS'
Where DEPT = 'Finance';

Update EMP_SAL Set DEPT = 'MIS'
Where DEPT = 'Sales';

Update EMP_SAL Set DEPT = 'TEMP'
Where DEPT = 'Marketing';

-- 4) Applying Check Constraints on the DESI Field To Allow Specific Designation Only
Alter Table EMP_SAL
Add Constraint C6 Check (DESI IN ('Associate', 'Manager', 'VP', 'Director'));

-- Verfying/View EMP Table
Select * from EMP_SAL;

-- Resolving Conflict for C5 [EMP_SAL (4)]
Update EMP_SAL Set DESI = 'Associate'
Where DESI = 'Analyst';

Update EMP_SAL Set DESI = 'VP'
Where DESI = 'Developer';

Update EMP_SAL Set DESI = 'Director'
Where DESI = 'Assistant';

Update EMP_SAL Set DESI = 'VP'
Where DESI = 'Executive';

Update EMP_SAL Set DESI = 'Manager'
Where DESI = 'Tester';

Update EMP_SAL Set DESI = 'Associate'
Where DESI = 'Co-ordinator';

-- 5) Applying Check Constraints on the BASIC_SAL Field
Alter Table EMP_SAL
Add Constraint C7 Check (BASIC_SAL >= 20000);

-- Verfying/View EMP Table
Select * from EMP_SAL;

-- Resolving Conflict for C7 [EMP_SAL (5)]
Alter Table EMP_SAL
Add BASIC_SAL Int;

Update EMP_SAL Set BASIC_SAL = SALARY * 0.50;

-- Verfying/Fetch Data
Select * from EMP;
Select * from EMP_sal;