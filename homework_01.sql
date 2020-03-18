
USE 11b_18_school;

CREATE TABLE IF NOT EXISTS Students (
    Id INTEGER AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(128),
    Num INTEGER(2),
    CLASS VARCHAR(3),
    EGN CHAR(10),
    EntranceExamResult DECIMAL(3, 2),
    Birthday DATE
);

INSERT INTO Students VALUES (
    NULL,
    'Kristiyan Bozhidarov Yochev',
    18,
    '11b',
    '0341126729',
    5.75,
    '2003-01-12'
);