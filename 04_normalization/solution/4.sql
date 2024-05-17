CREATE TABLE Customers (
    cid          INTEGER,
    firstname    TEXT,
    surname      TEXT,

    PRIMARY KEY (cid, phone_number)
);

CREATE TABLE Phones (
    number TEXT,
    cid    INTEGER REFERENCES Customers,

    PRIMARY KEY (number, cid)
);
