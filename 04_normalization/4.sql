CREATE TABLE Customers (
    cid          INTEGER PRIMARY KEY,
    firstname    TEXT,
    surname      TEXT,
    phone_number TEXT,

    PRIMARY KEY (cid, phone_number)
);
