USE igallini;
-- Drop tables if they already exist
DROP TABLE IF EXISTS division;
DROP TABLE IF EXISTS region;

-- Create entity region
CREATE TABLE region
(
ID int NOT NULL PRIMARY KEY,
budget DECIMAL(13,4)
) engine=InnoDB;

-- Create entity division
CREATE TABLE division
(
ID int NOT NULL,
name varchar(255),
region_ID int NOT NULL
) engine=InnoDB;

-- Add Foreign Key
ALTER TABLE division ADD FOREIGN KEY (region_ID) REFERENCES region (ID);
-- Specify Primary Key
ALTER TABLE division ADD PRIMARY KEY (ID, region_ID);
