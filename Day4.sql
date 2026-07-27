use college_db

--------------------------  Q21. Display students whose FirstName contains exactly 5 characters.--------------------

SELECT *FROM Students WHERE FirstName LIKE '_____'
					--OR
SELECT *FROM Students WHERE LEN(FirstName)= 5

--------------------------- - Q22. Display students whose Email does not contain 'gmail.com'.-----------------------

SELECT *FROM Students WHERE Email NOT LIKE '%gmail.com'

-------------- Q23. Update all students of DepartmentID=2 by appending(add something at the end of the existing )'-A' to Phone.----------------
UPDATE Students 
SET ContactNo = ContactNo + '-A'
WHERE DepartmentId =1
SELECT *FROM Students

------------------------------   Q24. Delete students whose Email is NULL. -----------------------------------------

DELETE FROM Students WHERE Email = null   --use isactive
SELECT *FROM Students

-----------------------------------   Q25. Display TOP 5 youngest students  ----------------------------------------

SELECT TOP 5 *FROM Students ORDER BY DateOfBirth DESC

---------------------------------- Q26. Find total credits only for subjects with Credits > 3.----------------------

SELECT SUM(Credit)AS TotalCredits FROM Subjects WHERE Credit >3    --- totalCredit is an alias sql means is a temparory name given to the column or table to  make the o/p easier to  read

-------------------   27. Count students in DepartmentID=1.    --------------------------------------------

SELECT COUNT(*) AS TotalStudents FROM Students  WHERE DepartmentId =1

-------------------   Q28. Display students whose DOB is between '2003-01-01' and '2005-12-31'.------------------------------------

SELECT *FROM Students WHERE DateOfBirth BETWEEN '2003-01-01' and '2005-12-31'

------------------  Q29. Find students whose FirstName starts with A, M, or S.-----------------------------------------------

SELECT *FROM Students WHERE FirstName Like 'A%' OR FirstName LIKE 'M%' OR FirstName LIKE 'S%'

-------------------  Q30. Update Email domain from yahoo.com to gmail.com for all matching students.  ---------------------------------

UPDATE Students 
SET Email = REPLACE (Email , 'yahoo.com', '@gmail.com')
WHERE Email Like '%yahoo.com'   --(%) this means any num of char before yahoo.com
SELECT *FROM Students

------------------    Q31. Delete attendance records where Status='Absent'.   ------------------------------------------

DELETE FROM Attendances WHERE Status = 'Absent'
SELECT *FROM Attendances                          --use isactive

-----------------------------   Q32. Find average credits excluding subjects with Credits=0   -------------------------

SELECT AVG(Credit) as AverageStudent from Subjects WHERE Credit <> 0   for excluding

-------------------   Q33. Display students sorted by DepartmentID ascending and LastName descending. ---------------------

SELECT *FROM Students 
ORDER BY DepartmentId asc , LastName desc

----------------------------  Q34. Insert three new students using a single INSERT statement. -----------------------------
ALTER TABLE Students 
ADD CreatedBy int ,
CreatedOn DATETIME;

INSERT INTO Students 
(FirstName ,LastName, Gender, Department, CGPA, Attendence ,ContactNo,DepartmentId, DateOfBirth, Email, CreatedBy, CreatedOn)
VALUES
('PURVA', 'CHAVAN', 'F', 'AIML',9.0,90.00,'9895623797', 4,'2008- 05-03', 'purva@gmail.com', 112, GETDATE()),
('SNEHA', 'BERA', 'F', 'AIDS',7.0,80.00,'9895623456', 3,'2009- 06-13', 'sneha@gmail.com', 113, GETDATE()),
('DIGAMBER', 'CHAVAN', 'M', 'ENTC',8.0,80.50,'9006503797', 4,'2002- 09-23', 'digamber@gmail.com', 113, GETDATE());

SELECT *FROM Students

-----------------------------  Q35. Write a query combining WHERE, LIKE, AND, OR, ORDER BY, and TOP.--------------------

SELECT TOP 4* FROM Students WHERE (FirstName Like 'P%' OR FirstName Like 'S%') AND DepartmentId =1 ORDER BY StudentPrn ASC