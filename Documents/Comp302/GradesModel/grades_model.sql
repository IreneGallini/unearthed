USE igallini;

DROP TABLE IF EXISTS TeamProjectPhase;
DROP TABLE IF EXISTS TeamAssignment;
DROP TABLE IF EXISTS IndividualAssignment;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS ProjectPhase;
DROP TABLE IF EXISTS Assignment;
DROP TABLE IF EXISTS Team;

CREATE TABLE Team(
	Number INT,
	PRIMARY KEY (Number)
) ENGINE=InnoDB;

CREATE TABLE Assignment(
	Name VARCHAR(50),
	TotalScore INT,
	Type VARCHAR(50),
	PRIMARY KEY (Name)
) ENGINE=InnoDB;

CREATE TABLE ProjectPhase(
	ID INT,
	TotalScore INT,
	PRIMARY KEY (ID)
) ENGINE=InnoDB;

CREATE TABLE Student(
	ID INT,
	Name VARCHAR(50),
	GraduatingYear VARCHAR(50),
	teamNumber INT,
	PRIMARY KEY (ID),
	FOREIGN KEY (teamNumber) REFERENCES Team(Number)
) ENGINE=InnoDB;

CREATE TABLE IndividualAssignment (
	StudentID INT,
	AssignmentName VARCHAR(50),
	IA_Score INT,
	PRIMARY KEY (StudentID, AssignmentName),
	FOREIGN KEY (StudentID) REFERENCES Student(ID),
	FOREIGN KEY (AssignmentName) REFERENCES Assignment(Name)
) ENGINE=InnoDB;


CREATE TABLE TeamAssignment (
	TeamNumber INT,
	AssignmentName VARCHAR(50),
	TA_Score INT,
	PRIMARY KEY (TeamNumber, AssignmentName),
	FOREIGN KEY (TeamNumber) REFERENCES Team(Number),
	FOREIGN KEY (AssignmentName) REFERENCES Assignment(Name)
) ENGINE=InnoDB;

CREATE TABLE TeamProjectPhase (
	TeamNumber INT,
	PhaseID INT,
	PRIMARY KEY (TeamNumber, PhaseID),
	FOREIGN KEY (TeamNumber) REFERENCES Team(Number),
	FOREIGN KEY (PhaseID) REFERENCES ProjectPhase(ID)
) ENGINE=InnoDB;
