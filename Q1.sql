/* 
Banks
Attributes: BankName, City, NoAccounts, Security
Primary key: BankName, City
Foreign key: none
Constraints: NoAccounts > 0
*/
CREATE TABLE Banks (
    BankName VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    NoAccounts INT CHECK (NoAccounts > 0),
    Security VARCHAR(50) CHECK (Security IN ('excellent', 'very good', 'good', 'weak')),
    PRIMARY KEY (BankName, City)
);

/*
Robberies
Attributes: BankName, City, Date, Amount
Primary key: BankName, City, Date
Foreign key: BankName, City (Banks)
Constraints: Amount > 0
*/
CREATE TABLE Robberies (
    BankName VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Date DATE NOT NULL,
    Amount DECIMAL (10, 2) CHECK (Amount > 0),
    PRIMARY KEY (BankName, City, Date),
    FOREIGN KEY (BankName, City) REFERENCES Banks (BankName, City)
);

/*
Plans 
Attributes: BankName, City, NoRobbers, PlannedDate
Primary key: BankName, City, PlannedDate
Foreign key: BankName, City (Banks)
Constraints: NoRobbers > 0
*/
CREATE TABLE Plans (
    BankName VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    NoRobbers INT CHECK (NoRobbers > 0),
    PlannedDate DATE NOT NULL,
    PRIMARY KEY (BankName, City, PlannedDate),
    FOREIGN KEY (BankName, City) REFERENCES Banks (BankName, City)
);

/*
Robbers
Attributes: RobberId, Nickname, Age, NoYears
Primary key: RobberId
Foreign key: none
Constraints: Age > 0, NoYears < Age
*/
CREATE TABLE Robbers (
    RobberId SERIAL,
    Nickname VARCHAR(50),
    Age INT CHECK (Age > 0),
    NoYears INT CHECK (NoYears < Age),
    PRIMARY KEY (RobberId)
);

/*
Skills
Attributes: SkillId, Description
Primary key: SkillId
Foreign key: none
Constraints: Description is not null, Description is UNIQUE
*/
CREATE TABLE Skills (
    SkillId SERIAL,
    Description VARCHAR(50) NOT NULL
    PRIMARY KEY (SkillId)
    CONSTRAINT unique_Description UNIQUE (Description)
);

/*
HasSkills
Attributes: RobberId, SkillId, Preference, Grade
Primary key: RobberId, SkillId
Foreign key: RobberId (Robbers), SkillId (Skills)
Constraints: Preference > 0
*/
CREATE TABLE HasSkills (
    RobberId INT NOT NULL,
    SkillId INT NOT NULL,
    Preference INT CHECK (Preference > 0),
    GRADE VARCHAR(50),
    PRIMARY KEY (RobberId, SkillId),
    FOREIGN KEY (RobberId) REFERENCES Robbers (RobberId),
    FOREIGN KEY (SkillId) REFERENCES Skills (SkillId)
);

/*
HasAccounts
Attributes: RobberId, BankName, City
Primary key: RobberId, BankName, City
Foreign key: RobberId (Robbers), BankName, City (Banks)
Constraints: none
*/
CREATE TABLE HasAccounts (
    RobberId INT NOT NULL,
    BankName VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    PRIMARY KEY (RobberId, BankName, City),
    FOREIGN KEY (RobberId) REFERENCES Robbers (RobberId),
    FOREIGN KEY (BankName, City) REFERENCES Banks (BankName, City)
);

/*
Accomplices
Attributes: RobberId, BankName, City, Date, Share
Primary key: RobberId, BankName, City, Date
Foreign key: RobberId (Robbers), BankName, City, Date (Robberies)
Constraints: none
*/
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

/*
Changes:
- Changed Amount (Robberies) from INTEGER to type DECIMAL (10, 2) 
ALTER TABLE Robberies
ALTER COLUMN Amount TYPE DECIMAL (10, 2);
- Changed RobberId (Robbers) from INTEGER to type SERIAL
ALTER TABLE Robbers
ALTER COLUMN RobberId TYPE SERIAL;
*/