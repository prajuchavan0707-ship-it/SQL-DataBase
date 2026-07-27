USE college_db

--IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Users') --- FOR CHECKING A TABLE IS EXIT OR NOT IN DATA BASE
----------------------------------------------        USER TABLE       --------------------------------------------------------------------------
--BEGIN
CREATE TABLE Users
(
	UserId INT PRIMARY KEY IDENTITY(1,1),

	FirstName NVARCHAR(100) NOT NULL,
	LastName NVARCHAR(100) NOT NULL,
	UserName NVARCHAR (50) NOT NULL UNIQUE,
	Email NVARCHAR (50) NOT NULL UNIQUE,
    PassWord NVARCHAR (50) NOT NULL
)
--END
SELECT * FROM Users;

INSERT INTO Users 
(FirstName, LastName, UserName, Email, PassWord)
VALUES
('PRAJAKTA', 'CHAVAN', 'PRAJU', 'praju201@gmail.com', 'prajakta123' ),
('PRANOTI', 'SHENDE', 'PRANOTI', 'pranoti201@gmail.com', 'pranoti123' ),
('NEHA', 'BERA', 'NEHA', 'neha@gmail.com', 'neha203' ),
('Shravani', 'Varute', 'Shrauu', 'shravani@gmail.com', 'shravani213' );

SELECT * FROM Users;

-------------------------------------------------  STUDENT TABLE    ---------------------------------------------------------------------
CREATE TABLE Students
(
	StudentPrn INT PRIMARY KEY IDENTITY(101, 1),

	FirstName NVARCHAR(100) NOT NULL,
	LastName NVARCHAR(100) NOT NULL,
	Gender NVARCHAR(10) NOT NULL,
	StdDept NVARCHAR(100) NOT NULL,
	StdCGPA DECIMAL(3,2) NOT NULL,
	StdAttendence DECIMAL(5,2) NOT NULL,
	StdPhone NVARCHAR(15) NOT NULL UNIQUE,
)
SELECT *FROM Students

INSERT INTO Students
(FirstName,LastName,Gender,StdDept,StdCGPA,StdAttendence,StdPhone)
VALUES
('DIKSHA','GHATTE','FEMALE','AIDS', '8.5','90.0','546213946'),
('GOURI','HATTARKI','FEMALE','AIML', '8.9','80.5','9683647909'),
('NEHA','BERA','FEMALE','AIDS', '7.5','70.0','649793158'),
('RAM', 'BERA','MALE','CSE','9.0','80.0','9867451313');

SELECT * FROM Students;

-------------------------------------------------   FACULTY TABLE       -------------------------------------------------------------
CREATE TABLE Faculties
(
	FacultyId INT PRIMARY KEY IDENTITY(1, 1),

	FirstName NVARCHAR(100) NOT NULL,
	LastName NVARCHAR(100) NOT NULL,
	Gender NVARCHAR(50),
	Subjects NVARCHAR(100) NOT NULL,
	Email NVARCHAR (50) NOT NULL UNIQUE,
	Phone NVARCHAR(15) NOT NULL UNIQUE 
)

INSERT INTO Faculties
(FirstName,LastName,Subjects,Email,Phone)
VALUES
('Sanjana', 'TELI', 'IAIDS','sanjana@gmail.com','6894354233'),
('Priti', 'DEVMORE', 'SE', 'priti@gmail.com', '9892432253'),
('Sunil', 'Patil','AWT','sunil@college.com','9123400011'),
('Meena', 'Kulkarni','DAA','meena@college.com','9123400012'),
('Ashok', 'Joshi','OOP','ashok@college.com','9123400013'),
('Kavita' ,'Shah','MATHS','kavita@college.com','9123400014'),
('Rajesh', 'More','CHEMISTRY','rajesh@college.com','9123400015');
SELECT * FROM Faculties;


-----------------------------------------------   SUBJECT TABLE     ---------------------------------------------------------------

CREATE TABLE Subjects
(
	SubjectId INT PRIMARY KEY IDENTITY(1,1),

	faculty NVARCHAR(50) NOT NULL,
	CourseTitle NVARCHAR (50) NOT NULL,
	Code NVARCHAR(50) NOT NULL,
	Credit INT  NOT NULL
)

INSERT INTO Subjects 
(faculty, CourseTitle ,Code,Credit)
VALUES 
('SANJANA TELI','IAIDS', '10UAD29',3),
('DHANASHREE PATIL','AWT', '0903AWT07',2),
('DEVMORE','SE', '106SE020',3),
('HEMALATA','OOP', '106OOP02',3);

SELECT *FROM  Subjects;

-------------------------------------------------  Attendence Table  --------------------------------------------------------------
CREATE TABLE Attendances
(
    AttendanceID INT IDENTITY(1,1) PRIMARY KEY,
    StudentPrn INT NOT NULL,
    SubjectId INT NOT NULL,
    AttendanceDate DATE DEFAULT GETDATE(),
    Status VARCHAR(10)
    CHECK(Status IN ('Present','Absent')),

    FOREIGN KEY(StudentPrn)
    REFERENCES Students(StudentPrn),

    FOREIGN KEY(SubjectId)
    REFERENCES Subjects(SubjectId)
);

INSERT INTO Attendances
(StudentPrn, SubjectId, AttendanceDate, Status)
VALUES
(101,1,'2026-07-14','Present'),
(102,1,'2026-07-14','Absent'),
(103,2,'2026-07-14','Present'),
(104,3,'2026-07-14','Present');


SELECT * FROM  Attendances

--------------------------------------------   DEPARTMENT TABLE    ------------------------------------------------------------------

CREATE TABLE Departments
(
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentCode VARCHAR(10) NOT NULL UNIQUE,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE
);


INSERT INTO Departments (DepartmentCode, DepartmentName)
VALUES
('AIDS','Artificial Intelligence & Data Science'),
('CSE','Computer Science Engineering'),
('ME','Mechanical Engineering'),
('CE','Civil Engineering'),
('EEE','Electrical Engineering');

SELECT *FROM  Departments

---------------------------------------------  Adding New column in table use ALTER  -------------------------------------------------

ALTER TABLE Users
ADD 
Address NVARCHAR(100);
SELECT *FROM Users

ALTER TABLE Students
ADD 
BirthDate DATE,
Address NVARCHAR(100),
AmissionDate Date, 
Semester NVARCHAR(50),
IsActive BIT NOT NULL DEFAULT 1 
SELECT *FROM Students

ALTER TABLE Faculties
ADD Salary DECIMAL(10, 2)
SELECT *FROM Faculties

ALTER TABLE Departments 
ADD HeadOfTheDepartments NVARCHAR(50)

ALTER TABLE Students
ADD 
	ModifyBy INT,
	ModifyOn DATETIME;

ALTER TABLE Attendances
ADD 
	ModifyBy INT,
	ModifyOn DATETIME;

ALTER TABLE Departments
ADD
	ModifyBy INT,
	ModifyOn DATETIME;

ALTER TABLE Faculties
ADD 
	ModifyBy INT,
	ModifyOn DATETIME;

ALTER TABLE Subjects
ADD 
	ModifyBy INT,
	ModifyOn DATETIME;

-------------------------------------------------  FOR MODIFYING A COLUMN  ------------------------------------------------------
ALTER TABLE Users
ALTER COLUMN Email NVARCHAR(100)
SELECT *FROM Users

ALTER TABLE Users    
ALTER COLUMN PassWord NVARCHAR(100)

ALTER TABLE Students
ALTER COLUMN StdPhone NVARCHAR(20)         

ALTER TABLE Faculties 
ALTER COLUMN Phone NVARCHAR(20)


----------------------------------------    Renameing the database object   -------------------------------------------------------

EXEC sp_rename 'Students.StdDept', 'Department','COLUMN'
EXEC sp_rename 'Students.StdCGPA', 'CGPA','COLUMN'
EXEC sp_rename 'Students.StdPhone','ContactNo','COLUMN'
EXEC sp_rename 'Students.StdAttendence','Attendence','COLUMN'

SELECT * FROM Students

--EXEC sp_rename 'Faculty', 'Faculties'  //if we have to chage the table name then use this
--SELECT *FROM Faculties


----------------------------------------------  Constrain Practice         --------------------------------------------------------
ALTER TABLE Faculties
ADD CONSTRAINT CHK_Faculties_Salary
CHECK (Salary >= 20000)
SELECT *FROM Faculties

ALTER TABLE Students
ADD CONSTRAINT UQ_Student_Phone
UNIQUE (ContactNo)
SELECT *FROM Students

--ALTER TABLE Faculties 
--ADD CONSTRAINT DF_Faculties_Salary
--DEFAULT 25000 FOR Salary

-----------------------------------------     DROP A Column      -------------------------------------------------------------------

ALTER TABLE Student
drop column Semester

----------------------------------------    UPDATE Records       -------------------------------------------------------------------

UPDATE Faculties SET Salary = 40000 WHERE FacultyID = 1;
UPDATE Faculties SET Salary = 30000 WHERE FacultyID = 2;
UPDATE Faculties SET Salary = 50000 WHERE FacultyID = 3;
UPDATE Faculties SET Salary = 60000 WHERE FacultyID = 4;
UPDATE Faculties SET Salary = 70000 WHERE FacultyID = 5;
UPDATE Faculties SET Salary = 80000 WHERE FacultyID = 6;
UPDATE Faculties SET Salary = 90000 WHERE FacultyID = 7;
UPDATE Faculties SET Salary = Salary * 1.10  WHERE FacultyId = 3;
SELECT *FROM Faculties

-------------------------------------- CRATE A New Table  -----------------------------------------------------------
CREATE TABLE Employee
(
	EmpId INT PRIMARY KEY IDENTITY(101,1),
	
	FirstName NVARCHAR (100) NOT NULL,
	LastName NVARCHAR (100) NOT NULL,
	Gender NVARCHAR (10) NOT NULL,
	Email NVARCHAR(50) NOT NULL UNIQUE,
	PhoneNo NVARCHAR (10) NOT NULL,
	Salary NVARCHAR (10) NOT NULL,
	CreatedBy INT,
	CReatedOn DATETIME,
);
SELECT *FROM Employee

INSERT INTO Employee
(FirstName,LastName,Gender,Email,PhoneNo,Salary,CreatedBy,CReatedOn)
VALUES
('Sanjana', 'TELI', 'F','sanjana@gmail.com','6894354233','90000',101,GETDATE()),
('Priti', 'DEVMORE', 'F', 'priti@gmail.com', '9892432253','80000',102,GETDATE()),
('Sunil', 'Patil','M','sunil@college.com','9123400011','60000',103,GETDATE()),
('Meena', 'Kulkarni','F','meena@college.com','9123400012','2000000',104,GETDATE()),
('Ashok', 'Joshi','M','ashok@college.com','9123400013','4994900',105,GETDATE()),
('Kavita' ,'Shah','F','kavita@college.com','9123400014','600000', 106,GETDATE()),
('Rajesh', 'More','M','rajesh@college.com','9123400015','708890',107,GETDATE());

SELECT *FROM Employee
