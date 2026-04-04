/*
Question 1: Find the average proficiency for all superhero creatures.  
*/

--- creatureId of all superhero creatures
DROP TABLE IF EXISTS q1_superheroes;
CREATE TABLE q1_superheroes AS
SELECT creatureId
FROM creature
WHERE creatureType = 'superhero';

ALTER TABLE q1_superheroes
ADD PRIMARY KEY (creatureId);

--- join with achievement
DROP TABLE IF EXISTS q1_superhero_achievements;
CREATE TABLE q1_superhero_achievements AS
SELECT a.achId, a.creatureId, a.proficiency
FROM achievement a
INNER JOIN q1_superheroes s
    ON a.creatureId = s.creatureId;

ALTER TABLE q1_superhero_achievements
ADD PRIMARY KEY (achId);

--- aggregate function to find average
DROP TABLE IF EXISTS q1_avg_superhero_proficiency;
CREATE TABLE q1_avg_superhero_proficiency AS
SELECT AVG(proficiency) AS avg_proficiency
FROM q1_superhero_achievements;

/*
Question 2: Find total number of achievements tested in the United States. 
*/

DROP TABLE IF EXISTS q2_us_towns;
CREATE TABLE q2_us_towns AS
SELECT townId
FROM town
WHERE Country = 'United States';

ALTER TABLE q2_us_towns
ADD PRIMARY KEY (townId);

DROP TABLE IF EXISTS q2_us_achievements;
CREATE TABLE q2_us_achievements AS
SELECT a.achId
FROM achievement a
INNER JOIN q2_us_towns t
    ON a.test_townId = t.townId;

ALTER TABLE q2_us_achievements
ADD PRIMARY KEY (achId);

DROP TABLE IF EXISTS q2_total_us_achievements;
CREATE TABLE q2_total_us_achievements AS
SELECT COUNT(*) AS total_achievements
FROM q2_us_achievements;

/*
Question 3: Find the best achieving creature. i.e., creature with the highest average proficiency score. 
*/

DROP TABLE IF EXISTS q3_creature_avg_proficiency;
CREATE TABLE q3_creature_avg_proficiency AS
SELECT creatureId, AVG(proficiency) AS avg_proficiency
FROM achievement
GROUP BY creatureId;

ALTER TABLE q3_creature_avg_proficiency
ADD PRIMARY KEY (creatureId);

DROP TABLE IF EXISTS q3_best_avg_value;
CREATE TABLE q3_best_avg_value AS
SELECT MAX(avg_proficiency) AS best_avg_proficiency
FROM q3_creature_avg_proficiency;

DROP TABLE IF EXISTS q3_best_achieving_creature;
CREATE TABLE q3_best_achieving_creature AS
SELECT c.creatureId, c.avg_proficiency
FROM q3_creature_avg_proficiency c
INNER JOIN q3_best_avg_value b
    ON c.avg_proficiency = b.best_avg_proficiency;

ALTER TABLE q3_best_achieving_creature
ADD PRIMARY KEY (creatureId);



/*
Question 4: Find the name of the test town with the highest number of achievements. 
*/

DROP TABLE IF EXISTS q4_town_achievement_counts;
CREATE TABLE q4_town_achievement_counts AS
SELECT test_townId, COUNT(*) AS achievement_count
FROM achievement
GROUP BY test_townId;

ALTER TABLE q4_town_achievement_counts
ADD PRIMARY KEY (test_townId);

DROP TABLE IF EXISTS q4_max_town_achievement_count;
CREATE TABLE q4_max_town_achievement_count AS
SELECT MAX(achievement_count) AS max_achievement_count
FROM q4_town_achievement_counts;

DROP TABLE IF EXISTS q4_top_test_town;
CREATE TABLE q4_top_test_town AS
SELECT t.townName
FROM town t
INNER JOIN q4_town_achievement_counts c
    ON t.townId = c.test_townId
INNER JOIN q4_max_town_achievement_count m
    ON c.achievement_count = m.max_achievement_count;

/*
Question 5: Find the name of creatures that are aspiring to achieve a skill in “Bemidji”. 
*/

DROP TABLE IF EXISTS q5_bemidji_aspirations;
CREATE TABLE q5_bemidji_aspirations AS
SELECT creatureId
FROM aspiration
WHERE desired_townId = 'b';

ALTER TABLE q5_bemidji_aspirations
ADD PRIMARY KEY (creatureId);

DROP TABLE IF EXISTS q5_creatures_aspiring_bemidji;
CREATE TABLE q5_creatures_aspiring_bemidji AS
SELECT c.creatureName
FROM creature c
INNER JOIN q5_bemidji_aspirations a
    ON c.creatureId = a.creatureId;