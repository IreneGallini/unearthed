--- Query 1 ---
DROP TABLE IF EXISTS q1_achievement_filtered;

CREATE TABLE q1_achievement_filtered AS
SELECT *
FROM achievement
WHERE proficiency>3 AND proficiency<>6;

ALTER TABLE q1_achievement_filtered
ADD PRIMARY KEY (achId);

--- Query 2 ---
DROP TABLE IF EXISTS q2_achievement_skill_z;

CREATE TABLE q2_achievement_skill_z AS
SELECT * 
FROM achievement
WHERE skillCode='Z';

ALTER TABLE q2_achievement_skill_z
ADD PRIMARY KEY (achId);

--- Query 3 ---
DROP TABLE IF EXISTS q3_skill_projection;

CREATE TABLE q3_skill_projection AS
SELECT skillCode, skillDescription
FROM skill;

ALTER TABLE q3_skill_projection
ADD PRIMARY KEY (skillCode);
