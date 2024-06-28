CREATE DATABASE CodeAcademy
USE CodeAcademy
--------- CREATE / Insert GroupTypes Table --------------

CREATE TABLE GroupTypes(
Id INT PRIMARY KEY IDENTITY(1,1),
[Name] NVARCHAR(55) NOT NULL UNIQUE
)

INSERT INTO GroupTypes VALUES(
'Full-Stack'
)

--------- CREATE / Insert Groups Table --------------
CREATE TABLE Groups (
Id INT PRIMARY KEY IDENTITY(1,1),
[Name] NVARCHAR(55) UNIQUE NOT NULL CHECK(LEN([Name])>4),
BeginDate DATE DEFAULT GETDATE() CHECK(BeginDate<=GETDATE()),
EndDate DATE NOT NULL  ,
LessonHours INT DEFAULT(200) CHECK(LessonHours>=200),
GroupTypeId INT FOREIGN KEY REFERENCES GroupTypes(Id),
CONSTRAINT CHK_EndDate CHECK (EndDate>BeginDate)
)

INSERT INTO Groups VALUES(
'Bg334',
'2024.05.12',
'2025.03.29',
220,
3
)

--------- CREATE / Insert Students Table --------------
CREATE TABLE Students (
Id INT PRIMARY KEY IDENTITY(1,1),
[Name] NVARCHAR(55) NOT NULL CHECK(LEN([Name])>2),
Surname NVARCHAR(55) NOT NULL CHECK(LEN(Surname)>4),
BirthDate DATE NOT NULL CHECK(BirthDate<=DATEADD(YEAR,-15,GETDATE())),
RegistrationDate DATE DEFAULT GETDATE() CHECK(RegistrationDate<=GETDATE()),
PhoneNumber NVARCHAR(55) NOT NULL UNIQUE,
EMAIL NVARCHAR(55) NOT NULL UNIQUE
)
INSERT INTO Students VALUES(
'Ramin',
'Samedli',
'1999.10.15',
'2024.05.19',
'9941221417',
'Rsamedli@gmail.com'
)

--------- CREATE / Insert StudentsGroups Table --------------
CREATE TABLE StudentsGroups(
Id INT PRIMARY KEY IDENTITY(1,1),
StudentId INT FOREIGN KEY REFERENCES Students(Id),
GroupId INT FOREIGN KEY REFERENCES Groups(Id)
)
INSERT INTO StudentsGroups VALUES(
8,
5
)
--------- CREATE / Insert Topics Table --------------
CREATE TABLE Topics(
Id INT PRIMARY KEY IDENTITY(1,1),
[Name] NVARCHAR(55) NOT NULL UNIQUE CHECK(LEN([Name])>2),
LessonHours INT DEFAULT(5) CHECK(LessonHours>=5),
)
INSERT INTO Topics VALUES(
'ASP .NET',
50
)

--------- CREATE / Insert GroupsTopics Table --------------
CREATE TABLE GroupsTopics(
Id INT PRIMARY KEY IDENTITY(1,1),
GroupId INT FOREIGN KEY REFERENCES Groups(Id),
TopicId INT FOREIGN KEY REFERENCES Topics(Id)
)

INSERT INTO GroupsTopics VALUES(
5,
5
)

--------- CREATE / Insert ExerciseTypes Table --------------
CREATE TABLE ExerciseTypes(
Id INT PRIMARY KEY IDENTITY(1,1),
[Name] NVARCHAR(55) NOT NULL UNIQUE
)

INSERT INTO ExerciseTypes VALUES(
'Final Project'
)

--------- CREATE / Insert Exercise Table --------------
CREATE TABLE Exercises(
Id INT PRIMARY KEY IDENTITY(1,1),
[Name] NVARCHAR(55) NOT NULL UNIQUE,
Grade FLOAT NOT NULL CHECK(Grade>=0 AND Grade<=100),
StudentId INT FOREIGN KEY REFERENCES Students(Id),
ExerciseTypeId INT FOREIGN KEY REFERENCES ExerciseTypes(Id)
)

INSERT INTO Exercises VALUES(
'Asinxron Proqramming',
56.4,
1,
1
)
----------------- SELECT -----------------
SELECT * FROM GroupTypes
SELECT * FROM Groups
SELECT * FROM Students 
SELECT * FROM StudentsGroups
SELECT * FROM Topics
SELECT * FROM GroupsTopics
SELECT * FROM ExerciseTypes
SELECT * FROM Exercises