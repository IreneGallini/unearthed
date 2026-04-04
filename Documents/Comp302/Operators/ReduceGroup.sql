/* Question 1: Find each skill that has been achieved by at least one creature.
from achievement
group by distinct skillCode
*/ 
DROP TABLE IF EXISTS skill_code_achieved;

CREATE TABLE skill_code_achieved AS
SELECT DISTINCT skillCode 
FROM achievement;

ALTER TABLE skill_code_achieved
ADD PRIMARY KEY (skillCode);


/*Question 2: Find each creature that has achieved more than one skill.
intermediate table with skill count per creature -> subquery
filter for count>1
*/
DROP TABLE IF EXISTS creatures_multiple_skills;

CREATE TABLE creatures_multiple_skills AS
SELECT creatureId 
FROM (
    SELECT creatureId, COUNT(DISTINCT skillCode) as cr_skill_count
    FROM achievement
    GROUP BY creatureId
) as cr_id_skill_counts
WHERE cr_skill_count>1;

ALTER TABLE creatures_multiple_skills
ADD PRIMARY KEY (creatureId);


/* Question 3: Find each creature whose average proficiency score is greater than 10.
proficiency -> (creatureId, skillCode)
*/
DROP TABLE IF EXISTS creatures_avg_proficiency_gt_10;

CREATE TABLE creatures_avg_proficiency_gt_10 AS
SELECT creatureId
FROM (
    SELECT creatureId, AVG(proficiency) AS avg_proficiency
    FROM achievement
    GROUP BY creatureId
) as creature_avg
WHERE avg_proficiency>10;

ALTER TABLE creatures_avg_proficiency_gt_10
ADD PRIMARY KEY (creatureId);

/* Question 4: Find countries with more than one town.
Group town by country, count towns, then keep only towns with count >1
*/ 
DROP TABLE IF EXISTS countries_multiple_towns;

CREATE TABLE countries_multiple_towns AS
SELECT Country
FROM (
    SELECT Country, COUNT(townId) AS town_count
    FROM town
    WHERE Country IS NOT NULL
    GROUP BY Country
) AS country_town_counts
WHERE town_count > 1;

ALTER TABLE countries_multiple_towns
ADD PRIMARY KEY (Country);

/* Question 5: Find skills whose difference between minimum and maximum proficiency is greater than 10.
maxProficiency - minProficiency
then keep only skills where the difference is > 10
*/
DROP TABLE IF EXISTS skills_prof_range_gt_10;

CREATE TABLE skills_prof_range_gt_10 AS
SELECT skillCode
FROM skill
WHERE (maxProficiency - minProficiency) > 10;

ALTER TABLE skills_prof_range_gt_10
ADD PRIMARY KEY (skillCode);
