
-- Insurance_stupidity
SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM family)) AS Percentage
FROM family
WHERE HealthInsurance = false AND car = true;

SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM family)) AS Percentage
FROM family
WHERE HealthInsurance = false AND motorcycle = true;


-- Car causes Diabetes
SELECT
    CASE WHEN car = true THEN 'With Car' ELSE 'Without Car' END AS car_status,
    AVG(CASE WHEN d.Diabetes = true THEN 1 ELSE 0 END) AS diabetes_probability
FROM family f
LEFT JOIN disease d ON f.family_id = d.family_id
LEFT JOIN facility fa ON f.family_id = fa.family_id
GROUP BY car_status;

-- Car causes Hypertension
SELECT
    CASE WHEN car = true THEN 'With Car' ELSE 'Without Car' END AS car_status,
    AVG(CASE WHEN d.Hypertension = true THEN 1 ELSE 0 END) AS Hypertension_probability
FROM family f
LEFT JOIN disease d ON f.family_id = d.family_id
LEFT JOIN facility fa ON f.family_id = fa.family_id
GROUP BY car_status;


-- probability of increase in cancer when drinking alcohol
SELECT
    CAST(SUM(CASE WHEN d.Cancer = 1 AND da.Alcohol = 1 THEN 1 ELSE 0 END) AS DECIMAL(10, 2)) /
    CAST(SUM(CASE WHEN d.Cancer = 1 AND da.Alcohol = 0 THEN 1 ELSE 0 END) AS DECIMAL(10, 2)) AS Cancer_Alcohol_Ratio
FROM
    disease d
JOIN
    drug_abuse da ON d.family_id = da.family_id;

-- probability of increase in cancer when Smoke
SELECT
    CAST(SUM(CASE WHEN d.Cancer = 1 AND da.Smoke = 1 THEN 1 ELSE 0 END) AS DECIMAL(10, 2)) /
    CAST(SUM(CASE WHEN d.Cancer = 1 AND da.Smoke = 0 THEN 1 ELSE 0 END) AS DECIMAL(10, 2)) AS Smoke_Cancer_Ratio
FROM
    disease d
JOIN
    drug_abuse da ON d.family_id = da.family_id;

-- probability of increase in cancer when consume Betel_Leaf

SELECT
    CAST(SUM(CASE WHEN d.Cancer = 1 AND da.Betel_Leaf = 1 THEN 1 ELSE 0 END) AS DECIMAL(10, 2)) /
    CAST(SUM(CASE WHEN d.Cancer = 1 AND da.Betel_Leaf = 0 THEN 1 ELSE 0 END) AS DECIMAL(10, 2)) AS BetelLeaf_Cancer_Ratio
FROM
    disease d
JOIN
    drug_abuse da ON d.family_id = da.family_id;

-- probability of increase in cancer when consume Tobacco
 

SELECT
    CAST(SUM(CASE WHEN d.Cancer = 1 AND da.Tobacco = 1 THEN 1 ELSE 0 END) AS DECIMAL(10, 2)) /
    CAST(SUM(CASE WHEN d.Cancer = 1 AND da.Tobacco = 0 THEN 1 ELSE 0 END) AS DECIMAL(10, 2)) AS Tobacco_Cancer_Ratio
FROM
    disease d
JOIN
    drug_abuse da ON d.family_id = da.family_id;


-- developing india in real

SELECT
    f.state,
    (COUNT(CASE WHEN f.electricity = 1 THEN 1 END) * 100.0) / COUNT(*) AS Percentage_with_Electricity,
    (COUNT(CASE WHEN f.toilet = 1 THEN 1 END) * 100.0) / COUNT(*) AS Percentage_with_Toilet,
    (COUNT(CASE WHEN f.radio = 1 THEN 1 END) * 100.0) / COUNT(*) AS Percentage_with_Radio,
    (COUNT(CASE WHEN f.tv = 1 THEN 1 END) * 100.0) / COUNT(*) AS Percentage_with_TV,
    (COUNT(CASE WHEN f.bicycle = 1 THEN 1 END) * 100.0) / COUNT(*) AS Percentage_with_Bicycle,
    (COUNT(CASE WHEN f.motorcycle = 1 THEN 1 END) * 100.0) / COUNT(*) AS Percentage_with_Motorcycle,
    (COUNT(CASE WHEN f.car = 1 THEN 1 END) * 100.0) / COUNT(*) AS Percentage_with_Car
FROM
    facility f
GROUP BY
    f.state
    f.ResidenceType_Urban;

-- disease density 
SELECT
    f.state,
    (COUNT(CASE WHEN d.Diabetes = 1 THEN 1 END) * 100.0) / COUNT(*) AS Percentage_with_Diabetes,
    (COUNT(CASE WHEN d.Hypertension = 1 THEN 1 END) * 100.0) / COUNT(*) AS Percentage_with_Hypertension,
    (COUNT(CASE WHEN d.RespDisease = 1 THEN 1 END) * 100.0) / COUNT(*) AS Percentage_with_RespDisease,
    (COUNT(CASE WHEN d.Thyroid = 1 THEN 1 END) * 100.0) / COUNT(*) AS Percentage_with_Thyroid,
    (COUNT(CASE WHEN d.HeartDisease = 1 THEN 1 END) * 100.0) / COUNT(*) AS Percentage_with_HeartDisease,
    (COUNT(CASE WHEN d.Cancer = 1 THEN 1 END) * 100.0) / COUNT(*) AS Percentage_with_Cancer,
    (COUNT(CASE WHEN d.Kidney = 1 THEN 1 END) * 100.0) / COUNT(*) AS Percentage_with_Kidney
FROM
    disease d
JOIN
    family f ON d.family_id = f.family_id
GROUP BY
    f.state;


