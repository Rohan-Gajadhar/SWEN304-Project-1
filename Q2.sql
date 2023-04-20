\copy Banks FROM /am/kings/home1/gajadhroha/Documents/SWEN304/banks_23.data
\copy Robberies FROM /am/kings/home1/gajadhroha/Documents/SWEN304/robberies_23.data
\copy Plans(BankName, City, PlannedDate, NoRobbers) FROM /am/kings/home1/gajadhroha/Documents/SWEN304/plans_23.data
\copy Robbers(Nickname, Age, NoYears) FROM /am/kings/home1/gajadhroha/Documents/SWEN304/robbers_23.data

-- Creating Skills table 
CREATE TABLE defineSkills (
    defineNickname VARCHAR(50),
    defineDescription VARCHAR(50) NOT NULL,
    definePreference INT CHECK (definePreference > 0),
    defineGrade VARCHAR(50)
);

\copy defineSkills FROM /am/kings/home1/gajadhroha/Documents/SWEN304/hasskills_23.data

INSERT INTO Skills (Description)
    SELECT DISTINCT defineDescription
    FROM defineSkills;

-- Creating HasSkills table
INSERT INTO HasSkills (RobberId, SkillId, Preference, Grade)
    SELECT Robbers.RobberId, Skills.SkillId, definePreference, defineGrade
    FROM defineSkills
    INNER JOIN Robbers ON Robbers.Nickname = defineNickname
    INNER JOIN Skills ON Skills.Description = defineDescription;

DROP TABLE defineSkills;

-- Creating HasAccounts and Accomplices tables
CREATE TABLE defineAccounts (
    defineNickname VARCHAR(50),
    defineBankName VARCHAR(50),
    defineCity VARCHAR(50)
);

\copy defineAccounts FROM /am/kings/home1/gajadhroha/Documents/SWEN304/hasaccounts_23.data

INSERT INTO HasAccounts (RobberId, BankName, City)
    SELECT Robbers.RobberId, defineBankName, defineCity
    FROM defineAccounts
    INNER JOIN Robbers ON Robbers.Nickname = defineNickname;

DROP TABLE defineAccounts;

CREATE TABLE defineAccomplices (
    defineNickname VARCHAR(50),
    defineBankName VARCHAR(50),
    defineCity VARCHAR(50),
    defineDate DATE,
    defineShare DECIMAL (10, 2)
);

\copy defineAccomplices FROM /am/kings/home1/gajadhroha/Documents/SWEN304/accomplices_23.data

INSERT INTO Accomplices (RobberId, BankName, City, Date, Share)
    SELECT Robbers.RobberId, defineBankName, defineCity, defineDate, defineShare
    FROM defineAccomplices
    INNER JOIN Robbers ON Robbers.Nickname = defineNickname;

DROP TABLE defineAccomplices;