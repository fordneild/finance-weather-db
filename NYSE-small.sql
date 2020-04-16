

DROP TABLE IF EXISTS FORECAST;
DROP TABLE IF EXISTS TRADES;
DROP TABLE IF EXISTS SECURITIES;
DROP TABLE IF EXISTS SECTOR;
DROP TABLE IF EXISTS DATES;

CREATE TABLE DATES (

ID INT NOT NULL,
MM  INT NOT NULL,
DD	INT NOT NULL,
YY  INT NOT NULL,
constraint validDay check(DD > 0 AND DD < 32),
constraint ValidMonth check(MM > 0 AND MM < 13),
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
  OpenPrice decimal(6,2) NOT NULL,
  High decimal(6,2) NOT NULL,
  Low decimal(6,2) NOT NULL,
  ClosePrice decimal(6,2) NOT NULL,
  Volume INT NOT NULL,
  constraint positive check(OpenPrice > 0 AND High > 0 AND LOW > 0 AND ClosePrice > 0 AND Volume > 0),
  FOREIGN KEY (DateID) references DATES(ID),
  PRIMARY KEY(DateID,Symbol)
);


CREATE TABLE SECTOR (
ID INT NOT NULL,
SectorName VARCHAR(60) NOT NULL,
PRIMARY KEY(ID)
);

CREATE TABLE SECURITIES (
  Symbol VARCHAR(6) NOT NULL,
  SectorID INT NOT NULL,
  CompanyName VARCHAR(30) NOT NULL,
  FOREIGN KEY (SectorID) references SECTOR(ID),
  PRIMARY KEY(Symbol)
);



LOAD DATA LOCAL INFILE 'forcast-relation-small.txt' INTO TABLE FORECAST;
LOAD DATA LOCAL INFILE 'sector-relation-small.txt' INTO TABLE TRADES;
LOAD DATA LOCAL INFILE 'security sector-relation-small.txt' INTO TABLE SECURITIES;
LOAD DATA LOCAL INFILE 'trade-relation-small.txt' INTO TABLE SECTOR;



