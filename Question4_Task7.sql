SELECT RobberId, Nickname, (Age - NoYears) AS NumberofYears
FROM Robbers
WHERE Age/2 < NoYears;