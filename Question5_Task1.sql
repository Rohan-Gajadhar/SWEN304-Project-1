SELECT DISTINCT p.BankName, p.City
FROM Plans p
LEFT JOIN Robberies r ON p.BankName = r.BankName AND p.City = r.City AND p.PlannedDate < r.Date;

/* INCLUDED
Loanshark Bank Deerfield 2019 
Inter-Gang Bank Evanston 2019 
Dollar Grabbers Chicago 2019 
Gun Chase Bank	Evanston	2019 
PickPocket Bank	Deerfield	2019 
PickPocket Bank	Chicago	2020 
Hidden Treasure	Chicago	2020 
Bad Bank	Chicago	2020

NOT INCLUDED
NXP Bank Chicago 2019
*/