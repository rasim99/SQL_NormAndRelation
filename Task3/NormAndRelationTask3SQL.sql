CREATE DATABASE LibraryManagement
USE LibraryManagement

-------------- CREATE / INSERT Libraries ---------
CREATE TABLE Libraries(
Id INT PRIMARY KEY IDENTITY(1,1),
[Name] NVARCHAR(55) NOT NULL ,
Address  NVARCHAR(55) NOT NULL 
)
INSERT INTO Libraries VALUES (
'Merkze Kitabxana ',
'Baku'
)

-------------- CREATE / INSERT Books ---------
CREATE TABLE Books(
Id INT PRIMARY KEY IDENTITY(1,1),
[Name] NVARCHAR(55) NOT NULL ,
[Count] INT CHECK([Count]>0)
)

INSERT INTO Books VALUES (
'Romeo & Julietta ',
15
)
-------------- CREATE / INSERT LibrariesBooks ---------
CREATE TABLE LibrariesBooks(
Id INT PRIMARY KEY IDENTITY(1,1),
LibrayId INT FOREIGN KEY REFERENCES Libraries(Id),
BookId INT FOREIGN KEY REFERENCES Books(Id)
)

INSERT INTO LibrariesBooks VALUES (
2,
2
)

-------------- CREATE / INSERT Authors ---------

CREATE TABLE Authors(
Id INT PRIMARY KEY IDENTITY(1,1),
[Name] NVARCHAR(55) NOT NULL ,
Surname NVARCHAR(55) NOT NULL 
)
INSERT INTO Authors VALUES (
'William',
'Shekspiere'
)

-------------- CREATE / INSERT AuthorsBooks ---------
CREATE TABLE AuthorsBooks(
Id INT PRIMARY KEY IDENTITY(1,1),
AuthorId INT FOREIGN KEY REFERENCES Authors(Id),
BookId INT FOREIGN KEY REFERENCES Books(Id)
)

INSERT INTO AuthorsBooks VALUES (
2,
2
)

-------------- CREATE / INSERT Genres ---------
CREATE TABLE Genres(
Id INT PRIMARY KEY IDENTITY(1,1),
[Name] NVARCHAR(55) NOT NULL UNIQUE	 ,
)
INSERT INTO Genres VALUES (
'Dedective'
)

-------------- CREATE / INSERT BooksGenres ---------
CREATE TABLE BooksGenres(
Id INT PRIMARY KEY IDENTITY(1,1),
BookId INT FOREIGN KEY REFERENCES Books(Id),
GenreId INT FOREIGN KEY REFERENCES Genres(Id)
)

INSERT INTO BooksGenres VALUES (
2,
1
)
---------- SELECT  --------------------
SELECT *  FROM Libraries
SELECT *  FROM Books
SELECT *  FROM LibrariesBooks
SELECT *  FROM Authors
SELECT *  FROM AuthorsBooks
SELECT *  FROM Genres
SELECT *  FROM BooksGenres

