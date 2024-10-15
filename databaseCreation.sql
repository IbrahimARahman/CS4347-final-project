CREATE TABLE Stadium (
	StadiumID INT PRIMARY KEY,
	Name VARCHAR(30),
	Location VARCHAR(75),
	Capacity INT,
	YearBuilt INT,
	FieldType VARCHAR(30),
	BuildingType VARCHAR(30),
	Owner VARCHAR(50),
);

CREATE TABLE Town (
	TownID INT PRIMARY KEY,
	Name VARCHAR(30),
	Population INT,
	StadiumID INT,
	State VARCHAR(30),
	Founded DATE,
	AvgTemp FLOAT,
	Size FLOAT,
	FOREIGN KEY (StadiumID) REFERENCES Stadium(StadiumID)
);

CREATE TABLE Team (
	TeamID INT PRIMARY KEY,
	Name VARCHAR(30),
	City VARCHAR(30),
	StadiumID INT,
	Founded DATE,
	FOREIGN KEY (StadiumID) REFERENCES Stadium(StadiumID)
);

CREATE TABLE COACH (
	CoachID INT PRIMARY KEY,
	FirstName VARCHAR(15),
	LastName VARCHAR(15),
	Role VARCHAR(20),
	TeamID INT,
	Experience INT,
	PositionRole VARCHAR(20),
	Salary DECIMAL(10,2),
	FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);

CREATE TABLE Schedule (
	ScheduleID INT PRIMARY KEY,
	GameDate DATE,
	StartTime TIME,
	EndTime TIME,
	HomeTeamID INT,
	AwayTeamID INT,
	StadiumID INT,
	Broadcast VARCHAR(50),
	Weather VARCHAR(30),
	FOREIGN KEY (HomeTeamID) REFERENCES Team(TeamID),
	FOREIGN KEY (AwayTeamID) REFERENCES Team(TeamID),
	FOREIGN KEY (StadiumID) REFERENCES Stadium(StadiumID)
);

CREATE TABLE Player (
	PlayerID INT PRIMARY KEY,
	FirstName VARCHAR(15),
	LastName VARCHAR(15),
	Position VARCHAR(20),
	Height FLOAT,
	Weight FLOAT,
	DOB DATE,
	TeamID INT,
	Stats VARCHAR(200),
	InjuryStatus VARCHAR(30),
	FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);

CREATE TABLE Scouting (
	ScoutID INT PRIMARY KEY,
	ScoutName VARCHAR(30),
	PlayerID INT,
	ReportDate DATE,
	Report VARCHAR(200),
	Strengths VARCHAR(100),
	Weaknesses VARCHAR(100),
	PlayerPotential VARCHAR(200),
	TeamID INT,
	FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID),
	FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);

CREATE TABLE Contracts (
	ContractID INT PRIMARY KEY,
	PlayerID INT,
	TeamID INT,
	StartDate DATE,
	EndDate DATE,
	Salary Decimal(10,2),
	ContractType VARCHAR(30),
	FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID),
	FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);

ALTER TABLE Player
ADD ContractID INT,
FOREIGN KEY (ContractID) REFERENCES Contracts(ContractID);
