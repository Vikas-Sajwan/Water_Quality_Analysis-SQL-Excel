-- WATER QUALITY ANALYSIS SCHEMAS

CREATE DATABASE water_quality;
USE water_quality;


DROP TABLE IF EXISTS transformed_dataset;


CREATE TABLE transformed_dataset
(
	ph float primary key,
    Hardness float,
    Solids float,
    Chloramines float,
    Sulfate float,
    Conductivity float,
    Organic_carbon float,
    Trihalomethanes float,
    Turbidity float,
    Potability int
);
									


-- END OF SCHEMAS







