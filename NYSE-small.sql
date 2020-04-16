

DROP TABLE IF EXISTS DATES;
DROP TABLE IF EXISTS FORECAST;
DROP TABLE IF EXISTS TRADES;
DROP TABLE IF EXISTS SECURITIES;
DROP TABLE IF EXISTS SECTOR;

CREATE TABLE DATES (

ID INT NOT NULL,
Month INT NOT NULL,
Day	INT NOT NULL,
Year INT NOT NULL,
constraint validDay check(Day > 0 AND Day < 32),
constraint ValidMonth check(Month > 0 AND Month < 13),
PRIMARY KEY(ID)
);

LOAD DATA LOCAL INFILE 'date-relation-small.txt' INTO TABLE DATES; 

CREATE TABLE FORECAST (

DateID INT NOT NULL,
Precipitation decimal(5,2) NOT NULL,
MaxTemp INT NOT NULL,
MinTemp INT NOT NULL,
FOREIGN KEY (DateID) references Dates(ID),
PRIMARY KEY (DateID, Precipitation, MaxTemp, MinTemp)

);



CREATE TABLE TRADES (
  DateID INT NOT NULL,
  Symbol VARCHAR(6) NOT NULL,
  Open decimal(6,2) NOT NULL,
  High decimal(6,2) NOT NULL,
  Low decimal(6,2) NOT NULL,
  Close decimal(6,2) NOT NULL,
  Volume INT NOT NULL,
  constraint positive check(Open > 0 AND High > 0 AND LOW > 0 AND CLOSE > 0 AND Volume > 0),
  FOREIGN KEY (DateID) references DATES(ID),
  PRIMARY KEY(DateID,Symbol)
);


CREATE TABLE SECTOR (
ID INT NOT NULL,
SectorName VARCHAR(60) NOT NULL,
PRIMARY KEY(ID)
);

CREATE TABLE SECURITIES (
  Symbol VARCHAR(6),
  SectorID INT NOT NULL,
  CompanyName VARCHAR(30) NOT NULL,
  FOREIGN KEY (SectorID) references SECTOR(ID),
  PRIMARY KEY(Symbol)
);



LOAD DATA LOCAL INFILE 'forcast-relation-small.txt' INTO TABLE FORECAST;
LOAD DATA LOCAL INFILE 'sector-relation-small.txt' INTO TABLE TRADES;
LOAD DATA LOCAL INFILE 'security sector-relation-small.txt' INTO TABLE SECURITIES;
LOAD DATA LOCAL INFILE 'trade-relation-small.txt' INTO TABLE SECTOR;



