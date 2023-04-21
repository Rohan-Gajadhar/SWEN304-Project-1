SELECT r.RobberId, r.Nickname, SUM(a.Share) AS TotalEarnings
FROM Robbers r
JOIN Accomplices a ON r.RobberId = a.RobberId
GROUP BY r.RobberId
HAVING SUM(a.Share) > 40000
ORDER BY TotalEarnings DESC;