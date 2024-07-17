-- Q1. Write a code to check NULL values.
SELECT COUNT(*) as total_null_values FROM corona_virus_dataset 
WHERE Province IS NULL OR
'Country/Region' IS NULL OR
Latitude IS NULL OR 
Longitude IS NULL OR 
Date IS NULL OR 
Confirmed IS NULL OR 
Deaths IS NULL OR
Recovered IS NULL;

-- Q2. If NULL values are present, update them with zeros for all columns. 
UPDATE corona_virus_dataset
SET 
Province = COALESCE(Province, '0'),
Country_Region = COALESCE(Country_Region, '0'),
Latitude = COALESCE(Latitude, '0'),
Longitude = COALESCE(Longitude, '0'),
Date = COALESCE(Date, '0'),
Confirmed =  COALESCE(Confirmed, '0'),
Deaths = COALESCE(Deaths, '0'),
Recovered = COALESCE(Recovered, '0')
WHERE ID > 0;

-- Q3. check total number of rows. 
SELECT COUNT(*) FROM corona_virus_dataset;

-- Q4. Check what is start_date and end_date. 
SELECT min(Date) as Start_Date, max(Date) as End_Date FROM corona_virus_dataset;

-- Q5. Number of month present in dataset. 
SELECT YEAR(Date) as Year, 
COUNT(DISTINCT MONTH (Date)) as number_of_months FROM corona_virus_dataset GROUP BY YEAR(Date);

-- Q6.Find monthly average for confirmed, deaths, recovered. 
SELECT YEAR(Date) as year_num, MONTH(Date) as month_num, AVG(Confirmed) as confirmed_avg, 
AVG(Deaths) as deaths_avg, 
AVG(Recovered) as recovered_avg 
FROM corona_virus_dataset GROUP BY year_num,month_num;
 
 -- Q7. Find most frequent value for confirmed, deaths, recovered each month. 
 SELECT MONTH(Date) as Month,
 YEAR(Date) as Year,
 MAX(Confirmed) as Most_frequent_confirmed,
 MAX(Deaths) as Most_frequent_deaths ,
 MAX(Recovered) as Most_frequent_recovered FROM corona_virus_dataset GROUP BY Month(Date), Year(Date); 
 
 -- Q8. Find minimum values for confirmed, deaths, recovered per year. 
 SELECT YEAR('Date') as Year,
 MIN(Confirmed) as Min_Cnfmd,
 MIN(Deaths) as Min_Deaths,
 MIN(Recovered) as Min_Rcvrd FROM corona_virus_dataset GROUP BY Year; 
 
 -- Q9. Find maximum values of confirmed, deaths, recovered per year. 
SELECT YEAR('Date') as year_num, 
MAX(Confirmed) as max_confirmed, 
MAX(Deaths) as max_deaths, 
MAX(Recovered) as max_recovered 
FROM corona_virus_dataset GROUP BY year_num; 
 
 -- Q10. The total number of case of confirmed, deaths, recovered each month. 
 SELECT MONTH(Date) as Month, YEAR(Date) as Year,
 SUM(Confirmed) as Total_Confirmed,
 SUM(Deaths) as Total_Deaths,
 SUM(Recovered) as Total_Recovered FROM corona_virus_dataset GROUP BY Month, Year; 

-- Q11. Check how corona virus spread out with respect to confirmed case. 
SELECT SUM(Confirmed) as Total_Confirmed,
AVG(Confirmed) as Average_Confirmed,
Round(Variance(Confirmed)) as Var_Confirmed,
Round(STDDEV(Confirmed)) as Standard_deviation FROM corona_virus_dataset; 

-- Q12. Check how corona virus spread out with respect to death case per month. 
SELECT MONTH(Date) as Month, YEAR(Date) as Year,
SUM(Deaths) as Total_Deaths,
AVG(Deaths) as Average_Deaths,
Round(Variance(Deaths)) as Var_Deaths,
Round(STDDEV(Deaths)) as Standard_deviation FROM corona_virus_dataset GROUP BY Month,Year; 

-- Q13. Check how corona virus spread out with respect to recovered case. 
SELECT SUM(Recovered) as Total_Recovered,
AVG(Recovered) as Average_Recovered,
Round(Variance(Recovered)) as Var_Recovered,
Round(STDDEV(Recovered)) as Standard_deviation FROM corona_virus_dataset; 

-- Q14. Find Country having highest number of the Confirmed case. 
SELECT Country,
       SUM(Confirmed) as Total_Confirmed FROM corona_virus_dataset
       GROUP BY Country ORDER BY Total_Confirmed DESC
       LIMIT 5; 
       
-- Q15. Find Country having lowest number of the death case. 
SELECT Country,
       SUM(Deaths) as Total_Deaths FROM corona_virus_dataset
       GROUP BY Country ORDER BY Total_Deaths ASC
       LIMIT 5; 

-- Q16.  Find top 5 countries having highest recovered case. 
SELECT Country,
       SUM(Recovered) as Total_Recovered FROM corona_virus_dataset
       GROUP BY Country ORDER BY Total_Recovered DESC
       LIMIT 5;
    

 








