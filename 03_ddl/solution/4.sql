CREATE TABLE Students (
    sid   INTEGER       PRIMARY KEY,
    name  VARCHAR(255)  NOT NULL
);

CREATE TABLE Courses (
    cid    CHAR(3)      PRIMARY KEY,
    title  VARCHAR(50)  NOT NULL
);

CREATE TABLE Enrollments (
    sid   INTEGER   REFERENCES Students,
    cid   CHAR(10)  REFERENCES Course,
    rank  INT,

    UNIQUE (cid, rank),
    PRIMARY KEY (sid, cid)
);

INSERT INTO Students (sid, name)
VALUES      (1023045646, 'Shima'),
            (3941203031, 'Yue Xia');

INSERT INTO Courses (cid, title)
VALUES      ('21B', 'Intro aux bases de données'),
            ('21F', 'Interface 1');

INSERT INTO Enrollments (sid, cid, rank)
VALUES      (1023045646, '21B', 1),
            (3941203031, '21B', 2);