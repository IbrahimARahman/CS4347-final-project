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
    Sport VARCHAR(100),
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

-- Populate Stadium
INSERT INTO Stadium(StadiumID, Name, Location, Capacity, YearBuilt, FieldType, BuildingType, Owner) VALUES
(123450, 'Comet Coliseum', 'Richardson, TX', 14500, 1961, 'Football', 'Coliseum', 'UTD'),
(123451, 'Kyle Field', 'College Station, TX', 102733, 1927, 'Football', 'Stadium', 'Texas A&M'),
(123452, 'Darrell K Royal-Texas Memorial Stadium', 'Austin, TX', 100119, 1924, 'Football', 'Stadium', 'UT'),
(123453, 'UFCU Stadium', 'San Marcos, TX', 27149, 1981, 'Football', 'Stadium', 'Texas State'),
(123454, 'Alamodome', 'San Antonio, TX', 64000, 1993, 'Football', 'Dome', 'UTSA'),
(123455, 'Gerald J. Ford Stadium', 'Dallas, TX', 32000, 2000, 'Football', 'Stadium', 'SMU'),
(123456, 'Rice Stadium', 'Houston, TX', 47000, 1950, 'Football', 'Stadium', 'Rice'),
(123457, 'Amon G. Carter Stadium', 'Fort Worth, TX', 47000, 1930, 'Football', 'Stadium', 'TCU'),
(123458, 'McLane Stadium', 'Waco, TX', 45140, 2014, 'Football', 'Stadium', 'Baylor' ),
(123459, 'Jones AT&T Stadium', 'Lubbock, TX', 60229, 1947, 'Football', 'Stadium', 'Texas Tech');

-- Populate Team
INSERT INTO Team(TeamID, Name, Sport, City, Founded, StadiumID) VALUES
(24680, 'Comets', 'Football', 'Richardson, TX', 1961, 123450),
(24681, 'Aggies', 'Football', 'College Station, TX', 1894, 123451),
(24682, 'Longhorns', 'Football', 'Austin, TX', 1893, 123452),
(24683, 'Bobcats', 'Football', 'San Marcos, TX', 1904, 123453),
(24684, 'Roadrunners', 'Football', 'San Antonio, TX', 2011, 123454),
(24685, 'Mustangs', 'Football', 'Dallas, TX', 1915, 123455),
(24686, 'Owls', 'Football', 'Houston, TX', 1912, 123456),
(24687, 'Horned Frogs', 'Football', 'Fort Worth, TX', 1914, 123457),
(24688, 'Bears', 'Football', 'Waco, TX', 1899, 123458),
(24689, 'Red Raiders', 'Football', 'Lubbock, TX', 1923, 123459);

--Populate Coach
INSERT INTO Coach(CoachID, FirstName, LastName, PositionRole, TeamID, Experience, Salary) VALUES
(13570, 'Josh', 'Abrams', 'Head Coach', 24680, 4, 70000),
(13571, 'Kylie', 'Gonzalez', 'Offensive Coordinator', 24685, 1, 35000),
(13572, 'Rhett', 'Lashlee', 'Head Coach', 24685, 8, 100000),
(13573, 'Thomas', 'Lakefield', 'Head Coach', 24681, 12, 40000),
(13574, 'Scott', 'Symons', 'Defensive Coordinator', 24685, 9, 65000),
(13575, 'Piper', 'Isenberg', 'Head Coach', 24682, 13, 90000),
(13576, 'Harry', 'Harrison', 'Head Coach', 24684, 10, 80000),
(13577, 'Alex', 'Peabody', 'Head Coach', 24682, 12, 95000),
(13578, 'Sasha', 'Meghan', 'Assistant Coach', 24682, 3, 60000),
(13579, 'Roger', 'Scott', 'Defensive Coordinator', 24682, 2, 60000),
(13580, 'Ann', 'Jarvis', 'Head Coach', 24689, 5, 80000),
(13581, 'Alfonso', 'Mahoney', 'Head Coach', 24683, 8, 80000),
(13582, 'Brett', 'Lyons', 'Head Coach', 24686, 12, 100000),
(13583, 'Jenny', 'Rose', 'Head Coach', 24687, 8, 80000),
(13584, 'Wade', 'Crow', 'Assistant Coach', 24687, 4, 50000),
(13585, 'George', 'Rodriguez', 'Head Coach', 24688, 12, 95000);

--Populate Scout
INSERT INTO Scout(ScoutID, ScoutName, TeamID, Experience) VALUES
(56780, 'William Barrett', 24680, 3),
(56781, 'Jennifer Barley', 24680, 4),
(56782, 'Ed Cunnings', 24681, 8),
(56783, 'Maria Suarez', 24681, 10),
(56784, 'Gregory Brock', 24681, 1),
(56785, 'Travis Vincent', 24685, 2),
(56786, 'Marcelo Woolard', 24685, 7),
(56787, 'Corey Wilkins', 24682, 13),
(56788, 'Denise Padilla', 24682, 10),
(56789, 'Gwen Nixon', 24683, 7);
