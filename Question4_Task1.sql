SELECT BankName, City 
FROM Banks
WHERE (BankName, City) NOT IN (
    SELECT BankName, City 
    FROM Robberies 
);
