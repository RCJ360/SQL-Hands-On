-- Creation of New Database
Create Database DEMO;

-- Get Into Required Database
Use DEMO;

-- Table Creation
Create Table EMP(
EID char(6),
NAME Varchar(30),
ADDR VarChar(40),
CITY VarChar(25),
DOB Date,
PHONE_NO Char(15),
EMAIL VarChar(30)
);

-- Inserting Data/Records E.g.1
Insert into EMP (EID, NAME, ADDR, CITY, DOB, PHONE_NO, EMAIL)
Values('E0001', 'Ramesh Jogi', 'Hanuman Nagaer, Hidu Road', 'Jalgaon', '19-June-1945', '8954253149', 'ramesh001@gmail.com');

-- Inserting Data/Records E.g.2
Insert into EMP
Values('E0002', 'Amit Kumar','123 Green Street', 'Patna', '12-May-1990', '9742165461', 'amit.kumar@gmail.com');

-- Inserting Data/Records at a Time E.g.3
Insert into EMP (EID, PHONE_NO, DOB, NAME, ADDR, CITY,  EMAIL)
Values('E0003', '7540007567', '10-Oct-1997', 'Pooja Reddy', '456 Pine Street', 'Hyderabad', 'reddy007@gmail.com');

-- Inserting Multiple Data/Records at a Time E.g.1
Insert into EMP
Values('E0004', 'Neha Sharma', '456 Rose Avenue', 'Mumbai', '23-Dec-1988', '6894244862', 'nehasharma42@gmail.com'),
      ('E0005', 'Ravi Verma', '789 Hill Road', 'Bangalore', '07-April-1995', '9954876483', 'verma789@gmail.com'),
      ('E0006', 'Priya Kapoor', '101 Maple Lane', 'Delhi', '15-July-1992', '6942347855', 'kapoor.priya@gmail.com'),
      ('E0007', 'Suresh Gupta', '102 Ocen Drive', 'Chennai', '01-Nov-1985', '9854698885', 'sureshgupta@gmail.com');

-- Inserting Multiple Data/Records at a Time E.g.2
Insert into EMP (EID, NAME, ADDR, CITY, DOB, PHONE_NO, EMAIL)
Values('E0008', 'Rohit Malhotra', '105 Elm Avenue', 'Jaipur', '25-June-1993', '6234589723', 'rohit.malhotra@gmail.com'),
      ('E0009', 'Alok Mishra', 'Lane 56 Sunset Boulevard', 'Kolkata', '19-Feb-1989', '9726481354', 'alokmishra89@gmail.com'),
      ('E0010', 'Divya Desai', '106 Lakeview Terrace', 'Pune', '30-Aug-1996', '9655223311', 'ddesai20@gmail.com');

-- Verfying/Fetch Data
Select * from EMP;