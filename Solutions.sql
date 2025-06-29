-- WATER QUALITY ANALYSIS

SELECT * FROM transformed_dataset;


-- Q1. Retrieve all data for water samples that are marked as potable.

SELECT *
 FROM transformed_dataset
 WHERE Potability = 1;

-- Q.2 Find the average Hardness of all water samples.

SELECT AVG(Hardness) AS AverageHardness
FROM transformed_dataset;

-- Q.3 Get the count of potable and non-potable water samples.

SELECT
    CASE
        WHEN Potability = 1 THEN 'Potable'
        WHEN Potability = 0 THEN 'Non-Potable'
        ELSE 'Unknown'
    END AS WaterPotability,
    COUNT(*) AS NumberOfSamples
FROM transformed_dataset
GROUP BY Potability;

-- Q.4 Retrieve all data for samples where ph is between 7.0 and 8.0 (inclusive).

SELECT *
FROM transformed_dataset
WHERE ph >= 7.0 AND ph <= 8.0;

-- Q.5  Find the ph and Conductivity of the sample with the lowest Organic_carbon value.

SELECT ph, Conductivity, Organic_carbon
FROM transformed_dataset
ORDER BY Organic_carbon ASC
LIMIT 1;

-- Q.6 Retrieve the ph, Hardness, and Solids for samples where Potability is 1, and Chloramines is below the overall average Chloramines for potable samples.

SELECT ph, Hardness, Solids
FROM transformed_dataset
WHERE Potability = 1
  AND Chloramines < (SELECT AVG(Chloramines) FROM transformed_dataset WHERE Potability = 1);

-- Q.7 Find the ph of samples that have Sulfate concentration within two standard deviations of the mean Sulfate concentration (assuming standard deviation calculation is available or can be approximated).

SELECT ph
FROM transformed_dataset
WHERE Sulfate BETWEEN
    (SELECT AVG(Sulfate) - 2 * STDDEV(Sulfate) FROM transformed_dataset)
    AND
    (SELECT AVG(Sulfate) + 2 * STDDEV(Sulfate) FROM transformed_dataset);

-- Q.8 Determine the number of non-potable samples where Turbidity is greater than 4 and Organic_carbon is less than 10.

SELECT COUNT(*) AS NonPotableHighTurbidityLowOrganicCarbon
FROM transformed_dataset
WHERE Potability = 0
  AND Turbidity > 4.0
  AND Organic_carbon < 10.0;

-- Q.9 List ph, Hardness, and Potability for samples that have Conductivity greater than 500 OR Organic_carbon greater than 20, but are NOT potable.

SELECT ph, Hardness, Potability
FROM transformed_dataset
WHERE (Conductivity > 500.0 OR Organic_carbon > 20.0) AND Potability = 0;

-- Q.10 For each distinct Potability status, find the sample with the minimum Solids value.

SELECT T1.Potability, T1.ph, T1.Solids
FROM transformed_dataset T1
JOIN (
    SELECT Potability, MIN(Solids) AS MinSolids
    FROM transformed_dataset
    GROUP BY Potability
) T2 ON T1.Potability = T2.Potability AND T1.Solids = T2.MinSolids;

-- Q.11 Calculate the percentage of potable water samples in the dataset.

SELECT
    (SUM(CASE WHEN Potability = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS PercentagePotable
FROM transformed_dataset;

-- Q.12 Find the ph and Chloramines of samples that have a Conductivity greater than the overall average Conductivity AND are potable.

SELECT ph, Chloramines
FROM transformed_dataset
WHERE Conductivity > (SELECT AVG(Conductivity) FROM transformed_dataset)
  AND Potability = 1;

-- Q.13 Identify the ph values of samples where the Hardness is greater than the average Hardness for samples with ph values between 6.5 and 7.5.

SELECT ph
FROM transformed_dataset
WHERE Hardness > (
    SELECT AVG(Hardness)
    FROM transformed_dataset
    WHERE ph >= 6.5 AND ph <= 7.5
);

-- Q.14 Calculate the variance of Conductivity for all samples.

SELECT VAR_SAMP(Conductivity) AS VarianceConductivity
FROM transformed_dataset;

-- Q.15  Retrieve ph and Potability for samples where Organic_carbon is within 10% of the maximum Organic_carbon value, and Turbidity is less than the overall average Turbidity.

SELECT ph, Potability
FROM transformed_dataset
WHERE Organic_carbon >= (SELECT MAX(Organic_carbon) * 0.90 FROM transformed_dataset)
  AND Turbidity < (SELECT AVG(Turbidity) FROM transformed_dataset);

-- Q.16 Find the ph of samples where Conductivity is an outlier, defined as being more than 3 standard deviations away from the mean Conductivity.

SELECT ph
FROM transformed_dataset
WHERE Conductivity > (SELECT AVG(Conductivity) + 3 * STDDEV(Conductivity) FROM transformed_dataset)
OR Conductivity < (SELECT AVG(Conductivity) - 3 * STDDEV(Conductivity) FROM transformed_dataset);

-- Q.17 Count the number of non-potable samples that have a ph value outside the ideal range (6.5 to 8.5) and a Chloramines concentration greater than 5.

SELECT COUNT(*) AS CountNonPotableOutOfRange
FROM transformed_dataset
WHERE Potability = 0
  AND (ph < 6.5 OR ph > 8.5)
  AND Chloramines > 5.0;


-- END--