create database Titanic_survival;
use Titanic_survival;
select * from titanic;

-- 1. Total number of passengers
select count(passengerid)
from titanic;

-- 2. Total number of survivors
select count(passengerid)
from titanic
where survived=1;

-- 3. Total number of passengers who died
select count(passengerid)
from titanic
where survived=0;

-- 4. Survival count by gender
select count(passengerid),gender
from titanic
where survived=1
group by gender;

-- 5. Death count by gender
select count(passengerid),gender
from titanic
where survived=0
group by gender;

-- 6. Number of passengers from each embarkation port
select count(passengerid),embarked
from titanic
group by embarked;

-- 7. Passengers traveling with family (siblings/spouse)
select count(passengerid)
from titanic
where sibsp>0;

-- 8. Survival Rate by Passenger Class
select pclass,
round(sum(survived)*100/count(*),2) as survival_rate
from titanic
group by pclass;

-- 9. Rank Passengers by Fare Within Each Class
select name,pclass,fare,
rank() over(partition by pclass order by fare desc) as fare_rank
from titanic;

-- 10.Survival Rate by Age Group
select CASE
 when age<=12 then 'Child'
 when age<=18 then 'Teen'
 when age<=59 then 'Adult'
 else 'Senior'
end as age_group,
round(sum(survived)*100/count(*),2) as survival_rate
from titanic
group by age_group;