# Analysis of COVID-19 in 2020
## Context 

-   <font size = "3">A new coronavirus designated 2019-nCoV was first identified in Wuhan, the capital of China's Hubei province</font>
-  <font size = "3"> People developed pneumonia without a clear cause and for which existing vaccines or treatments were not effective.</font>
-   <font size = "3">The virus has shown evidence of human-to-human transmission</font>
-   <font size = "3">Transmission rate (rate of infection) appeared to escalate in mid-January 2020</font>
-   <font size = "3">We have only used SQL for this project and on **Google BigQuery** platform.</font>

## Content

-   <font size = "3">**full_grouped.csv** - Day to day country wise no. of cases (Has County/State/Province level data)</font>
-  <font size = "3"> **country_wise_latest.csv** - Latest country level no. of cases</font>
-  <font size = "3"> **day_wise.csv** - Day wise no. of cases (Doesn't have country level data)</font>

<font size = "3">The dataset for the following project can be found [here](https://www.kaggle.com/datasets/imdevskp/corona-virus-report/data).</font>

## Acknowledgements / Data Source
<font size = "3">_https://github.com/CSSEGISandData/COVID-19_</font>
<font size = "3">_https://www.worldometers.info/_</font>

## Collection Methodology
<font size = "3">_https://github.com/imdevskp/covid_19_jhu_data_web_scrap_and_cleaning_</font>

**Author**: Mayank Singh

**Email**: mayanksingholive@gmail.com

**LinkedIn**: https://www.linkedin.com/in/mayank-singh-a71110156/

### Exploratory Analysis

#### :bangbang: How many tables are present in the database? 
````sql 
select  table_catalog, table_schema, table_name
from  `sql-projects-403804.sql_project.INFORMATION_SCHEMA.TABLES`
````
**_Results_**
| table_catalog       | table_schema | table_name          |
|---------------------|--------------|---------------------|
| sql-projects-403804 | sql_project  | country_wise_latest |
| sql-projects-403804 | sql_project  | day_wise            |
| sql-projects-403804 | sql_project  | full_grouped        |

❗ **Insight -**  <font size = "3">The above table shows us the tables present in the dataset _sql_project_. There are three tables in the database:- _country_wise_latest_ , _day_wise_ and _full_grouped_. 

#### :bangbang: How many columns and their datatypes are present in the tables? 
````sql 
select  table_name, column_name, ordinal_position, data_type
from  `sql-projects-403804.sql_project.INFORMATION_SCHEMA.COLUMNS`
where  table_name = 'country_wise_latest'
````
**_Results_**
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

````sql
select  table_name, column_name, ordinal_position, data_type
from  `sql-projects-403804.sql_project.INFORMATION_SCHEMA.COLUMNS`
where  table_name = 'day_wise'
````
**_Results_**
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
````sql
select  table_name, column_name, ordinal_position, data_type
from  `sql-projects-403804.sql_project.INFORMATION_SCHEMA.COLUMNS`
where  table_name = 'full_grouped'
````
**_Results_**
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

❗ **Insight -**  <font size = "3"> Here we use INFORMATION_SCHEMA.COLUMNS to get the column names, ordinal position and datatypes of each column for all the rows.</font>

### :bangbang: Top 10 confirmed number of cases:-
````sql
select  Country_Region, Confirmed
from  `sql_project.country_wise_latest`
order  by  2  desc
limit  10
````
**_Results_**
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

❗ **Insight -** <font size = "3"> From the table country_wise_latest we find the top ten countries that have the highest number of confirmed covid cases.</font>

### :bangbang: Top 10 deaths:-
```` sql
select  Country_Region, Deaths
from  `sql_project.country_wise_latest`
order  by  2  desc
limit  10
````
**_Results_**
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

❗ **Insight -** <font size = "3"> Next, we find out the top 10 countries with maximum number of deaths.</font>

### :bangbang: Top 10 recovered countries:-
````sql
select  Country_Region, Recovered
from  `sql_project.country_wise_latest`
order  by  2  desc
limit  10
````
**_Results_**
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

❗ **Insight -** <font size = "3"> Next, we find out the top 10 countries with maximum number of recovered cases.</font>

### :bangbang: Time Range:-
````sql
select  min(Date)  as  first_date, max(Date)  as  last_date
from  `sql_project.day_wise`
````
**_Results_**
| first_date | last_date  |
|------------|------------|
| 2020-01-22 | 2020-07-27 |

❗ **Insight -** <font size = "3">We try to find out the range of the given dataset i.e., the first date and the last date recorded. For this we use *min ()* and *max ()* functions over the Date attribute to get first and last dates respectively.</font>

### :bangbang: Top 5 cases in South-East Asia:-
````sql
select  Country_Region, Confirmed, Deaths, Recovered
from  `sql_project.country_wise_latest`
where  WHO_Region = 'South-East Asia'
order  by  2  desc
limit  5
````
**_Results_**
| Country_Region | Confirmed | Deaths | Recovered |
|----------------|-----------|--------|-----------|
| India          | 1480073   | 33408  | 951166    |
| Bangladesh     | 226225    | 2965   | 125683    |
| Indonesia      | 100303    | 4838   | 58173     |
| Nepal          | 18752     | 48     | 13754     |
| Maldives       | 3369      | 15     | 2547      |

❗ **Insight -** <font size = "3">For the South East Asia WHO Region, we find out the top 5 countries with Confirmed, Death and Recovered cases. For this we use ***limit 5***.</font>

### :bangbang: Percentage increase from January to July:-
````sql
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
````
**_Results_**
| Country_Region | percentage_increase |
|----------------|---------------------|
| Thailand       | 92641.0             |
| Nepal          | 6541057.0           |
| India          | 1319265500.0        |

❗ **Insight -** <font size = "3">In this query, we have tried to find out the percentage increase in Confirmed cases from January 2020 to July 2020. We have used ***windows function cte, inner join and aggregate function group*** by and **sum ()**. We have used full_grouped table.</font>

### :bangbang: Month-wise number of cases:-
````sql
select  extract(month  from  Date)  as  month, sum(confirmed)  as  confirmed, sum(deaths)  as  deaths, sum(recovered)  as  recovered
from  `sql_project.day_wise`
group  by  1;
````
**_Results_**
| month | confirmed | deaths   | recovered |
|-------|-----------|----------|-----------|
| 1     | 38534     | 889      | 838       |
| 2     | 1663437   | 46875    | 363669    |
| 3     | 9002815   | 397601   | 2644372   |
| 4     | 63391662  | 4311214  | 15944020  |
| 5     | 144990399 | 9609604  | 52876838  |
| 6     | 246525787 | 13309053 | 116984268 |
| 7     | 362895848 | 15709667 | 199594224 |

❗ **Insight -** <font size = "3">Here we have extracted number of confirmed, death and recovered cases for each month from 1st (January) to 7th (July). We do this using *sum ()* function.</font>

### :bangbang: Month on Month percentage increase:-
````sql
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
from  cte2
````
**_Results_**
| previous_month | next_month_percentage_increase |
|----------------|--------------------------------|
| 1              | 4216.8                         |
| 2              | 441.22                         |
| 3              | 604.13                         |
| 4              | 128.72                         |
| 5              | 70.03                          |
| 6              | 47.2                           |

❗ **Insight -** <font size = "3">Here we find out the percentage increase in number of confirmed cases on a monthly basis. Since we have no data for 8th month so we can’t find out the percentage increase for the 7th month.</font>

### :bangbang: Per Day Percentage Increase in number of active cases:- 
````sql
with  cte  as  (
select  Date, Confirmed, New_cases, Confirmed  +  lead(New_cases,1)  over(order  by  Date)  as  Next_Day_Cases
from  `sql_project.day_wise`
order  by  1  )

select  Date, Confirmed, Next_Day_Cases, round((((Next_Day_Cases  -  Confirmed)/Confirmed)*100),2)  as  Percentage_Change_Per_Day
from  cte
limit  5;
````
**_Results_**
| Date       | Confirmed | Next_Day_Cases | Percentage_Change_Per_Day |
|------------|-----------|----------------|---------------------------|
| 2020-01-22 | 555       | 654            | 17.84                     |
| 2020-01-23 | 654       | 941            | 43.88                     |
| 2020-01-24 | 941       | 1434           | 52.39                     |
| 2020-01-25 | 1434      | 2118           | 47.7                      |
| 2020-01-26 | 2118      | 2927           | 38.2                      |

❗ **Insight -** <font size = "3">Here, from the table *day_wise* we find out percentage change on daily basis. For simplicity we have used **round function** to round percentage to 2 decimal values. Also, since the data is large, we only display result for first 5 rows.</font>

### :bangbang: Percentages of Total Number of Confirmed Cases of countries in South East Asia. Ordered by Recovered Percentage to check where recovery is the most and do further analysis as where to send vaccines:- 
````sql
select  Country, Confirmed, round((Deaths/Confirmed)*100,2)  as  Death_Percentage,
round((Recovered/Confirmed)*100,2)  as  Recovered_Percentage, round((Active/Confirmed)*100,2)  as  Active_Percentage
from  (
select  Country_Region  as  Country, Confirmed, Deaths, Recovered, Active
from  `sql_project.country_wise_latest`
where  WHO_Region = 'South-East Asia'
)  t
order  by  4  desc
limit  5
````
**_Results_**
| Country   | Confirmed | Death_Percentage | Recovered_Percentage | Active_Percentage |
|-----------|-----------|------------------|----------------------|-------------------|
| Thailand  | 3297      | 1.76             | 94.36                | 3.88              |
| Bhutan    | 99        | 0.0              | 86.87                | 13.13             |
| Burma     | 350       | 1.71             | 83.43                | 14.86             |
| Sri Lanka | 2805      | 0.39             | 75.61                | 23.99             |
| Maldives  | 3369      | 0.45             | 75.6                 | 23.95             |

❗ **Insight -** <font size = "3">Here we can see that ***Thailand*** has the highest recovered percentage and required least number of vaccines. We have only shown 5 records for simplicity.</font>

### :bangbang: Representing WHO_Region, Total Confirmed Cases and Confirmed cases in January:- 
````sql
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
````
**_Results_**
| WHO_Region            | Confirmed_cases | Confirmed_cases_in_January |
|-----------------------|-----------------|----------------------------|
| Africa                | 723207          | 0                          |
| Europe                | 3299523         | 58                         |
| Americas              | 8839286         | 50                         |
| South-East Asia       | 1835297         | 108                        |
| Western Pacific       | 292428          | 38306                      |
| Eastern Mediterranean | 1490744         | 12                         |

❗ **Insight -** <font size = "3">In the last query, we find the total number of confirmed cases and number of confirmed cases in the month of January. For this group by WHO_Region and then **sum ()** over *Confirmed*.</font>
