CREATE TABLE Grandmaster (
    Fide_id int NOT NULL PRIMARY KEY,
    Name varchar(255),
    Federation varchar(255),
    Gender varchar(255),
    Year_of_birth int,
    Title varchar(255),
    Standard_Rating int,
    Rapid_rating int,
    Blitz_rating int,
    Inactive_flag varchar(255)
);