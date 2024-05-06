create database healthcare;
use healthcare;
-------------

show tables;
select * from dialysis1;
select * from dialysis2;

-------------

-- Number of Patients across various summaries


    
SELECT
    Code,
    Sum
FROM (
    SELECT 
        'Hypercalcemia summary' AS Code,
        SUM(`Hypercalcemia summary`) AS Sum
    FROM 
        dialysis1

    UNION ALL

    SELECT 
        'Serum phosphorus summary' AS Code,
        SUM(`Serum phosphorus summary`) AS Sum
    FROM 
        dialysis1

    UNION ALL

    SELECT 
        'Hospitalization summary' AS Code,
        SUM(`Hospitalization summary`) AS Sum
    FROM 
        dialysis1

    UNION ALL

    SELECT 
        'Hospital readmission summary' AS Code,
        SUM(`Hospital readmission summary`) AS Sum
    FROM 
        dialysis1

    UNION ALL

    SELECT 
        'Survival summary' AS Code,
        SUM(`Survival summary`) AS Sum
    FROM 
        dialysis1

    UNION ALL

    SELECT 
        'Fistula summary' AS Code,
        SUM(`Fistula summary`) AS Sum
    FROM 
        dialysis1

    UNION ALL

    SELECT 
        'Long term catheter summary' AS Code,
        SUM(`Long term catheter summary`) AS Sum
    FROM 
        dialysis1

    UNION ALL

    SELECT 
        'Number of patients in nPCR summary' AS Code,
        SUM(`Number of patients in nPCR summary`) AS Sum
    FROM 
        dialysis1
) AS subquery;

-- Profit Vs Non-Profit Stats
select `Profit or Non-Profit` ,count(*) as count from dialysis1 where `Profit or Non-Profit` is not null group by `Profit or Non-Profit`;

-- Chain Organizations w.r.t. Total Performance Score as No Score

select * from dialysis1;

select dialysis1.`Chain Organization` ,dialysis2.`Total Performance Score` from dialysis1 inner join dialysis2 on dialysis2.`CMS Certification Number (CCN)`=dialysis1.`Provider Number` where dialysis2.`Total Performance Score`='No score';

SELECT
    dialysis1.`Chain Organization`,
    sum(dialysis2.`Total Performance Score`) as Total_Performance_Score
FROM
    dialysis1
INNER JOIN
    dialysis2 ON dialysis2.`CMS Certification Number (CCN)` = dialysis1.`ï»¿Provider Number`
-- WHERE
    -- dialysis2.`Total Performance Score` = 0
group by  dialysis1.`Chain Organization`;

    
-- Dialysis Stations Stats

select State,sum(`# of Dialysis Stations`)as Total from dialysis1 group by State order by sum(`# of Dialysis Stations`) desc;

-- # of Category Text  - As Expected

select `Patient Transfusion category text`,count(*) from dialysis1 where `Patient Transfusion category text`='As Expected';
select `Patient hospitalization category text`,count(*) from dialysis1 where `Patient hospitalization category text`='As Expected';
select `Patient Survival Category Text`,count(*) from dialysis1 where `Patient Survival Category Text`='As Expected';
select `Patient Infection category text`,count(*) from dialysis1 where `Patient Infection category text`='As Expected';
select `Fistula Category Text`,count(*) from dialysis1 where `Fistula Category Text`='As Expected';
select `SWR category text`,count(*) from dialysis1 where `SWR category text`='As Expected';
select `PPPW category text`,count(*) from dialysis1 where `PPPW category text`='As Expected';

SELECT 'Patient Transfusion category text' AS Category_Text, COUNT(*) AS Count
FROM dialysis1 
WHERE `Patient Transfusion category text` = 'As Expected'

UNION ALL

SELECT 'Patient hospitalization category text' AS Category_Text, COUNT(*) AS Count
FROM dialysis1 
WHERE `Patient hospitalization category text` = 'As Expected'

UNION ALL

SELECT 'Patient Survival Category Text' AS Category_Text, COUNT(*) AS Count
FROM dialysis1 
WHERE `Patient Survival Category Text` = 'As Expected'

UNION ALL

SELECT 'Patient Infection category text' AS Category_Text, COUNT(*) AS Count
FROM dialysis1 
WHERE `Patient Infection category text` = 'As Expected'

UNION ALL

SELECT 'Fistula Category Text' AS Category_Text, COUNT(*) AS Count
FROM dialysis1 
WHERE `Fistula Category Text` = 'As Expected'

UNION ALL

SELECT 'SWR category text' AS Category_Text, COUNT(*) AS Count
FROM dialysis1 
WHERE `SWR category text` = 'As Expected'

UNION ALL

SELECT 'PPPW category text' AS Category_Text, COUNT(*) AS Count
FROM dialysis1 
WHERE `PPPW category text` = 'As Expected';

-- Average Payment Reduction Rate

select round(avg(`PY2020 Payment Reduction Percentage`),2) from dialysis2;
