USE 11b_18_school;

-- Table `Students` created in prev. homework, added creation clause for completeness
CREATE TABLE IF NOT EXISTS Students (
    Id INTEGER AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(128) NOT NULL,
    Num INTEGER(2) NOT NULL,
    Class VARCHAR(3) NOT NULL,
    EGN CHAR(10) NOT NULL,
    EntranceExamResult DECIMAL(3, 2) NOT NULL,
    Birthday DATE
);

CREATE TABLE IF NOT EXISTS Subjects (
    Id INTEGER AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(128) NOT NULL
);

CREATE TABLE IF NOT EXISTS StudentsSubjects (
    StudentId INTEGER NOT NULL,
    SubjectId INTEGER NOT NULL,
    PRIMARY KEY (StudentId, SubjectId),
    FOREIGN KEY (StudentId) REFERENCES Students(Id) ON DELETE CASCADE,
    FOREIGN KEY (SubjectId) REFERENCES Subjects(Id)
);

-- Clear all tables
DELETE FROM Students;
DELETE FROM StudentsSubjects;
DELETE FROM Subjects;

-- Add a bunch of subjects
INSERT INTO Subjects (Name) VALUES
    ('Math'),
    ('Bulgarian'),
    ('Programming Technology'),
    ('Database Management Systems'),
    ('Automatization in the development of electronics');

-- Insert a bunch of students
INSERT INTO Students (Name, Num, Class, EGN, EntranceExamResult, Birthday) VALUES
    ('Alexander Stoichkov', 2, '11b', '02xxxxxxxx', 5.50, '2002-08-25'),
    ('Georgi Korchakov', 10, '11g', '02xxxxxxxx', 5.30, '2002-08-30');

-- Make the students study a bunch of subjects (Id's on my db, may differ on yours)
INSERT INTO StudentsSubjects (StudentId, SubjectId) VALUES (1, 1), (1, 2), (1, 3), (1, 4), (2, 1), (2, 2), (2, 5);

-- Show what everybody is studying
SELECT Students.Name AS StudentName, Subjects.Name as SubjectName FROM Students
    INNER JOIN StudentsSubjects
    ON Students.Id = StudentsSubjects.StudentId
    INNER JOIN Subjects
    ON StudentsSubjects.SubjectId = Subjects.Id;
