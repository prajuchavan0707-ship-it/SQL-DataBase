CREATE DATABASE StudentManagement_db
use StudentManagement_db

CREATE TABLE Students(
	PRN INT PRIMARY KEY IDENTITY(101, 1),
	FirstName NVARCHAR (100) NOT NULL,
	LastName NVARCHAR (100) NOT NULL,
	DepartmentId INT ,

	FOREIGN KEY (DepartmentId)
	REFERENCES Departments (DepartmentId)
);

CREATE TABLE Departments(
	DepartmentId INT PRIMARY KEY IDENTITY(201, 1),
	DepartmentName NVARCHAR (100) 
);

CREATE TABLE Faculty(
	FacultyId INT PRIMARY KEY IDENTITY (301,1),
	FacultyName NVARCHAR (100) NOT NULL,
	DepartmentId INT

	FOREIGN KEY (DepartmentId)
	REFERENCES Departments(DepartmentId)
);

CREATE TABLE Subjects(
	SubjectId INT PRIMARY KEY IDENTITY(401 ,1),
	SubjectName NVARCHAR(100) NOT NULL,
	FacultyId INT ,
	
	FOREIGN KEY (FacultyId)
	REFERENCES Faculty(FacultyId)
);

CREATE TABLE Attendance(
	AttendanceId INT PRIMARY KEY IDENTITY(501, 1),
	PRN INT,
	SubjectId INT,
	AttendanceDate DATETIME,
	Status VARCHAR(10)
    CHECK(Status IN ('P','A','NC')),

	FOREIGN KEY (PRN)
	REFERENCES Students(PRN),

	FOREIGN KEY (SubjectId)
	REFERENCES Subjects(SubjectId),
);

SELECT *FROM Students
SELECT *FROM Departments
SELECT *FROM Faculty
SELECT *FROM Subjects
SELECT *FROM Attendance

insert into students
(firstname, lastname, departmentid)
values
('Prajakta','Chavan', 201),
('Pranoti','Shende', 202),
('Parth','Chavan', 203),
('Diksha','Ghatte', 204),
('Akansha','Choudry', 205);

insert into students(firstname, lastname)
values('Gouri','Hattarki'),
	  ('Purva', 'Chavan'),
	  ('Pranav', 'Shende'),
	  ('Neha', 'Bera');

insert into departments(departmentname)
values('Artificial Intelligence & Data Science'),
	  ('Computer Science Engineering'),
	  ('Artificial Intelligence & Machine Learning'),
	  ('Electronics & Telecommunications Engineering'),
	  ('Electrical Enginerring');

insert into faculty (facultyName,DepartmentId)
values ('Sanjana Teli', 205),
	   ('Priyanka Koshti',201),
	   ('Hemalata Magadum',203),
	   ('Priti Devmore',204);

insert into faculty(facultyname)
values ('Rubi Mittal'),
	   ('Gayatri Patil');

insert into subjects(subjectname, facultyid)
values ('IAIDS',301),
	   ('DBE',303),
	   ('MP',302),
	   ('SE',304);

insert into subjects(subjectname)
values ('ML'),
	   ('FE'),
	   ('IOT');

insert into attendance(prn, subjectid, attendancedate, status)
values (102,401,GETDATE(),'P'),
	   (103, 402, GETDATE(), 'A'),
	   (104, 403, GETDATE(), 'P'),
	   (105, 404, GETDATE(), 'NC');

insert into attendance (attendancedate,status)
values(GETDATE(), 'P'),
	  (GETDATE(), 'A'),
	  (GETDATE(), 'NC');

-------------------  1. Display each student's full name with their department name.   ------------------------
SELECT *FROM Students
SELECT *FROM Departments

select s.firstname ,s.lastname,d.departmentname from students s
inner join departments d on d.departmentid = s.departmentid

------------------  2. Display all students even if they are not assigned to any department  ------------------

select s.firstname ,s.lastname,d.departmentname from students s
left join departments d on d.departmentid = s.departmentid

-----------------  3. Display all departments even if no students belong to them   ----------------------------

select d.departmentid, s.firstname ,s.lastname,d.departmentname from students s
left join departments d on d.departmentid = s.departmentid

----------------  4. Count students in each department --------------------------------------------------------

select d.departmentid,d.departmentname,COUNT(s.prn) AS TotalStudents
from departments d inner join  students s
on d.departmentid = s.departmentid
group by d.departmentid, d.departmentname

----------------  5. Find departments with no students.  ------------------------------------------------------

select d.departmentid,d.departmentname from students s
left join departments d on d.departmentid = s.departmentid where s.prn is null

---------------   6. Display faculty names with their department names.  --------------------------------------

select f.facultyname , d.departmentname from faculty f
inner join departments d on d.departmentid =f.departmentid

---------------  7. Display subjects along with the faculty who teaches them.  --------------------------------

select s.subjectname, f.facultyname from subjects s
inner join faculty f on f.facultyid = s.facultyid

---------------  8.Display student name, subject name and attendance status  ----------------------------------

select s.firstname,s.lastname,sb.subjectname ,a.status from students s
inner join attendance a on a.prn =s.prn 
inner join subjects sb on a.subjectid =sb.subjectid

--------------  9. Find students absent in any subject.    ----------------------------------------------------

select s.firstname,s.lastname,sb.subjectname ,a.status from students s
inner join attendance a on a.prn =s.prn 
inner join subjects sb on a.subjectid =sb.subjectid where a.status like 'A%'

-------------  10. Count total attendance records for each student.  ------------------------------------------

select s.firstname , s.lastname, COUNT(a.attendanceid) AS Totalattendance
from students s  left join attendance a on s.prn = a.prn 
group by  s.firstname , s.lastname

-----------  11. Count total students taught by each faculty (through subjects and attendance).  -------------

select count(s.prn) as totalStudent from students s 
inner join attendance a on s.prn = a.prn
inner join subjects sb on sb.subjectid =a.subjectid
inner join faculty f on f.facultyid = sb.facultyid

----------   12. Find subjects that have no attendance records. ----------------------------------------------

select sb.subjectid, sb.subjectname, a.status  from subjects sb 
left join attendance a on a.subjectid = sb.subjectid
where a.status is null

---------  13. Display students who attended a specific subject.   -------------------------------------------

select s.firstname,s.lastname,sb.subjectname,a.status from students s
inner join attendance a on a.prn =s.prn 
inner join subjects sb on a.subjectid =sb.subjectid where sb.subjectname = 'IAIDS'

--------  14. List all subjects offered by each department.   ------------------------------------------------

select sb. subjectname ,d.departmentname from subjects sb
inner join faculty f  on  f.facultyid = sb.facultyid 
inner join departments d on d.departmentid = f.departmentid

-------   15. Find departments having more than one faculty.   -----------------------------------------------

select d.departmentid, d.departmentname, count(f.facultyid) as totalfaculty
from departments d inner join faculty f on d.departmentid = f.departmentid
group by d.departmentid,d.departmentname having count(f.facultyid)>1


---------   16. Display attendance date, student name and subject name   -------------------------------------

select a.attendancedate ,s.firstname,s.lastname, sb.subjectname from students s 
inner join attendance a on s.prn = a.prn 
inner join subjects sb on sb.subjectid = a. subjectid

---------   17. Find students who have never attended any class.    ------------------------------------------

select s.firstname, s.lastname, a.status from students s 
 left join attendance a on s.prn = a.prn where a.status is null

 -------  18. Show all faculty even if they are not assigned any subject.  -----------------------------------

 select f.facultyname, sb.subjectname from faculty f 
 left join subjects sb on f.facultyid = sb.facultyid where sb.subjectname is null 

 ------  19. Display all subjects even if no faculty is assigned    ------------------------------------------

 select sb.subjectname , f.facultyname from subjects sb
 left join faculty f on f.facultyid = sb.facultyid

 ------  20. Explain which JOIN (INNER/LEFT/RIGHT/FULL) is suitable for Questions 1–19  ----------------------

 ---- for  all this question left join and inner join is more suitable because it is easy to 
 ---- to understand.