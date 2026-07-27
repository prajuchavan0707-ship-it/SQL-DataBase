use StudentManagement_db

SELECT *FROM Students
SELECT *FROM Departments
SELECT *FROM Faculty
SELECT *FROM Subjects
SELECT *FROM Attendance

----- 1. Display each student's full name, department name, and subject name.  -------------------------------------

select s.firstname , s.lastname , d. departmentname , sb.subjectname from students s
inner join departments d on s.departmentid = d.departmentid
inner join attendance a on a.prn = s.prn
inner join subjects sb on sb.subjectid = a.subjectid

-----  2. Display student name, faculty name, and subject name where DepartmentName = 'Computer Science'.   ----

select s.firstname , s.lastname ,f.facultyname, sb.subjectname , d.departmentname 
from students s inner join departments d on s.departmentid =d.departmentid
inner join faculty f on f.departmentid = d.departmentid
inner join subjects sb on sb.facultyid = f.facultyid
where departmentname = 'Computer Science Engineering'

----  3. Display distinct department names that have at least one subject.      --------------------------------

select distinct d.departmentname , sb.subjectname from departments d
inner join  faculty f on f.departmentid = d.departmentid 
inner join subjects sb on sb.facultyid = f.facultyid

---- 4. Display student name, subject name, and attendance date where Status='Present'.  -----------------------

select s.firstname ,s.lastname , sb.subjectname , a.attendancedate 
from students s inner join attendance a on s.prn = a.prn 
inner join subjects sb on sb.subjectid = a.subjectid 
where status = 'P'

----  5. Display student name, faculty name, and attendance status for absent records.   -----------------------

select s.firstname ,s.lastname, f.facultyname, a.status
from students s inner join attendance a on s.prn = a.prn 
inner join subjects sb on sb.subjectid = a.subjectid 
inner join faculty f on f.facultyid = sb.facultyid
where status = 'A'

----  6. Display all students with subject names for AttendanceDate = '2026-01-01'.   --------------------------

