CREATE TABLE crea_ach_prof AS
-- REDUCE
SELECT DISTINCT creatureId FROM
-- FILTER 
(SELECT * FROM achievement WHERE proficiency<10);


CREATE TABLE ach_creatyre_with_cnts AS
SELECT creatureId, COUNT(skillCode) AS ach_cnt
FROM achievement
GROUP BY creatureId;

-- find average proficiency for each achieving creature
CREATE TABLE ach_creature_with_avg AS
SELECT creatureId, AVG(skillCode) AS ach_cnt
FROM achievement
GROUP BY creatureId;