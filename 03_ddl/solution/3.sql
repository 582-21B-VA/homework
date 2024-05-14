CREATE TABLE People (
    sin   INTEGER      PRIMARY KEY,
    name  VARCHAR(20)  NOT NULL
);

CREATE TABLE Parents (
    parent_sin  INTEGER  REFERENCES People,
    child_sin   INTEGER  REFERENCES People,

    PRIMARY KEY (parent_sin, child_sin)
);

INSERT INTO People (sin, name)
VALUES      (345875123, 'Carole'),
            (093845012, 'Martin'),
            (034567980, 'Maxime');


INSERT INTO Parents (parent_sin, child_sin)
VALUES      (345875123, 034567980),
            (093845012, 034567980);