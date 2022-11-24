create database Accident
use Accident


CREATE TABLE Accident_2015 (
	`Accident_Index` VARCHAR(13) NOT NULL, 
	`Location_Easting_OSGR` DECIMAL(38, 0), 
	`Location_Northing_OSGR` DECIMAL(38, 0), 
	`Longitude` DECIMAL(38, 6), 
	`Latitude` DECIMAL(38, 6), 
	`Police_Force` DECIMAL(38, 0) NOT NULL, 
	`Accident_Severity` DECIMAL(38, 0) NOT NULL, 
	`Number_of_Vehicles` DECIMAL(38, 0) NOT NULL, 
	`Number_of_Casualties` DECIMAL(38, 0) NOT NULL, 
	`Date` VARCHAR(10) NOT NULL, 
	`Day_of_Week` DECIMAL(38, 0) NOT NULL, 
	`Time` DATETIME, 
	`Local_Authority_(District)` DECIMAL(38, 0) NOT NULL, 
	`Local_Authority_(Highway)` VARCHAR(9) NOT NULL, 
	`1st_Road_Class` DECIMAL(38, 0) NOT NULL, 
	`1st_Road_Number` DECIMAL(38, 0) NOT NULL, 
	`Road_Type` DECIMAL(38, 0) NOT NULL, 
	`Speed_limit` DECIMAL(38, 0) NOT NULL, 
	`Junction_Detail` DECIMAL(38, 0) NOT NULL, 
	`Junction_Control` DECIMAL(38, 0) NOT NULL, 
	`2nd_Road_Class` DECIMAL(38, 0) NOT NULL, 
	`2nd_Road_Number` DECIMAL(38, 0) NOT NULL, 
	`Pedestrian_Crossing-Human_Control` DECIMAL(38, 0) NOT NULL, 
	`Pedestrian_Crossing-Physical_Facilities` DECIMAL(38, 0) NOT NULL, 
	`Light_Conditions` DECIMAL(38, 0) NOT NULL, 
	`Weather_Conditions` DECIMAL(38, 0) NOT NULL, 
	`Road_Surface_Conditions` DECIMAL(38, 0) NOT NULL, 
	`Special_Conditions_at_Site` DECIMAL(38, 0) NOT NULL, 
	`Carriageway_Hazards` DECIMAL(38, 0) NOT NULL, 
	`Urban_or_Rural_Area` DECIMAL(38, 0) NOT NULL, 
	`Did_Police_Officer_Attend_Scene_of_Accident` DECIMAL(38, 0) NOT NULL, 
	`LSOA_of_Accident_Location` VARCHAR(9)
);

SET SESSION sql_mode = ''

load data infile
'E:/Accident_2015.csv'
into table Accident_2015
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
IGNORE 1 ROWS ;

select * from Accident_2015


CREATE TABLE vehicle_2015 (
	`Accident_Index` VARCHAR(13) NOT NULL, 
	`Vehicle_Reference` DECIMAL(38, 0) NOT NULL, 
	`Vehicle_Type` DECIMAL(38, 0) NOT NULL, 
	`Towing_and_Articulation` DECIMAL(38, 0) NOT NULL, 
	`Vehicle_Manoeuvre` DECIMAL(38, 0) NOT NULL, 
	`Vehicle_Location-Restricted_Lane` DECIMAL(38, 0) NOT NULL, 
	`Junction_Location` DECIMAL(38, 0) NOT NULL, 
	`Skidding_and_Overturning` DECIMAL(38, 0) NOT NULL, 
	`Hit_Object_in_Carriageway` DECIMAL(38, 0) NOT NULL, 
	`Vehicle_Leaving_Carriageway` DECIMAL(38, 0) NOT NULL, 
	`Hit_Object_off_Carriageway` DECIMAL(38, 0) NOT NULL, 
	`1st_Point_of_Impact` DECIMAL(38, 0) NOT NULL, 
	`Was_Vehicle_Left_Hand_Drive?` DECIMAL(38, 0) NOT NULL, 
	`Journey_Purpose_of_Driver` DECIMAL(38, 0) NOT NULL, 
	`Sex_of_Driver` DECIMAL(38, 0) NOT NULL, 
	`Age_of_Driver` DECIMAL(38, 0) NOT NULL, 
	`Age_Band_of_Driver` DECIMAL(38, 0) NOT NULL, 
	`Engine_Capacity_(CC)` DECIMAL(38, 0) NOT NULL, 
	`Propulsion_Code` DECIMAL(38, 0) NOT NULL, 
	`Age_of_Vehicle` DECIMAL(38, 0) NOT NULL, 
	`Driver_IMD_Decile` DECIMAL(38, 0) NOT NULL, 
	`Driver_Home_Area_Type` DECIMAL(38, 0) NOT NULL, 
	`Vehicle_IMD_Decile` DECIMAL(38, 0) NOT NULL
);



SET SESSION sql_mode = ''

load data infile
'E:/vehicle_2015.csv'
into table vehicle_2015
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
IGNORE 1 ROWS ;

select * from vehicle_2015 


1. Evaluate the median severity value of accidents caused by various Motorcycles.

with median_severity as ( select Accident_Index , Accident_Severity, avg(Accident_Severity) , Vehicle_Type  , count(Accident_Severity) ,
(count(Accident_Severity)/2) , (count(Accident_Severity)/2+1)  from Accident_2015 
join vehicle_2015 
using (Accident_Index) where Vehicle_Type = 2)

select Accident_Severity as median_of_Accident_Severity  from median_severity 


2. Evaluate Accident Severity and Total Accidents per Vehicle Type

select Accident_Severity , Number_of_vehicles , sum(Number_of_Vehicles = 2) , sum(Number_of_Vehicles = 1) , sum(Number_of_Vehicles = 3) , 
sum(Number_of_Vehicles = 4) , sum(Number_of_Vehicles = 5) , sum(Number_of_Vehicles = 6) from Accident_2015


3. Calculate the Average Severity by vehicle type.

select Accident_Severity , Vehicle_Type , avg(Accident_Severity) from Accident_2015 
join vehicle_2015 
using (Accident_Index) group by Vehicle_Type

4. Calculate the Average Severity and Total Accidents by Motorcycle.

select Accident_Severity , Vehicle_Type , count(Accident_Index) , avg(Accident_Severity) from Accident_2015 
join vehicle_2015 
using (Accident_Index) where Vehicle_Type = 2











