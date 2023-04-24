CREATE TABLE Banks (
    BankName VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    NoAccounts INT CHECK (NoAccounts > 0),
    Security VARCHAR(50) CHECK (Security IN ('excellent', 'very good', 'good', 'weak')),
    PRIMARY KEY (BankName, City)
);

CREATE TABLE Robberies (
    BankName VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Date DATE NOT NULL,
    Amount DECIMAL (10, 2) CHECK (Amount > 0),
    PRIMARY KEY (BankName, City, Date),
    FOREIGN KEY (BankName, City) REFERENCES Banks (BankName, City)
);

CREATE TABLE Plans (
    BankName VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    NoRobbers INT CHECK (NoRobbers > 0),
    PlannedDate DATE NOT NULL,
    PRIMARY KEY (BankName, City, PlannedDate),
    FOREIGN KEY (BankName, City) REFERENCES Banks (BankName, City)
);

CREATE TABLE Robbers (
    RobberId SERIAL,
    Nickname VARCHAR(50),
    Age INT CHECK (Age > 0),
    NoYears INT CHECK (NoYears < Age),
    PRIMARY KEY (RobberId)
);

CREATE TABLE Skills (
    SkillId SERIAL,
    Description VARCHAR(50) NOT NULL
    PRIMARY KEY (SkillId)
    CONSTRAINT unique_Description UNIQUE (Description)
);

CREATE TABLE HasSkills (
    RobberId INT NOT NULL,
    SkillId INT NOT NULL,
    Preference INT CHECK (Preference > 0),
    GRADE VARCHAR(50),
    PRIMARY KEY (RobberId, SkillId),
    FOREIGN KEY (RobberId) REFERENCES Robbers (RobberId),
    FOREIGN KEY (SkillId) REFERENCES Skills (SkillId)
);

CREATE TABLE HasAccounts (
    RobberId INT NOT NULL,
    BankName VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    PRIMARY KEY (RobberId, BankName, City),
    FOREIGN KEY (RobberId) REFERENCES Robbers (RobberId),
    FOREIGN KEY (BankName, City) REFERENCES Banks (BankName, City)
);

CREATE TABLE Accomplices (
    RobberId INT NOT NULL, 
    BankName VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Date DATE NOT NULL,
    Share DECIMAL (10, 2),
    PRIMARY KEY (RobberId, BankName, City, Date),
    FOREIGN KEY (RobberId) REFERENCES Robbers (RobberId),
    FOREIGN KEY (BankName, City, Date) REFERENCES Robberies (BankName, City, Date)
);