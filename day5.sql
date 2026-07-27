use college_db

--------------------------------------    1 Create Student and Department tables  -------------------------------------------
CREATE TABLE Student(
	Prn INT PRIMARY KEY IDENTITY(101, 1),
	FirstName NVARCHAR(100) NOT NULL,
	LastName NVARCHAR (100) NOT NULL,
	Gender NVARCHAR(10),
	DateOfBirth DATE,
	DepartmentId INT ,
	Email NVARCHAR(50) NOT NULL UNIQUE,
	ContactNo NVARCHAR(10) NOT NULL,
	CreatedBy INT,
	CreatedON DATETIME ,
	IsActive BIT NOT NULL Default 1,

	FOREIGN KEY (DepartmentId)
	REFERENCES Department(DepartmentId),

); 

CREATE TABLE Department(
	DepartmentId INT PRIMARY KEY IDENTITY(1, 1),
	DepartmentName NVARCHAR(100),
	DepartmentCode NVARCHAR (50) ,
	CreatedBy INT ,
	CreatedOn DATETIME
);
SELECT *FROM Department
SELECT *FROM Student 

-------------------------------------    2 Insert at least 10 students and 5 departments   -----------------------------------
INSERT INTO Department
(DepartmentName,DepartmentCode,CreatedBy ,CreatedOn)
VALUES
('Artificial Intelligence & Data Science','AIDS',1,GETDATE()),
('Computer Science Engineering','CSE',2,GETDATE()),
('Mechanical Engineering','ME',3,GETDATE()),
('Civil Engineering','CE',4,GETDATE()),
('Electrical Engineering','EE',5,GETDATE());

INSERT INTO Student 
(FirstName,LastName,Gender,DateOfBirth,DepartmentId,Email,ContactNo,CreatedBy,CreatedON)
VALUES
('Rahul','Patil','M','2005-02-10',1,'rahul@gmail.com','9876500001',101, GETDATE()),
('Priya','Shinde','F','2004-08-15',2,'priya@yahoo.com','9876500002',102, GETDATE()),
('Aniket','Jadhav','M','2005-01-12',3,'aniket@gmail.com','9876500003',103, GETDATE()),
('Sneha','Kadam','F','2004-11-20',4,'sneha@student.com','9876500004',104,GETDATE()),
('Prajakta','Chavan','F','2006-03-18',5,'prajakta@gmail.com','9568973132',105,GETDATE());
INSERT INTO Student 
(FirstName,LastName,Gender,DateOfBirth,Email,ContactNo,CreatedBy,CreatedON)
VALUES
('Diksha','Ghatte','F', '2006-03-21','diksha@yahoo.com','546213946',106,GETDATE()),
('Gouri','Hattarki','F','2005- 09-15','gouri@yahoo.com','9683647909',107,GETDATE()),
('Neha','Bera','F','2008- 08-17','neha@gmail.com','649793158',108, GETDATE()),
('Shekhar', 'Chavan','M','2000-05-05','shekhar@gmail.com','9867451313', 109, GETDATE()),
('Nirmala', 'Chavan','F','2001-05-29','nirmala@gmail.com','9867451314', 110, GETDATE());

---------------------------    3 Write an INNER JOIN showing StudentName and DepartmentName.   ------------------------------

SELECT S.FirstName,S.LastName, D.DepartmentName From Student S
INNER JOIN Department D on S.DepartmentId =D.DepartmentId

--------------------------    4 Write a LEFT JOIN and identify students without departments.    -----------------------------

SELECT S.FirstName,S.LastName, D.DepartmentName From Student S
LEFT JOIN Department D on S.DepartmentId =D.DepartmentId WHERE S.DepartmentId is null

-------------------------     5 Write a RIGHT JOIN and identify departments without students.  -------------------------------

SELECT S.FirstName,S.LastName, D.DepartmentName From Student S
RIGHT JOIN Department D on S.DepartmentId =D.DepartmentId WHERE S.DepartmentId is null

------------------------    6 Write a FULL OUTER JOIN showing all students and departments.     -------------------------------

SELECT  S.FirstName,S.LastName, D.DepartmentName From Student S      
FULL OUTER JOIN Department D on S.DepartmentId =D.DepartmentId

------------------------    7 Count students in each department.  ------------------------------------------------------------

SELECT COUNT(*)as TotalStudent FROM  Student where DepartmentId =1
SELECT COUNT(*)as TotalStudent FROM  Student where DepartmentId =2
SELECT COUNT(*)as TotalStudent FROM  Student where DepartmentId =3
SELECT COUNT(*)as TotalStudent FROM  Student where DepartmentId =4
SELECT COUNT(*)as TotalStudent FROM  Student where DepartmentId =5

-----------------------  8 Find departments with zero students.   ------------------------------------------------------------

SELECT COUNT(*) AS TotalStudent FROM Student WHERE DepartmentId is null

-----------------------  9 Allow NULL DepartmentID and observe join results. -------------------------------------------------

SELECT S.FirstName,S.LastName, D.DepartmentName From Student S
left JOIN Department D on S.DepartmentId =D.DepartmentId where s.departmentid is null


-------------  10 Explain the difference between INNER, LEFT, RIGHT and FULL OUTER JOIN in your own words.--------------------

--INNER JOIN - combines two tables based on there related column and disply comman data
--LEFT JOIN - combines two tables based on there related column and display comman data & also display the all data in left table
--RIGHT JOIN - combines two tables based on there related column and display comman data & also display the all data in right table
--FULL OUTER JOIN - combines two table and display all data in both column
