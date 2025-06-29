# 💧 Water Quality Analysis - SQL - Excel

This repository contains a cleaned and transformed water quality dataset stored in a SQL database. It is designed to support machine learning projects, data analysis, and visualization related to **water potability**.

---

## 🧪 Dataset Overview

The dataset represents **physicochemical properties** of drinking water samples, along with a binary classification indicating **potability** (safe to drink or not).

### 📂 Database: `water_quality`

### 📄 Table: `transformed_dataset`

| Column             | Data Type | Description                                         |
|--------------------|-----------|-----------------------------------------------------|
| `ph`               | FLOAT     | Acidity or basicity of the water sample (primary key) |
| `Hardness`         | FLOAT     | Concentration of calcium and magnesium ions        |
| `Solids`           | FLOAT     | Total dissolved solids in ppm                      |
| `Chloramines`      | FLOAT     | Disinfectant used in water treatment               |
| `Sulfate`          | FLOAT     | Sulfate concentration in mg/L                      |
| `Conductivity`     | FLOAT     | Water's ability to conduct electricity (µS/cm)     |
| `Organic_carbon`   | FLOAT     | Organic carbon content in water (mg/L)             |
| `Trihalomethanes`  | FLOAT     | Chemical byproducts from chlorination              |
| `Turbidity`        | FLOAT     | Clarity of the water sample                        |
| `Potability`       | INT       | 1 = Potable (safe), 0 = Not Potable (unsafe)       |

---

## 🎯 Objectives

- Evaluate physicochemical indicators of water quality
- Classify water samples based on potability
- Perform data cleaning and transformation for modeling
- Support exploratory data analysis and visualization in tools like Power BI, Python (Pandas), or R

---

## 🛠 Tech Stack

- **SQL Server (as data source)**  
- **DAX Measures** for advanced calculations  
- **Power Query Editor** for ETL transformations
- **Excel** for data cleaning

---


## 🚀 Getting Started

1. Clone this repository
2. Import the `transformed_dataset` into your SQL environment
3. Run SQL queries or connect with your BI tool of choice
4. Use this data for:
   - Modeling potability
   - Building dashboards
   - Anomaly detection
   - Correlation analysis

---

## ✅ Conclusion

This project provides a clean and structured foundation for analyzing water quality and assessing potability using key chemical indicators. By leveraging SQL for data transformation and tools like Power BI or Python for visualization and modeling, users can gain valuable insights into what makes water safe or unsafe for consumption.

The `transformed_dataset` table serves as a robust dataset for:

- Training predictive models
- Conducting exploratory data analysis

Whether you're a data analyst, data scientist, or public health researcher, this repository offers a practical starting point to apply data-driven methods to real-world water safety challenges.

> 💡 Together, data and science can help ensure access to clean, potable water for all.

---


