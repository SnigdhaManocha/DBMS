SELECT * FROM practice.csvdata;

-- To count the number of rows
select count(*)
from practice.csvdata;

-- To change the meta data
alter table  practice.csvdata
change column  `No. of Bedrooms` `No_of_Bedrooms` INT;

-- To identify the number of 2 bedroom houses in RR Nagar
select count(*)
from practice.csvdata
where Location="RR Nagar" AND No_of_Bedrooms= 2;

-- To identify the city, location, area and No_of Bedrooms of the most expensive house sold
select*
from practice.csvdata
order by price DESC
limit 1;

-- To identify the city, location, area and No_of Bedrooms of the most cheapest house sold
select*
from practice.csvdata
order by price asc
limit 1;

-- To identify the city in which maximum houses are sold and maximum area of house are sold 
select max(City) as max_houses_sold_city , max(Area) as max_area_sold
from practice.csvdata;

-- To identify the city in which minimum houses are sold and minimum area of house are sold
select min(City) as min_houses_sold_city, min(Area) as min_area_sold
from practice.csvdata;

-- To categorize the prices of house into 3 different categories- "Very Expensive", "Expensive" and "Moderate"
select City, Area,
case
    when Price between 150000000 AND 360000000 then "Very Expensive"
	when Price between 30000000 AND 150000000 then "Expensive"
    else "Moderate"
end as "Pricing Category"
from practice.csvdata;

-- To identify in which Location and city is the house with largest area exist 
SELECT a.Location, a.City, a.Area AS Largest_area
FROM practice.csvdata a
JOIN (
    SELECT MAX(Area) AS max_area
    FROM practice.csvdata
) m ON a.Area = m.max_area;

-- To identify the City which has the most preferred Location
select a.City, a.Location as most_preferred_location
from practice.csvdata a
join(  
select max(Location) as max_Location
from practice.csvdata) m on a.Location= m.max_Location;

-- Top 5 cities where majority of the houses were sold
select City, count(*) as No_of_houses
from practice.csvdata
group by City
order by No_of_houses desc
limit 5;

-- To identify the top 5 most preferred area where houses were sold
select Location, count(*) as most_preferred_area
from practice.csvdata
group by Location
order by most_preferred_area desc
limit 5;