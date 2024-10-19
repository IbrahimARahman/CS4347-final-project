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

CREATE TABLE Player (
    PlayerID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Stats TEXT
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

--Populate Schedule
INSERT INTO Schedule(GameID, StadiumID, GameDate, StartTime, EndTime, HomeTeamID, AwayTeamID, Broadcast) VALUES
(45670, 123450, '2024-09-12', '19:00:00', '21:30:00', 24680, 24681, 'ESPN'),
(45671, 123451, '2024-09-19', '18:00:00', '20:30:00', 24681, 24682, 'CBS Sports'),
(45672, 123452, '2024-09-25', '17:30:00', '20:00:00', 24682, 24683, 'Fox Sports'),
(45673, 123453, '2024-10-03', '18:30:00', '21:00:00', 24683, 24684, 'ABC'),
(45674, 123454, '2024-10-10', '19:00:00', '21:30:00', 24684, 24685, 'NBC'),
(45675, 123455, '2024-10-17', '16:00:00', '18:30:00', 24685, 24686, 'ESPN'),
(45676, 123456, '2024-10-24', '18:00:00', '20:30:00', 24686, 24687, 'CBS Sports'),
(45677, 123457, '2024-10-31', '20:00:00', '22:30:00', 24687, 24688, 'Fox Sports'),
(45678, 123458, '2024-11-07', '17:00:00', '19:30:00', 24688, 24689, 'ABC'),
(45679, 123459, '2024-11-14', '19:00:00', '21:30:00', 24689, 24680, 'NBC');

--Populate Player
INSERT INTO Player(PlayerID, FirstName, LastName, Stats) VALUES
(56791, 'David', 'Johnson', 'Games Played: 30, Total Yards: 3200, Touchdowns: 28'),
(56792, 'Michael', 'Smith', 'Games Played: 28, Total Yards: 2900, Touchdowns: 26'),
(56793, 'Chris', 'Williams', 'Games Played: 32, Total Yards: 3500, Touchdowns: 30'),
(56794, 'James', 'Brown', 'Games Played: 25, Total Yards: 2600, Touchdowns: 20'),
(56795, 'Robert', 'Davis', 'Games Played: 29, Total Yards: 3100, Touchdowns: 24'),
(56796, 'Daniel', 'Miller', 'Games Played: 27, Total Yards: 2800, Touchdowns: 23'),
(56797, 'Joshua', 'Wilson', 'Games Played: 31, Total Yards: 3300, Touchdowns: 29'),
(56798, 'John', 'Moore', 'Games Played: 26, Total Yards: 2700, Touchdowns: 22'),
(56799, 'Matthew', 'Taylor', 'Games Played: 30, Total Yards: 3200, Touchdowns: 25'),
(56800, 'Andrew', 'Anderson', 'Games Played: 28, Total Yards: 2900, Touchdowns: 27');

--Populate Potential Player
INSERT INTO PotentialPlayer(ScoutID, PlayerID, PlayerPotential, ReportDate, Strength, Weakness) VALUES
(56780, 56791, 4.5, '2024-09-01', 'Speed and agility', 'Injury prone'),
(56781, 56792, 4.2, '2024-09-05', 'Strength and vision', 'Low stamina'),
(56782, 56793, 4.7, '2024-09-12', 'Tactical intelligence', 'Lacks leadership'),
(56783, 56794, 4.3, '2024-09-18', 'Defensive skills', 'Needs better endurance'),
(56784, 56795, 4.6, '2024-09-22', 'Footwork and balance', 'Slow starts'),
(56785, 56796, 4.4, '2024-09-25', 'Playmaking ability', 'Short pass accuracy'),
(56786, 56797, 4.1, '2024-10-01', 'Versatile position player', 'Lacks consistency'),
(56787, 56798, 4.8, '2024-10-05', 'Speed and stamina', 'Poor under pressure'),
(56788, 56799, 4.5, '2024-10-09', 'Leadership and focus', 'Weak footwork'),
(56789, 56800, 4.9, '2024-10-14', 'Powerful strikes', 'Lacks agility');

--Populate RosteredPlayer
INSERT INTO RosteredPlayer(PlayerID, TeamID, ContractID) VALUES
(56791, 24680, 87650),
(56792, 24681, 87651),
(56793, 24682, 87652),
(56794, 24683, 87653),
(56795, 24684, 87654),
(56796, 24685, 87655),
(56797, 24686, 87656),
(56798, 24687, 87657),
(56799, 24688, 87658),
(56800, 24689, 87659);

--Populate Contract
INSERT INTO Contract(ContractID, PlayerID, TeamID, StartDate, EndDate, ContractType, Salary) VALUES
(87650, 56791, 24680, '2024-05-01', '2027-04-30', 'Professional', 95000.00),
(87651, 56792, 24681, '2024-06-01', '2026-06-01', 'Professional', 85000.00),
(87652, 56793, 24682, '2023-04-01', '2026-04-01', 'Professional', 120000.00),
(87653, 56794, 24683, '2024-07-01', '2025-07-01', 'Professional', 105000.00),
(87654, 56795, 24684, '2023-08-01', '2026-08-01', 'Professional', 110000.00),
(87655, 56796, 24685, '2024-09-01', '2026-09-01', 'Professional', 98000.00),
(87656, 56797, 24686, '2024-10-01', '2025-10-01', 'Professional', 115000.00),
(87657, 56798, 24687, '2023-11-01', '2026-11-01', 'Professional', 102000.00),
(87658, 56799, 24688, '2024-12-01', '2027-12-01', 'Professional', 96000.00),
(87659, 56800, 24689, '2023-01-01', '2026-01-01', 'Professional', 109000.00);
