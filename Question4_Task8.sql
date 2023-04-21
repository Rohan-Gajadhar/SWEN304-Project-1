SELECT s.Description, r.RobberId, r.Nickname
FROM Skills s
JOIN HasSkills hs ON s.SkillId = hs.SkillId
JOIN Robbers r ON r.RobberId = hs.RobberId
ORDER BY s.Description;
