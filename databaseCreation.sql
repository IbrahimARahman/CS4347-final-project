CREATE TABLE Stadium (
    StadiumID INT PRIMARY KEY,
    Name VARCHAR(255),
    Location VARCHAR(255),
    Capacity INT,
    YearBuilt INT,
    FieldType VARCHAR(50),
    BuildingType VARCHAR(50),
    Owner VARCHAR(100)
);

CREATE TABLE Team (
    TeamID INT PRIMARY KEY,
    Name VARCHAR(100),
    Founded YEAR,
    City VARCHAR(100),
    StadiumID INT,
    FOREIGN KEY (StadiumID) REFERENCES Stadium(StadiumID)
);

CREATE TABLE Player (
    PlayerID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Stats TEXT
);

CREATE TABLE Coach (
    CoachID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    TeamID INT,
    Experience INT,
    PositionRole VARCHAR(100),
    Salary DECIMAL(15, 2),
    FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);

CREATE TABLE Scout (
    ScoutID INT PRIMARY KEY,
    ScoutName VARCHAR(100),
    TeamID INT,
    Experience INT,
    FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);

CREATE TABLE Schedule (
    GameID INT PRIMARY KEY,
    StadiumID INT,
    GameDate DATE,
    StartTime TIME,
    EndTime TIME,
    HomeTeamID INT,
    AwayTeamID INT,
    Broadcast VARCHAR(100),
    FOREIGN KEY (StadiumID) REFERENCES Stadium(StadiumID),
    FOREIGN KEY (HomeTeamID) REFERENCES Team(TeamID),
    FOREIGN KEY (AwayTeamID) REFERENCES Team(TeamID)
);

CREATE TABLE Contract (
    ContractID INT PRIMARY KEY,
    PlayerID INT,
    TeamID INT,
    StartDate DATE,
    EndDate DATE,
    ContractType VARCHAR(50),
    Salary DECIMAL(15, 2),
    FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID),
    FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);

-- Table for PotentialPlayer
CREATE TABLE PotentialPlayer (
    ScoutID INT,
    PlayerID INT,
    PlayerPotential DECIMAL(3,2),
    ReportDate DATE,
    Strength TEXT,
    Weakness TEXT,
    FOREIGN KEY (ScoutID) REFERENCES Scout(ScoutID),
    FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID),
    PRIMARY KEY (ScoutID, PlayerID)
);

-- Table for RosteredPlayer
CREATE TABLE RosteredPlayer (
    PlayerID INT,
    TeamID INT,
    ContractID INT,
    FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID),
    FOREIGN KEY (TeamID) REFERENCES Team(TeamID),
    FOREIGN KEY (ContractID) REFERENCES Contract(ContractID),
    PRIMARY KEY (PlayerID, TeamID)
);
