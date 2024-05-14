CREATE TABLE Cities (
    name          VARCHAR(90),
    country_code  CHAR(2),

    PRIMARY KEY (name, country_code)
);

INSERT INTO Cities (name, country_code)
VALUES      ('Taumata', 'NZ'),
            ('Llanfair PG', 'NZ');