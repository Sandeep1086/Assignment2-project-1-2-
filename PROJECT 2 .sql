create database world_population_data
use world_population_data


CREATE TABLE cia (
	country VARCHAR(45) NOT NULL, 
	area DECIMAL(38, 0), 
	birth_rate DECIMAL(38, 2), 
	death_rate DECIMAL(38, 2), 
	infant_mortality_rate DECIMAL(38, 2), 
	internet_users DECIMAL(38, 0), 
	life_exp_at_birth DECIMAL(38, 2), 
	maternal_mortality_rate DECIMAL(38, 0), 
	net_migration_rate DECIMAL(38, 2), 
	population DECIMAL(38, 0), 
	population_growth_rate DECIMAL(38, 2)
);



SET SESSION sql_mode = ''

load data infile
'E:/cia_factbook.csv'
into table cia
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
IGNORE 1 ROWS ;

select * from cia

1. Which country has the highest population?

select country , population  from cia order by population desc limit 1 ;

2. Which country has the least number of people?

select country , population  from cia order by population asc limit 20 ;

3. Which country is witnessing the highest population growth?

select country , population_growth_rate from cia order by population desc limit 1 ;

4. Which country has an extraordinary number for the population?

select country , population as extraordinary_population from cia order by population desc limit 1 ;

5. Which is the most densely populated country in the world?

select country , population as most_densely_populated_country_with_population  from cia order by population desc limit 1 ;










