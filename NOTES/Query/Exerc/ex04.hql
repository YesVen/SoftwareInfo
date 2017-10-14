CREATE DATABASE IF NOT EXISTS esaklan1 COMMENT 'THIS IS THE FIRST LANDING AREA' WITH DBPROPERTIES('owner'='Esakkipillai');
USE esaklan1;
--Creating the Table Schema 
CREATE EXTERNAL TABLE IF NOT EXISTS esaklan1.USEREXT(
FirstName STRING ,
LastName STRING,
CompanyName STRING,
Address STRING,
COUNTRY STRING,
City STRING , 
State STRING ,
Post BIGINT,
Phone ARRAY<STRING>,
Email MAP<STRING,STRING> ,
WebUrl STRING
)
COMMENT 'FIRST EXTERNAL TABLE WITH ORC FORMAT'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
MAP COLLECTION TERMINATED BY ':'
LINES TERMINATED BY '\n'
STORED AS ORC
LOCATION '/user/esakkipillai/hadoop/Data/Ex04';
TBLPROPERTIES("orc.compress"="SNAPPY")
--Loading The Data
INSERT OVERWRITE  TABLE esaklan1.USEREXT SELECT * FROM esakraw.USERRECORDEXT;
--CHECKING THE DATA IN THE NEW LANDING AREA
SELECT * FROM esaklan1.USEREXT;