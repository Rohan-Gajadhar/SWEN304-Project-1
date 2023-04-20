SELECT b.BankName, b.City
FROM Banks b
JOIN HasAccounts ha ON b.BankName = ha.BankName AND b.City = ha.City
JOIN Robbers r ON ha.RobberId = r.RobberId
WHERE r.Nickname = 'Al Capone';