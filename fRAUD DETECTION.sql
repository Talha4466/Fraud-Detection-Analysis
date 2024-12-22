create database FraudData;

use FraudData;

show tables;

select * from fraud;

-- Credit_card_number EXCEED INT LIMIT 
ALTER TABLE fraud MODIFY COLUMN Credit_card_number BIGINT;


-- STARTING ANALYSIS
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ --------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TOTAL FRAUD CASES

select SUM(FRAUD) AS  TotalCases from fraud;
-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FRAUD BY PROFESSION.

SELECT Profession , SUM(Fraud) AS FraudCases FROM FRAUD
GROUP BY ProfessioN;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FRAUD BY INCOME.

-- Step 1: Define CTE
WITH IncomeClassification AS (
    SELECT 
        CASE
            WHEN Income < 1000 THEN 'Less than 1000'
            WHEN Income >= 1000 AND Income < 2000 THEN '1000 to 1999'
            WHEN Income >= 2000 AND Income < 3000 THEN '2000 to 2999'
            WHEN Income >= 3000 AND Income < 4000 THEN '3000 to 3999'
            WHEN Income >= 4000 AND Income < 5000 THEN '4000 to 4999'
            WHEN Income >= 5000 AND Income < 6000 THEN '5000 to 5999'
            WHEN Income >= 6000 AND Income < 7000 THEN '6000 to 6999'
            WHEN Income >= 7000 AND Income < 8000 THEN '7000 to 7999'
            WHEN Income >= 8000 AND Income < 9000 THEN '8000 to 8999'
            ELSE '9000 and above'
        END AS Income_Range,
        SUM(Fraud) AS FraudCases 
    FROM FRAUD 
    GROUP BY Income_Range
)

SELECT Income_Range , FraudCases FROM  IncomeClassification 
GROUP BY Income_Range ;




