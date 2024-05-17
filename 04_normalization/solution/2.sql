CREATE TABLE Customers (
    cid           INTEGER PRIMARY KEY,
    firstname     TEXT,
    surname       TEXT,
);

CREATE TABLE Phone (
    number INTEGER PRIMARY KEY,
    cid    INTEGER REFERENCES Customers
);
