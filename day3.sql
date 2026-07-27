USE college_db
-------------------------------------- Q1.Display all records from every table  ----------------------------------------------------
SELECT *FROM Users
SELECT *FROM Students
SELECT *FROM Faculties
SELECT *FROM Subjects
SELECT *FROM Attendances
SELECT *FROM Departments
SELECT *FROM Employee

INSERT INTO Students
(FirstName,LastName,Gender,Department,CGPA,Attendence,ContactNo)
VALUES
('PRAJAKTA', 'CHAVAN','F', 'AIDS', 8.5, 90.00, '6557994523'),
('SHRAVANI', 'VARUTE','F' ,'CSE', 8.0, 70.00, '6553568428'),
('RAJ', 'VARUTE', 'M','CSE', 8.0, 70.00, '9876462513'),
('PRANOTI', 'SHENDE','F', 'AIML', 8.0, 95.00, '9875462130'),
('PRANAV', 'SHENDE','M', 'CIVIL', 7.0, 80.00, '9989792223'),
('SAMRUDHHI', 'LOKARE','F','ENTC', 8.7, 98.00, '6587623158');

select *from Students

-------------------------------------  Q2.Display only distinct DepartmentID values from Students.------------------------------------

SELECT DISTINCT LastName FROM Students
SELECT DISTINCT FirstName, LastName FROM Faculties
SELECT DISTINCT SubjectId, CourseTitle FROM Subjects

---------------------------------------      Q3.Find all Female students         ------------------------------------------------------

SELECT * FROM Students WHERE Gender ='F'
SELECT *FROM Faculties WHERE Gender ='f'
SELECT *FROM Employee WHERE Gender ='m'

----------------------------------- Q4.Find students from DepartmentID = 1 AND Gender='Female'  -----------------------------------------

ALTER TABLE Students
add DepartmentId int 
SELECT *FROM Students

UPDATE Students 
SET DepartmentId =1,ModifyBy =101, ModifyOn =GETDATE()
WHERE StudentPrn =101;

UPDATE Students 
SET DepartmentId =2,ModifyBy =102,ModifyOn =GETDATE()
WHERE StudentPrn =102;

UPDATE Students 
SET DepartmentId =2,ModifyBy =103,ModifyOn =GETDATE()
WHERE StudentPrn =103;

UPDATE Students 
SET DepartmentId =3, ModifyBy= 104,ModifyOn= GETDATE()
WHERE StudentPrn =104;

UPDATE Students 
SET DepartmentId =1, ModifyBy= 105,ModifyOn= GETDATE()
WHERE StudentPrn =105;

UPDATE Students 
SET DepartmentId =3, ModifyBy= 106,ModifyOn= GETDATE()
WHERE StudentPrn =106;

UPDATE Students 
SET DepartmentId =1, ModifyBy= 107,ModifyOn= GETDATE()
WHERE StudentPrn =107;

UPDATE Students 
SET DepartmentId =2, ModifyBy= 108,ModifyOn= GETDATE()
WHERE StudentPrn =108;

UPDATE Students 
SET DepartmentId =1, ModifyBy= 109,ModifyOn= GETDATE()
WHERE StudentPrn =109;

UPDATE Students 
SET DepartmentId =4, ModifyBy= 110,ModifyOn= GETDATE()
WHERE StudentPrn =110;

UPDATE Students
SET Gender = 'F' WHERE StudentPrn =101

UPDATE Students
SET Gender = 'F' WHERE StudentPrn =102

UPDATE Students
SET Gender = 'F' WHERE StudentPrn =103

UPDATE Students
SET Gender = 'M' WHERE StudentPrn =104

SELECT *FROM Students WHERE DepartmentId =1 AND Gender ='F';

---------------------------  Q5.Find students from DepartmentID = 1 OR DepartmentID = 2 --------------------------------

SELECT *FROM Students WHERE  DepartmentId =1 OR DepartmentId=2

---------------------------  Q6.Display students whose Gender is NOT 'Male' --------------------------------------------

SELECT *FROM Students WHERE NOT Gender ='M'

---------------------------- Q7.Sort students by FirstName ascending and DOB descending  -------------------------------
ALTER TABLE Students
ADD DateOfBirth DATE

UPDATE Students 
SET DateOfBirth= '2005-03-23' WHERE StudentPrn=101;

UPDATE Students
SET DateOfBirth= '2008-04-21' WHERE StudentPrn=102;

UPDATE Students
SET DateOfBirth ='2000-12-12' WHERE StudentPrn=103;

UPDATE Students
SET DateOfBirth = '2000-09-23' WHERE StudentPrn = 104;

UPDATE Students 
SET DateOfBirth ='2004-08-17' WHERE StudentPrn =105;

UPDATE Students 
SET DateOfBirth ='2004-03-13' WHERE StudentPrn =106;

UPDATE Students  
SET DateOfBirth ='2006-04-21' WHERE StudentPrn =107;

UPDATE Students 
SET DateOfBirth ='2007-09-17' WHERE StudentPrn= 108;

UPDATE Students 
SET DateOfBirth ='2012-09-17' WHERE StudentPrn= 109;

UPDATE Students 
SET DateOfBirth ='2007-08-27' WHERE StudentPrn= 110;

SELECT *FROM Students 
ORDER BY FirstName               ---------------BY Ascending order

SELECT *FROM Students
ORDER BY DateOfBirth desc        -------------- By descending order

-------------------------------  Q8.Insert one new student into Students  --------------------------------------------

INSERT INTO Students
(FirstName,LastName,Gender,Department,CGPA,Attendence,ContactNo,
DepartmentId,ModifyBy,DateOfBirth)
VALUES
('PARTH','CHAVAN','M','CIVIL',7.5,80.0,'9864671356',1,111,'12-04-2008')
SELECT *FROM Students

UPDATE Students
SET ModifyOn = GETDATE() WHERE StudentPrn =111;

---------------------------  Q9.Insert one faculty member with NULL phone number --------------------------------------

INSERT INTO Faculties
(FirstName,LastName,Subjects,Email,Salary)
VALUES
('HEMALATA' ,'MAGDUM','OOP','hemalata10@gmail.com',800000) -- this gives us error because we declared phone as NOT NULL UNIQUE
SELECT *FROM Faculties

-------------------------------  Q10.Update the phone number of one student  ------------------------------------------

UPDATE Students
SET ContactNo ='8646287923',ModifyBy =110, ModifyOn = GETDATE()
WHERE StudentPrn = 110;

SELECT *FROM Students

------------------------------   Q11.Update Credits of one subject to 5   ----------------------------------------------

UPDATE Subjects
SET Credit =5 ,ModifyBy =4 ,ModifyOn=GETDATE()
WHERE SubjectId= 4;

SELECT *FROM Subjects;

-----------------------------   Q12.Delete the attendance record of StudentPrn =104  -------------------------------------

DELETE FROM Attendances where StudentPrn =104
SELECT *FROM Attendances

-----------------------------   Q13.Display TOP 3 students ordered by StudentID   --------------------------------------

SELECT TOP 3* From Students 
ORDER BY StudentPrn

-----------------------------  Q14. Find total number of students using COUNT()  ----------------------------------------

SELECT COUNT(*) FROM Students

-----------------------------  Q15. Find MIN and MAX Credits from Subjects  ----------------------------------------

SELECT MIN(Credit) FROM Subjects
SELECT MAX(Credit) FROM Subjects

---------------------------- Q16. Find SUM of Credits of all subjects.-----------------------------------------------

SELECT SUM(Credit) FROM Subjects

----------------------------  Q17. Find AVG Credits of all subjects.  -----------------------------------------------

SELECT AVG(Credit) FROM Subjects

-----------------  Q18. Display students whose FirstName starts with 'S' using LIKE.  -------------------

SELECT *FROM Students WHERE FirstName LIKE'S%'

----------------------  Q19. Display students whose Email ends with 'gmail.com'.  ------------------------------

ALTER TABLE Students
ADD Email NVARCHAR(50)

UPDATE Students
SET Email = 'diksh@gmail.com' where StudentPrn =101

UPDATE Students
SET Email = 'gouri@gmail.com' where StudentPrn =102

UPDATE Students
SET Email = 'neha@gmail.com' where StudentPrn =103

UPDATE Students
SET Email = 'ramyahoo.com' where StudentPrn =104

UPDATE Students
SET Email = 'prajakta@gmail.com' where StudentPrn =105

UPDATE Students
SET Email = 'shravani@gmail.com' where StudentPrn =106

UPDATE Students
SET Email = 'rajyahoo.com' where StudentPrn =107

UPDATE Students
SET Email = 'pranoti@gmail.com' where StudentPrn =108

UPDATE Students
SET Email = 'pranavyahoo.com' where StudentPrn =109

UPDATE Students
SET Email = 'samruddhi@gmail.com' where StudentPrn =110

UPDATE Students
SET Email = 'dparthyahoo.com' where StudentPrn =111

SELECT *FROM Students WHERE Email LIKE '%gmail.com'

---------------------  Q20. Write a query using WHERE, AND, ORDER BY together.  ---------------------

SELECT *FROM Students WHERE DepartmentId =1 AND Gender ='F' ORDER BY StudentPrn Asc