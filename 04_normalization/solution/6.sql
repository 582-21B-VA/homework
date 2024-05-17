CREATE TABLE Tournaments (
    name   TEXT,
    year   INTEGER,
    winner TEXT REFERENCES Winners,

    PRIMARY KEY (name, year)
);

CREATE TABLE Winners (
    name    TEXT PRIMARY KEY,
    country TEXT
);
