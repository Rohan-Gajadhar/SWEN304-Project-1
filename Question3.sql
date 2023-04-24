--1a)
INSERT INTO Skills (SkillId, Description) VALUES (21, ‘Driving’);

--2a)
INSERT INTO Banks (BankName, City, NoAccounts, Security) VALUES ('Loanshark Bank', 'Evanston', 100, 'very good');

--2b)
INSERT INTO Banks (BankName, City, NoAccounts, Security) VALUES (‘EasyLoan Bank’, ‘Evanston’, -5, ‘excellent’); 

--2c)
INSERT INTO Banks (BankName, City, NoAccounts, Security) VALUES (‘EasyLoan Bank’, ‘Evanston’, 100, ‘poor’);

--3a) 
INSERT INTO Robberies (BankName, City, Date, Amount) VALUES ('NXP Bank', 'Chicago', '2019-01-08', 1000);

--4a)
DELETE FROM Skills WHERE SkillId = 1;

--5a)
 DELETE FROM Banks WHERE BankName = 'PickPocket Bank' AND City = 'Evanston' AND NoAccounts = 2000 AND Security = 'very good';

--6a)
DELETE FROM Robberies WHERE BankName = 'Loanshark Bank' AND City = 'Chicago' AND Date = '' AND Amount ='';

--7a)
INSERT INTO Robbers (RobberId, Nickname, Age, NoYears) VALUES (1, 'Shotgun', 70, 0);

--7b)
INSERT INTO Robbers (RobberId, Nickname, Age, NoYears) VALUES (999, 'Jail Mouse', 25, 35);

--8a)
INSERT INTO HasSkills (RobberId, SkillId, Preference, Grade) VALUES (1, 7, 1, 'A+');

--8b)
INSERT INTO HasSkills (RobberId, SkillId, Preference, Grade) VALUES (1, 2, 0, 'A');

--8c)
INSERT INTO HasSkills (RobberId, SkillId, Preference, Grade) VALUES (999, 1, 1, 'B-');

--8d)
INSERT INTO HasSkills (RobberId, SkillId, Preference, Grade) VALUES (3, 20, 3, 'B+');

--9a)
DELETE FROM Robbers WHERE RobberId = 1 AND Nickname = 'Al Capone' AND Age = 31 AND NoYears = 2;