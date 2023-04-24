SELECT r.RobberId, r.Nickname, s.Description
FROM Robbers r
JOIN HasSkills hs ON r.RobberId = hs.RobberId
JOIN Skills s ON hs.SkillId = s.SkillId
WHERE r.RobberId IN (
    SELECT RobberId
    FROM HasSkills
    GROUP BY RobberId
    HAVING COUNT(*) >= 2
)
AND hs.Preference = 1;

