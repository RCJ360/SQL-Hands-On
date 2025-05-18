-- Switch to the Requered Database
Use TEST;

-- View the Records in the EMP and EMP_SAL Tables
Select * From EMP;
Select * From EMP_SAL;

-- Assignment 8

 -- 1) Create a Function CALC to Perform The Specified Operation on the Given Two Numbers.
Create Function CALC (@A As Int, @B As Int, @D As Char(1))
Returns Int
As
BEGIN
       Declare @C As Int;
	   If @D = '+'
	         Set @C = @A + @B;
	   Else If @D = '-'
	         Set @C = @A - @B;
	   Else If @D = '*'
	         Set @C = @A * @B;
	   Else If @D = '/'
	         Set @C = @A / @B;
	   Else If @D = '%'
	         Set @C = @A % @B;
	   Else 
	         Set @C = 0;
	   Return @C;
END;
 -- Perform Addition of Two Numbers
Select DBO.CALC(65, 25, '+') As Addition;

 -- Perform Subtraction of Two Numbers
Select DBO.CALC(65, 25, '-') As Subtraction;

 -- Perform Product of Two Numbers
Select DBO.CALC(65, 25, '*') As Product;

 -- Perform Division of Two Numbers
Select DBO.CALC(65, 25, '/') As Division;

 -- Perform Remainder of Two Numbers
Select DBO.CALC(65, 25, '%') As Remainder;

 -- 2) Function to Generate the EMAIL ID by Accepting NAME & EID. EMAIL Should Contain 1st Character of 1st NAME, 1st Character of Last NAME, Last 3 Digits of EMP ID Followed By @RCG.COM
Create Function OMAIL (@ID As Char(5), @N As VarChar(50), @D As VarChar(50))
Returns VarChar(100)
As
BEGIN 
	Declare @EM As VarChar(100);
	Declare @L As Int;
	Declare @S As Int;
	Declare @LN As VarChar(20);

	Set @L = LEN(@N);
	Set @S = CHARINDEX(' ', @N);
	Set @LN = RIGHT(@N, @L- @S);

	Set @EM= UPPER(CONCAT(LEFT (@N, 1), LEFT (@LN, 1), RIGHT (@ID, 4), '@', @D, '.COM'));

	Return @EM;
END;
 
 -- Verification of the Function is Working Properly
SELECT DBO.OMAIL('E0001', 'Rupak Jogi', 'RCG');

 -- Applying Function on EMP Table
Select EID, NAME, DBO.OMAIL(EID, NAME, 'RCG') AS 'OFFICIAL_EMAIL'
FROM EMP;

 -- 3) Function To Return EID, NAME, DESI, DEPT, SALARY of the Employees af a Specified Department.
Create Function EMPDEPT (@D As VarChar(50))
Returns Table
As
        Return(Select EMP.EID, NAME, DESI, DEPT, SALARY
		From EMP
		INNER JOIN EMP_SAL
		ON EMP.EID = EMP_SAL.EID
		Where DEPT = @D); 

 -- Verification of the EMPDEPT Function
Select * From  DBO.EMPDEPT('OPS');

 -- 4) Function to Display the NAME, DEPT, DESI, CITY of the Employees Who Have the Birthday in the Current Month.
Create Function EMPBIRTHM (@BM As Int)
Returns Table
As
        Return(Select EMP.EID, NAME, DEPT, DESI, CITY
		From EMP
		INNER JOIN EMP_SAL
		ON EMP.EID = EMP_SAL.EID
		Where Month(DOB) = @BM);

 -- Verification of the EMPBIRTHM Function
Select * From  DBO.EMPBIRTHM(7);

 -- 5) Function to Display the NAME, DEPT and DOJ of Employees Who Have Completed 5 Years in the Company.
Create Function EMPCY (@CY As Int)
Returns Table
As
        Return(Select EMP.EID, NAME, DEPT,DOJ, DATEDIFF(Year, DOJ, GETDATE()) As YEARS_COMPLETED
		From EMP
		INNER JOIN EMP_SAL
		ON EMP.EID = EMP_SAL.EID
		Where DATEDIFF(Year, DOJ, GETDATE()) = @CY);

 -- Verification of the EMPBIRTHM Function
Select * From  DBO.EMPCY(5);