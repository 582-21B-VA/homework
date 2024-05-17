CREATE TABLE Cars (
    brand   TEXT REFERENCES Brands,
    model   TEXT,
    price   INTEGER,

    PRIMARY KEY (brand, model)
);

CREATE TABLE Brands (
    brand   TEXT PRIMARY KEY,
    country TEXT
);
