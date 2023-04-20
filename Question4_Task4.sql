SELECT BankName, City, NoAccounts
FROM Banks
WHERE City != 'Chicago'
ORDER BY NoAccounts ASC;