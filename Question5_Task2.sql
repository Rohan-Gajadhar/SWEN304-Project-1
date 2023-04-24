SELECT DISTINCT r.RobberId, r.Nickname
From Robbers r
INNER JOIN HasAccounts ha ON ha.RobberId = r.RobberId
LEFT JOIN Robberies rob ON rob.BankName != ha.BankName AND rob.City != ha.City; 