SELECT * FROM sql_project.healthcare_dataset;

-- Step 1: Cleaning data
-- Checking for Null values in each column
-- If foound, Replacing Null values with some default value
SELECT *
From healthcare_dataset
where Name is null or 
Age is null or 
Gender is null or 
`Blood Type` is null or
`Medical Condition` is null or
`Date of Admission` is null or
Doctor is null or
Hospital is null or
`Insurance Provider` is null or
`Billing Amount` is null or
`Room Number` is null or
`Admission Type` is null or
`Discharge Date` is null or
Medication is null or
`Test Results` is null;
-- As we can see no null values in any of the colunmns

-- Number of patients belonging to each blood group

SELECT `Blood Type`, count(`Blood Type`) AS "# Patients"
FROM healthcare_dataset
GROUP BY `Blood Type`
ORDER BY count(`Blood Type`) Desc ;

-- Which blood group has highest patients
SELECT `Blood Type`, count(`Blood Type`) AS "# Patients"
FROM healthcare_dataset
GROUP BY `Blood Type`
ORDER BY count(`Blood Type`) Desc 
limit 1;

-- Analysis on Medical conditions
SELECT `Medical Condition`, count(`Medical Condition`) AS "Number of patients"
FROM healthcare_dataset
GROUP BY `Medical Condition`
ORDER BY count(`Medical Condition`) Desc ;

-- Which medicl condition was observed the highest amoung al patients
SELECT `Medical Condition`, count(`Medical Condition`) AS "Number of patients"
FROM healthcare_dataset
GROUP BY `Medical Condition`
ORDER BY count(`Medical Condition`) Desc
limit 1 ;


-- Total types of medical conditions
SELECT `Medical Condition`
FROM healthcare_dataset
GROUP BY `Medical Condition`;

-- Which medical condition has highest number of patients
SELECT `Medical Condition`, count(`Medical Condition`) as "#Patients"
FROM healthcare_dataset
GROUP BY `Medical Condition`
ORDER BY count(`Medical Condition`) Desc
LIMIT 1;

-- Which medical condition has Least number of patients
SELECT `Medical Condition`, count(`Medical Condition`) as "#Patients"
FROM healthcare_dataset
GROUP BY `Medical Condition`
ORDER BY count(`Medical Condition`) asc
LIMIT 1;

Select distinct`Admission Type`
FROM healthcare_dataset;

-- Average billing amount per patient
Select avg(`Billing Amount`) As "Avg bill"
from healthcare_dataset;

-- List of insurance providerd
Select `Insurance Provider`
From healthcare_dataset
Group by `Insurance Provider`
;

-- Which insurance provider was used the most
Select `Insurance Provider`, count(`Insurance Provider`) as "#Patients insured"
From healthcare_dataset
Group by `Insurance Provider`
Order by count(`Insurance Provider`) desc;

-- Patient with highest number of days of admission
Select Name, (date(`Discharge Date`)-date(`Date of Admission`)) as "#days admitted", (date(`Discharge Date`)-date(`Date of Admission`))/365 as "#years admitted"
from healthcare_dataset
order by (date(`Discharge Date`)-date(`Date of Admission`)) desc
limit 1;

-- Which medication was used the most for patients
Select Medication, count(Medication) as "# of patients treated"
From healthcare_dataset
Group by Medication
order by count(Medication) desc;