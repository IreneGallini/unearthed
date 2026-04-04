/*
Question 1: Find creatures that can swim or are of type superhero

- filter creatures that can swim
- filter creatures type of superhero
- join 

*/
DROP TABLE IF EXISTS q1_swim_creatures;
CREATE TABLE q1_swim_creatures AS
SELECT DISTINCT creatureId FROM achievement
WHERE skillCode='E';

ALTER TABLE q1_swim_creatures
ADD PRIMARY KEY (creatureId);

DROP TABLE IF EXISTS q1_superheroes;
CREATE TABLE q1_superheroes AS
SELECT creatureId
FROM creature
WHERE creatureType = 'superhero';

ALTER TABLE q1_superheroes
ADD PRIMARY KEY (creatureId);

DROP TABLE IF EXISTS q1_swim_or_superhero;
CREATE TABLE q1_swim_or_superhero AS
SELECT creatureId
FROM q1_swim_creatures
UNION
SELECT creatureId
FROM q1_superheroes;

ALTER TABLE q1_swim_or_superhero
ADD PRIMARY KEY (creatureId);


/*
Question 2: Find creatures that achieved a skill in both London and Seattle
townId='le' or 'sw'
*/

DROP TABLE IF EXISTS q2_london_creatures;
CREATE TABLE q2_london_creatures AS
SELECT DISTINCT creatureId
FROM achievement
WHERE test_townId = 'le';

ALTER TABLE q2_london_creatures
ADD PRIMARY KEY (creatureId);


DROP TABLE IF EXISTS q2_seattle_creatures;
CREATE TABLE q2_seattle_creatures AS
SELECT DISTINCT creatureId
FROM achievement
WHERE test_townId = 'sw';

ALTER TABLE q2_seattle_creatures
ADD PRIMARY KEY (creatureId);


DROP TABLE IF EXISTS q2_london_and_seattle;
CREATE TABLE q2_london_and_seattle AS
SELECT l.creatureId
FROM q2_london_creatures l
INNER JOIN q2_seattle_creatures s
    ON l.creatureId = s.creatureId;

ALTER TABLE q2_london_and_seattle
ADD PRIMARY KEY (creatureId);

/*
Question 3: Find each good achieving creature that cannot swim. Good achievements are achievements with proficiency > 80.
*/

DROP TABLE IF EXISTS q3_good_achievers;
CREATE TABLE q3_good_achievers AS
SELECT DISTINCT creatureId
FROM achievement
WHERE proficiency > 80;

ALTER TABLE q3_good_achievers
ADD PRIMARY KEY (creatureId);


DROP TABLE IF EXISTS q3_swimmers;
CREATE TABLE q3_swimmers AS
SELECT DISTINCT creatureId
FROM achievement
WHERE skillCode = 'E';

ALTER TABLE q3_swimmers
ADD PRIMARY KEY (creatureId);


DROP TABLE IF EXISTS q3_good_achievers_cannot_swim;
CREATE TABLE q3_good_achievers_cannot_swim AS
SELECT g.creatureId
FROM q3_good_achievers g
LEFT JOIN q3_swimmers s
    ON g.creatureId = s.creatureId
WHERE s.creatureId IS NULL;

ALTER TABLE q3_good_achievers_cannot_swim
ADD PRIMARY KEY (creatureId);

/*
Question 4: Find each creature that has not achieved a skill.
*/

DROP TABLE IF EXISTS q4_all_creatures;
CREATE TABLE q4_all_creatures AS
SELECT creatureId
FROM creature;

ALTER TABLE q4_all_creatures
ADD PRIMARY KEY (creatureId);


DROP TABLE IF EXISTS q4_achieving_creatures;
CREATE TABLE q4_achieving_creatures AS
SELECT DISTINCT creatureId
FROM achievement;

ALTER TABLE q4_achieving_creatures
ADD PRIMARY KEY (creatureId);


DROP TABLE IF EXISTS q4_creatures_no_achievement;
CREATE TABLE q4_creatures_no_achievement AS
SELECT c.creatureId
FROM q4_all_creatures c
LEFT JOIN q4_achieving_creatures a
    ON c.creatureId = a.creatureId
WHERE a.creatureId IS NULL;

ALTER TABLE q4_creatures_no_achievement
ADD PRIMARY KEY (creatureId);

/*
Question 5: Find each creature that has not achieved a team skill
*/

DROP TABLE IF EXISTS q5_all_creatures;
CREATE TABLE q5_all_creatures AS
SELECT creatureId
FROM creature;

ALTER TABLE q5_all_creatures
ADD PRIMARY KEY (creatureId);


DROP TABLE IF EXISTS q5_team_skill_achievers;
CREATE TABLE q5_team_skill_achievers AS
SELECT DISTINCT a.creatureId
FROM achievement a
INNER JOIN teamSkill t
    ON a.skillCode = t.skillCode;

ALTER TABLE q5_team_skill_achievers
ADD PRIMARY KEY (creatureId);


DROP TABLE IF EXISTS q5_creatures_no_team_skill;
CREATE TABLE q5_creatures_no_team_skill AS
SELECT c.creatureId
FROM q5_all_creatures c
LEFT JOIN q5_team_skill_achievers t
    ON c.creatureId = t.creatureId
WHERE t.creatureId IS NULL;

ALTER TABLE q5_creatures_no_team_skill
ADD PRIMARY KEY (creatureId);