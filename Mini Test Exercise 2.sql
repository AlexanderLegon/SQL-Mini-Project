USE alexanderLegon_db;

--2.1

CREATE TABLE spartans
(
    spartanID INT IDENTITY(1,1) PRIMARY KEY,
    title VARCHAR(5),
    firstName  VARCHAR(20),
    lastName  VARCHAR(20),
    universityAttended  VARCHAR(30),
    courseTaken  VARCHAR(40),
    markAchieved  VARCHAR(5),
    
);

--2.2

INSERT INTO spartans VALUES
(
    'Mr','Alex','Lynch','Univesity Anglia Ruskin','Waste Management','1'
),
(
    'Mr','Thomas','Canfield','Univesity of Sports','Jumping with an oversized pokey stick','1'
),
(
    'Mr','Adrian','Wong','Univesity of Hogwarts','History of Magic','1'
),
(
    'Mr','Sotiris','Loizou','Univesity of Birmingjam','Sightseeing','1'
),
(
    'Mr','Karim','Kholer','Univesity of Oxford Brookes','Ballooning','1'
);

SELECT * FROM spartans;
