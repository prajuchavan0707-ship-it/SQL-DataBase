CREATE DATABASE CollegeDB;
GO

USE CollegeDB;
GO

CREATE TABLE Users
(
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(100) NOT NULL
);

CREATE TABLE Departments
(
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentCode VARCHAR(10) NOT NULL UNIQUE,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Students
(
    StudentID INT IDENTITY(101,1) PRIMARY KEY,
    RollNo VARCHAR(20) NOT NULL UNIQUE,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Gender VARCHAR(10) CHECK (Gender IN ('Male','Female')),
    DOB DATE NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    DepartmentID INT NOT NULL,

    FOREIGN KEY (DepartmentID)
    REFERENCES Departments(DepartmentID)
);

CREATE TABLE Faculty
(
    FacultyID INT IDENTITY(1,1) PRIMARY KEY,
    FacultyName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    DepartmentID INT NOT NULL,

    FOREIGN KEY (DepartmentID)
    REFERENCES Departments(DepartmentID)
);

CREATE TABLE Subjects
(
    SubjectID INT IDENTITY(1,1) PRIMARY KEY,
    SubjectCode VARCHAR(20) UNIQUE NOT NULL,
    SubjectName VARCHAR(100) NOT NULL,
    Credits INT DEFAULT 4,
    FacultyID INT NOT NULL,
    DepartmentID INT NOT NULL,

    FOREIGN KEY(FacultyID)
    REFERENCES Faculty(FacultyID),

    FOREIGN KEY(DepartmentID)
    REFERENCES Departments(DepartmentID)
);

CREATE TABLE Attendance
(
    AttendanceID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID INT NOT NULL,
    SubjectID INT NOT NULL,
    AttendanceDate DATE DEFAULT GETDATE(),
    Status VARCHAR(10)
    CHECK(Status IN ('Present','Absent')),

    FOREIGN KEY(StudentID)
    REFERENCES Students(StudentID),

    FOREIGN KEY(SubjectID)
    REFERENCES Subjects(SubjectID)
);

INSERT INTO Users (Username, Email, Password)
VALUES
('rahul','rahul@gmail.com','Rahul@123'),
('priya','priya@gmail.com','Priya@123'),
('aniket','aniket@gmail.com','Aniket@123'),
('sneha','sneha@gmail.com','Sneha@123'),
('pooja','pooja@gmail.com','Pooja@123');


INSERT INTO Departments (DepartmentCode, DepartmentName)
VALUES
('AIDS','Artificial Intelligence & Data Science'),
('CSE','Computer Science Engineering'),
('ME','Mechanical Engineering'),
('CE','Civil Engineering'),
('EEE','Electrical Engineering');

INSERT INTO Students
(RollNo, FirstName, LastName, Gender, DOB, Email, Phone, DepartmentID)
VALUES
('AIDS101','Rahul','Patil','Male','2005-02-10','rahul@student.com','9876500001',1),
('AIDS102','Priya','Shinde','Female','2004-08-15','priya@student.com','9876500002',1),
('CSE101','Aniket','Jadhav','Male','2005-01-12','aniket@student.com','9876500003',2),
('ME101','Sneha','Kadam','Female','2004-11-20','sneha@student.com','9876500004',3),
('CE101','Pooja','Desai','Female','2005-04-05','pooja@student.com','9876500005',4);

INSERT INTO Faculty
(FacultyName, Email, Phone, DepartmentID)
VALUES
('Dr. Sunil Patil','sunil@college.com','9123400011',1),
('Dr. Meena Kulkarni','meena@college.com','9123400012',2),
('Dr. Ashok Joshi','ashok@college.com','9123400013',3),
('Dr. Kavita Shah','kavita@college.com','9123400014',4),
('Dr. Rajesh More','rajesh@college.com','9123400015',5);

INSERT INTO Subjects
(SubjectCode, SubjectName, Credits, FacultyID, DepartmentID)
VALUES
('AI101','Machine Learning',4,1,1),
('CS102','Data Structures',4,2,2),
('ME201','Engineering Mechanics',3,3,3),
('CE301','Construction Technology',4,4,4),
('EE401','Power Electronics',3,5,5);


INSERT INTO Attendance
(StudentID, SubjectID, AttendanceDate, Status)
VALUES
(101,1,'2026-07-14','Present'),
(102,1,'2026-07-14','Absent'),
(103,2,'2026-07-14','Present'),
(104,3,'2026-07-14','Present'),
(105,4,'2026-07-14','Absent');

SELECT * FROM Users;

SELECT * FROM Departments;

SELECT * FROM Students;

SELECT * FROM Faculty;

SELECT * FROM Subjects;

SELECT * FROM Attendance;