CREATE TABLE Customers (
    cid       INTEGER PRIMARY KEY,
    firstname TEXT,
    surname   TEXT,
);

CREATE TABLE Phones (
    number INTEGER PRIMARY KEY,
    cid    INTEGER REFERENCES Customers
);
