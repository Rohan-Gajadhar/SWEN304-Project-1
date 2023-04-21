SELECT b.BankName, b.City
FROM Banks b
JOIN Plans p ON b.BankName = p.BankName AND b.City = p.City
JOIN Robberies r ON b.BankName = r.BankName AND b.City = r.City
WHERE DATE_PART('year', p.PlannedDate) = DATE_PART('year', r.Date);

SELECT b.BankName, b.City
FROM Banks b
LEFT JOIN RobberyPlans rp ON b.BankId = rp.BankId
LEFT JOIN Robberies r ON b.BankId = r.BankId AND YEAR(r.RobberyDate) = rp.Year
WHERE r.RobberyId IS NULL
ORDER BY b.BankName;

SELECT b.BankName, b.City
FROM Banks b
LEFT JOIN Robberies r ON b.BankName = r.BankName AND b.City = r.City
LEFT JOIN Plans p ON b.BankName = p.BankName AND b.City = p.City
WHERE DATE_PART('year', p.PlannedDate) = DATE_PART('year', r.Date);


SELECT p.BankName, p.City, p.PlannedDate
FROM Plans p
LEFT JOIN Robberies r ON p.BankName = r.BankName AND p.City = r.City AND DATE_PART('year', p.PlannedDate) = DATE_PART('year', r.Date);
WHERE 


/* INCLUDED
Loanshark Bank Deerfield 2019 y
Inter-Gang Bank Evanston 2019 y
Dollar Grabbers Chicago 2019 y
Gun Chase Bank	Evanston	2019 y
PickPocket Bank	Deerfield	2019 y
PickPocket Bank	Chicago	2020 y
Hidden Treasure	Chicago	2020 y
Bad Bank	Chicago	2020 y
PickPocket Bank	Deerfield 	2019 y

NOT INCLUDED
NXP Bank Chicago 2019

*/