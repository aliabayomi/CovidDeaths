SELECT *
FROM Covid_Database.CovidTable1;

-- Total Deaths percentage in the UK
SELECT date, total_cases, total_deaths, (total_deaths/population)*100 as DeathPercentage 
FROM Covid_Database.CovidTable1
where location like 'united kingdom' and total_cases <> '' ;

-- Total Deaths Counts by Country
SELECT location, MAX(cast(total_deaths as unsigned)) as TotalDeathCount
FROM Covid_Database.CovidTable1
where continent <> ''  
group by location
order by TotalDeathCount desc; 


-- Total Deaths Counts by Continent
SELECT continent, MAX(cast(total_deaths as unsigned)) as TotalDeathCount
FROM Covid_Database.CovidTable1
where continent <> ''  
group by continent
order by TotalDeathCount desc; 


-- Total deaths per cases by country
SELECT location, sum(new_cases) as NewCasesCount, 
sum(new_deaths) as TotalDeathsCount,
(sum(new_deaths)/sum(new_cases))*100 as DeathsPerCases
FROM Covid_Database.CovidTable1
where continent <> ''  
group by location
order by DeathsPerCases Desc;
-- group by date;










create view TotalDeathCountPerContinent as
SELECT continent, MAX(cast(total_deaths as unsigned)) as TotalDeathCount
FROM Covid_Database.CovidTable1
where continent <> ''  
group by continent
order by TotalDeathCount desc; 


create view TotalDeathPerCases as
SELECT location, sum(new_cases) as NewCasesCount, 
sum(new_deaths) as TotalDeathsCount,
(sum(new_deaths)/sum(new_cases))*100 as DeathsPerCases
FROM Covid_Database.CovidTable1
where continent <> ''  
group by location
order by DeathsPerCases Desc;


create view TotalDeathCount as
SELECT location, MAX(cast(total_deaths as unsigned)) as TotalDeathCount
FROM Covid_Database.CovidTable1
where continent <> ''  
group by location
order by TotalDeathCount desc; 
 

create view DeathPercentageInUk as
SELECT date, total_cases, total_deaths, (total_deaths/population)*100 as DeathPercentage 
FROM Covid_Database.CovidTable1
where location like 'united kingdom' and total_cases <> '' ;