CREATE TABLE Tournaments (
    name           TEXT,
    year           INTEGER,
    winner         TEXT,
    winner_country TEXT,

    PRIMARY KEY (name, year)
);
