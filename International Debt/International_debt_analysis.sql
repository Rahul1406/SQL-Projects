/* Full Data*/
select * from international_debt 
limit 10;

/* Distinct Countries*/
SELECT  COUNT(DISTINCT(country_name))
     AS total_distinct_countries
FROM international_debt;

/* Distinct Debt Indicator*/
SELECT  COUNT(DISTINCT(indicator_code))
     AS distinct_debt_indicators
FROM international_debt
order by distinct_debt_indicators;

/* County Debt*/
Select country_name, sum(debt) as total_debt
from international_debt
group by country_name; 

/*Highest Debt*/
Select country_name, sum(debt) as total_debt
from international_debt
group by country_name 
order by total_debt desc
limit 1;

/*Average amount of debt across indicators*/
SELECT 
    indicator_code AS debt_indicator,
    indicator_name, AVG(debt) as average_debt
    
FROM international_debt
GROUP BY debt_indicator,indicator_name
ORDER BY average_debt desc
Limit 10;

/* The highest amount of principal repayments*/
SELECT 
    country_name, indicator_name
FROM international_debt
WHERE debt = (SELECT 
                 max(debt)
             FROM international_debt
             WHERE indicator_code='DT.AMT.DLXF.CD');
/* Most Common Debt Indicator*/
SELECT 
    indicator_code,
    COUNT(indicator_code) AS indicator_count
FROM international_debt
GROUP BY indicator_code
ORDER BY indicator_count DESC, indicator_code DESC
LIMIT 20;

/*Other viable debt issues and conclusion*/
SELECT 
    country_name, 
    MAX(debt) AS maximum_debt
FROM international_debt
GROUP BY country_name
ORDER BY maximum_debt DESC
LIMIT 10; 