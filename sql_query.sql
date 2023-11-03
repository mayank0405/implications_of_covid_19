/*
*Implications of COVID - 19
*Case study by Mayank Singh mayanksingholive@gmail.com
*

For this project you play the role of a data analyst at a research hospital. 
It's the year 2020 and has been unlike anything mankind has ever seen in the last hundred years. 
Coronavirus disease 2019 (COVID-19) is a highly contagious viral illness caused by severe acute respiratory 
syndrome SARS-CoV-2. First detected in Wuhan China, it has had a devastating effect on the world’s demographics resulting in more than 
5.3 million deaths worldwide. It has emerged as the most consequential global health crisis since 
the era of the influenza pandemic of 1918.

We have data from January 2020 to July 2020. We have three tables and using them we will try to analyse the impact
of this pathogen in terms of number of cases, deaths and recoveries.

Let's do it!

*/

--How many tables are present in the database?

select table_catalog, table_schema, table_name
from `sql-projects-403804.sql_project.INFORMATION_SCHEMA.TABLES`;

--Result: 

| table_catalog       | table_schema | table_name          |
|---------------------|--------------|---------------------|
| sql-projects-403804 | sql_project  | country_wise_latest |
| sql-projects-403804 | sql_project  | day_wise            |
| sql-projects-403804 | sql_project  | full_grouped        |

--How many columns and their datatypes are present in the tables?

select  table_name, column_name, ordinal_position, data_type
from  `sql-projects-403804.sql_project.INFORMATION_SCHEMA.COLUMNS`
where  table_name = 'country_wise_latest';

--Result: 

| table_name          | column_name            | ordinal_position | data_type |
|---------------------|------------------------|------------------|-----------|
| country_wise_latest | Country_Region         | 1                | STRING    |
| country_wise_latest | Confirmed              | 2                | INT64     |
| country_wise_latest | Deaths                 | 3                | INT64     |
| country_wise_latest | Recovered              | 4                | INT64     |
| country_wise_latest | Active                 | 5                | INT64     |
| country_wise_latest | New_cases              | 6                | INT64     |
| country_wise_latest | New_deaths             | 7                | INT64     |
| country_wise_latest | New_recovered          | 8                | INT64     |
| country_wise_latest | Deaths___100_Cases     | 9                | FLOAT64   |
| country_wise_latest | Recovered___100_Cases  | 10               | FLOAT64   |
| country_wise_latest | Deaths___100_Recovered | 11               | FLOAT64   |
| country_wise_latest | Confirmed_last_week    | 12               | INT64     |
| country_wise_latest | _1_week_change         | 13               | INT64     |
| country_wise_latest | _1_week___increase     | 14               | FLOAT64   |
| country_wise_latest | WHO_Region             | 15               | STRING    |

select  table_name, column_name, ordinal_position, data_type
from  `sql-projects-403804.sql_project.INFORMATION_SCHEMA.COLUMNS`
where  table_name = 'day_wise';

--Result: 

| table_name | column_name            | ordinal_position | data_type |
|------------|------------------------|------------------|-----------|
| day_wise   | Date                   | 1                | DATE      |
| day_wise   | Confirmed              | 2                | INT64     |
| day_wise   | Deaths                 | 3                | INT64     |
| day_wise   | Recovered              | 4                | INT64     |
| day_wise   | Active                 | 5                | INT64     |
| day_wise   | New_cases              | 6                | INT64     |
| day_wise   | New_deaths             | 7                | INT64     |
| day_wise   | New_recovered          | 8                | INT64     |
| day_wise   | Deaths___100_Cases     | 9                | FLOAT64   |
| day_wise   | Recovered___100_Cases  | 10               | FLOAT64   |
| day_wise   | Deaths___100_Recovered | 11               | FLOAT64   |
| day_wise   | No__of_countries       | 12               | INT64     |

select  table_name, column_name, ordinal_position, data_type
from  `sql-projects-403804.sql_project.INFORMATION_SCHEMA.COLUMNS`
where  table_name = 'full_grouped';

--Result:

| table_name   | column_name    | ordinal_position | data_type |
|--------------|----------------|------------------|-----------|
| full_grouped | Date           | 1                | DATE      |
| full_grouped | Country_Region | 2                | STRING    |
| full_grouped | Confirmed      | 3                | INT64     |
| full_grouped | Deaths         | 4                | INT64     |
| full_grouped | Recovered      | 5                | INT64     |
| full_grouped | Active         | 6                | INT64     |
| full_grouped | New_cases      | 7                | INT64     |
| full_grouped | New_deaths     | 8                | INT64     |
| full_grouped | New_recovered  | 9                | INT64     |
| full_grouped | WHO_Region     | 10               | STRING    |

--Top 10 confirmed number of cases:-

select  Country_Region, Confirmed
from  `sql_project.country_wise_latest`
order  by  2  desc
limit  10;

--Result:

| Country_Region | Confirmed |
|----------------|-----------|
| US             | 4290259   |
| Brazil         | 2442375   |
| India          | 1480073   |
| Russia         | 816680    |
| South Africa   | 452529    |
| Mexico         | 395489    |
| Peru           | 389717    |
| Chile          | 347923    |
| United Kingdom | 301708    |
| Iran           | 293606    |

--Top 10 deaths:-

select  Country_Region, Deaths
from  `sql_project.country_wise_latest`
order  by  2  desc
limit  10;

--Result:

| Country_Region | Deaths |
|----------------|--------|
| US             | 148011 |
| Brazil         | 87618  |
| United Kingdom | 45844  |
| Mexico         | 44022  |
| Italy          | 35112  |
| India          | 33408  |
| France         | 30212  |
| Spain          | 28432  |
| Peru           | 18418  |
| Iran           | 15912  |

--Top 10 recovered countries:-

select  Country_Region, Recovered
from  `sql_project.country_wise_latest`
order  by  2  desc
limit  10;

--Result:

| Country_Region | Recovered |
|----------------|-----------|
| Brazil         | 1846641   |
| US             | 1325804   |
| India          | 951166    |
| Russia         | 602249    |
| Chile          | 319954    |
| Mexico         | 303810    |
| South Africa   | 274925    |
| Peru           | 272547    |
| Iran           | 255144    |
| Pakistan       | 241026    |

--Time Range:-

select  min(Date)  as  first_date, max(Date)  as  last_date
from  `sql_project.day_wise`;

--Result:

| first_date | last_date  |
|------------|------------|
| 2020-01-22 | 2020-07-27 |

--Top 5 cases in South-East Asia:-

select  Country_Region, Confirmed, Deaths, Recovered
from  `sql_project.country_wise_latest`
where  WHO_Region = 'South-East Asia'
order  by  2  desc
limit  5;

--Result:

| Country_Region | Confirmed | Deaths | Recovered |
|----------------|-----------|--------|-----------|
| India          | 1480073   | 33408  | 951166    |
| Bangladesh     | 226225    | 2965   | 125683    |
| Indonesia      | 100303    | 4838   | 58173     |
| Nepal          | 18752     | 48     | 13754     |
| Maldives       | 3369      | 15     | 2547      |

--Percentage increase from January to July:-

with  cte1  as  (
select  Country_Region, sum(Confirmed)  as  total_number_of_cases_in_January
from  `sql_project.full_grouped`
where  WHO_Region = 'South-East Asia'  and  extract(month  from  Date) = 1
group  by  1
order  by  2  desc
limit  5
),

cte2  as  (
select  Country_Region, sum(Confirmed)  as  total_number_of_cases_in_July
from`sql_project.full_grouped`
where  WHO_Region = 'South-East Asia'  and  extract(month  from  Date) = 7
group  by  1
order  by  2  desc
limit  5  )

select  c2.Country_Region, round(((c2.total_number_of_cases_in_July  -  c1.total_number_of_cases_in_January)/c1.total_number_of_cases_in_January  *  100))  as  percentage_increase
from  cte1  c1
inner  join  cte2  c2
on  c1.Country_region = c2.Country_region;

--Result:

| Country_Region | percentage_increase |
|----------------|---------------------|
| Thailand       | 92641.0             |
| Nepal          | 6541057.0           |
| India          | 1319265500.0        |

--Month-wise number of cases:-

select  extract(month  from  Date)  as  month, sum(confirmed)  as  confirmed, sum(deaths)  as  deaths, sum(recovered)  as  recovered
from  `sql_project.day_wise`
group  by  1;

--Result:

| month | confirmed | deaths   | recovered |
|-------|-----------|----------|-----------|
| 1     | 38534     | 889      | 838       |
| 2     | 1663437   | 46875    | 363669    |
| 3     | 9002815   | 397601   | 2644372   |
| 4     | 63391662  | 4311214  | 15944020  |
| 5     | 144990399 | 9609604  | 52876838  |
| 6     | 246525787 | 13309053 | 116984268 |
| 7     | 362895848 | 15709667 | 199594224 |

--Month on Month percentage increase:-

with  cte1  as(
select  extract(month  from  Date)  as  month, sum(confirmed)  as  confirmed
from  `sql_project.day_wise`
group  by  1),

cte2  as  (
select  c1.month  as  previous_month, c1.confirmed  as  previous_month_cases, c2.month  as  next_momth , c2.confirmed  as  next_month_cases
from  cte1  as  c1, cte1  as  c2
where  c2.month  -  c1.month = 1
order  by  1  asc)

select  previous_month, round(((next_month_cases  -  previous_month_cases)/previous_month_cases)*100,2)  as  next_month_percentage_increase
from  cte2;

--Result:

| previous_month | next_month_percentage_increase |
|----------------|--------------------------------|
| 1              | 4216.8                         |
| 2              | 441.22                         |
| 3              | 604.13                         |
| 4              | 128.72                         |
| 5              | 70.03                          |
| 6              | 47.2                           |

--Per Day Percentage Increase in number of active cases:-

with  cte  as  (
select  Date, Confirmed, New_cases, Confirmed  +  lead(New_cases,1)  over(order  by  Date)  as  Next_Day_Cases
from  `sql_project.day_wise`
order  by  1  )

select  Date, Confirmed, Next_Day_Cases, round((((Next_Day_Cases  -  Confirmed)/Confirmed)*100),2)  as  Percentage_Change_Per_Day
from  cte
limit  5;

--Result:

| Date       | Confirmed | Next_Day_Cases | Percentage_Change_Per_Day |
|------------|-----------|----------------|---------------------------|
| 2020-01-22 | 555       | 654            | 17.84                     |
| 2020-01-23 | 654       | 941            | 43.88                     |
| 2020-01-24 | 941       | 1434           | 52.39                     |
| 2020-01-25 | 1434      | 2118           | 47.7                      |
| 2020-01-26 | 2118      | 2927           | 38.2                      |

--Percentages of Total Number of Confirmed Cases of countries in South East Asia. Ordered by Recovered Percentage to check where recovery is the most and do further analysis as where to send vaccines:-

select  Country, Confirmed, round((Deaths/Confirmed)*100,2)  as  Death_Percentage,
round((Recovered/Confirmed)*100,2)  as  Recovered_Percentage, round((Active/Confirmed)*100,2)  as  Active_Percentage
from  (
select  Country_Region  as  Country, Confirmed, Deaths, Recovered, Active
from  `sql_project.country_wise_latest`
where  WHO_Region = 'South-East Asia'
)  t
order  by  4  desc
limit  5;

--Result:

| Country   | Confirmed | Death_Percentage | Recovered_Percentage | Active_Percentage |
|-----------|-----------|------------------|----------------------|-------------------|
| Thailand  | 3297      | 1.76             | 94.36                | 3.88              |
| Bhutan    | 99        | 0.0              | 86.87                | 13.13             |
| Burma     | 350       | 1.71             | 83.43                | 14.86             |
| Sri Lanka | 2805      | 0.39             | 75.61                | 23.99             |
| Maldives  | 3369      | 0.45             | 75.6                 | 23.95             |

--Representing WHO_Region, Total Confirmed Cases and Confirmed cases in January:-

with  cte  as  (
select  WHO_Region, sum(Confirmed)  as  Confirmed_cases
from  `sql_project.country_wise_latest`
group  by  1
order  by  1),

cte2  as  (
select  WHO_Region, sum(Confirmed)  as  Confirmed_cases_in_January
from  `sql_project.full_grouped`
where  extract(month  from  Date) = 1
group  by  1
order  by  1)

select  c1.WHO_Region, c1.Confirmed_cases, c2.Confirmed_cases_in_January
from  cte  c1
inner  join  cte2  c2
on  c1.WHO_Region = c2.WHO_Region;

--Result:

| WHO_Region            | Confirmed_cases | Confirmed_cases_in_January |
|-----------------------|-----------------|----------------------------|
| Africa                | 723207          | 0                          |
| Europe                | 3299523         | 58                         |
| Americas              | 8839286         | 50                         |
| South-East Asia       | 1835297         | 108                        |
| Western Pacific       | 292428          | 38306                      |
| Eastern Mediterranean | 1490744         | 12                         |



