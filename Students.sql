use master 
go

create database Students
go



drop database Students
go

use master 
go

create database Students
go

use Students
go

create table Person(
PersonID int identity(1,1) Primary Key,
LastName varchar(20),
FirstName varchar(20),
HireDate date,
EnrollmentDate date,
)
go


create table OfficeAssignment(
InstructorID int identity(1,1) Primary Key,
Location varchar(50),
TimeStamp time,

CONSTRAINT FK_InstructorID FOREIGN KEY (InstructorID) REFERENCES Person(PersonID)
)
go

create table OnlineCourse(
CourseID int identity(1,1) Primary Key,
URL varchar(50)
)
go

create table Department(
DepartmentID int identity(1,1) Primary Key,
Name varchar(50),
Budget int,
StartDate date,
Administrator varchar(50)
)
go

create table Course(
CourseID int identity(1,1) Primary Key,
Title varchar(50),
Credits int,
DepartmentID int
CONSTRAINT FK_DepartmentID FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
CONSTRAINT FK_CourseID FOREIGN KEY (CourseID) REFERENCES OnlineCourse(CourseID)
)
go

create table CourseInstructor(
CourseID int identity(1,1) Primary Key,
PersonID int
CONSTRAINT FK_CourseInstructor FOREIGN KEY (PersonID) REFERENCES Person(PersonID),
CONSTRAINT FK_CourseInstructorID FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
)
go

create table OnsiteCourse(
CourseID int identity(1,1) Primary Key,
Location varchar(50),
Days int,
Time time,
CONSTRAINT FK_OnsiteCourseID FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
)
go

create table StudentGrade(
EnrollmentID int identity(1,1) Primary Key,
CourseID int,
StudentID int,
Grade int
CONSTRAINT FK_StudentGradeID FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
)
go

use Students
go
ALTER TABLE StudentGrade ADD CONSTRAINT FK_StudentID FOREIGN KEY (StudentID) REFERENCES Person(PersonID);
go