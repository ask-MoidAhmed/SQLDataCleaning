#  Two Datasets Cleaning Project (SQL)

## 🍽️ Food Preferences Dataset Cleaning Project (SQL)

This repository showcases a complete data cleaning process of a food preference survey dataset using **MySQL**. The original dataset contained inconsistent, incomplete, and ambiguous values that needed to be cleaned and standardized for accurate analysis. All queries were written and executed in **MySQL**, and screenshots have been included to demonstrate each transformation.

---

## 🧠 Project Objective

To clean and prepare raw food-related survey data into a structured, analysis-ready format. The dataset consisted of user responses on various topics such as diet habits, food preferences, health behaviors, and demographics.

Rather than altering the original dataset directly, a **staging table** (`food_stage`) was created to apply transformations. This ensured the original data remained untouched and allowed for clean auditing of the transformation steps.

---

### 🛠️ Tools Used

- **MySQL** – for all data inspection, transformation, type conversion, and cleaning.

---

### 🧹 Data Cleaning Strategy

The dataset required extensive cleanup and standardization. The following steps were taken:

### 🔸 1. Column Standardization

- All column names were renamed to **PascalCase** for readability and SQL compatibility.  
  Example: `breakfast` → `Breakfast`, `calories_day` → `CaloriesImp`

![image](https://github.com/user-attachments/assets/74f16653-7d2c-496d-a734-47eafc5f3239)

### 🔸 2. Gender Normalization

- Numeric codes and ambiguous values were converted:
  - `0` → `'Male'`, `1` → `'Female'`, null/other → `'NoResponse'`\

![image](https://github.com/user-attachments/assets/f183704e-86a2-470e-97f2-73887cbda8b1)

### 🔸 3. Handling Null and Ambiguous Values

- Replaced `'nan'`, `'NaN'`, empty strings, and nulls with `'NoResponse'` or `'Unknown'` for consistency.

![image](https://github.com/user-attachments/assets/b2704300-552f-48da-baeb-ba68a0efef51)

### 🔸 4. Categorical Mapping for Coded Fields

- Translated coded values into human-readable labels:
  - `ComfortFoodReasons`: `1` → `'Stress'`, `2` → `'Boredom'`, etc.
  - `IdealDiet`, `FavCuisine`, and `EatingChanges` were similarly decoded.
  - Ensured consistency between duplicated columns like `EatingChanges` and `EatingChanges2`.

![image](https://github.com/user-attachments/assets/7d83d784-0fe5-4ae5-bd2b-2b7b471f5932)

### 🔸 5. Lifestyle Behavior Columns

- Cleaned and standardized columns like `Exercise`, `Smoker`, `PayMealOut`, `LivingSituation`.
- Uniform text formatting (`'Yes'`, `'No'`, `'NoResponse'`), removal of inconsistent free-text.

![image](https://github.com/user-attachments/assets/699e1097-83f0-4c2e-9dc8-4ec9298f3542)

### 🔸 6. Self-Perception & Weight Columns

- Normalized responses for perceived weight (`SelfWeight`) into standard categories.

![image](https://github.com/user-attachments/assets/db6e44f2-ea38-4d61-b4c7-08a870f90113)

### 🔸 7. Food Item Calorie Columns

- Renamed vague columns for clarity:  
  `calories_chicken` → `ChickenCal`, `waffle_calories` → `WaffleCal`, etc.
- Checked for nulls and ensured consistent value entry.

![image](https://github.com/user-attachments/assets/8ec1008b-450a-476e-88b1-498744eed231)

---

### 🔢 Data Type Refinement

To improve data integrity and future querying performance, **data types were altered** where appropriate:

- **Boolean-type columns** (e.g., `Coffee`, `ParentsCook`, `Exercise`) were converted from numeric or text to `ENUM('Yes','No','NoResponse')`.
- **Coded categorical columns** were updated to `VARCHAR` with cleaned, mapped values.
- **Numerical columns** (e.g., `ChickenCal`, `SconeCal`) were kept or converted to appropriate numeric types (`INT` or `DECIMAL`) based on precision needs.
- Ensured that all columns reflected their actual data use-case rather than relying on the original incorrect or generic types.

![image](https://github.com/user-attachments/assets/0a7f5821-7e70-44a5-a6cb-47f9721916c9)

![image](https://github.com/user-attachments/assets/f91ed9d0-c562-41ff-9b47-882921ceb7b9)

![image](https://github.com/user-attachments/assets/ccbfab30-96a8-494b-8767-9d72524d98d2)

---

### ✅ Summary

This SQL project involved comprehensive transformation steps including:

- Renaming and standardizing column headers
- Cleaning inconsistent values
- Mapping coded fields to readable categories
- Handling nulls and ambiguous entries
- Updating and correcting data types to match content and purpose

All changes were applied through SQL in a dedicated staging table to ensure data quality, reproducibility, and clear version control.

---

## 🧹 Audible SQL Data Cleaning

### 📌 Overview
This project showcases hands-on SQL data cleaning techniques applied to a messy Audible audiobook dataset. It simulates real-world challenges in preparing data for analysis, focusing on format consistency, null handling, and data type standardization.

### 🎯 Objectives
- 📋 Create a clean working copy of the original dataset
- 🧽 Remove noisy labels and normalize key fields
- 📅 Standardize date formats and 📈 prepare time values for analysis
- 🧾 Separate and clean complex text fields (e.g., stars/ratings)

### 🛠️ Cleaning Process

###  Author & Narrator
- Removed embedded text like `Writtenby:` and `Narratedby:` from their respective columns to ensure uniform naming.

![image](https://github.com/user-attachments/assets/51980e65-6d42-4685-baa0-d0dc5906b3ad)

###  Release Date
- Converted text-based `RELEASEDATE` values into standard SQL `DATE` format using `STR_TO_DATE()`.

![image](https://github.com/user-attachments/assets/5e470cd0-cf1f-494a-9c2f-48533afbbf15)

###  Ratings & Reviews
- Cleaned and split the `STARS` column into two logical columns:
  - `StarsClean`: Extracted numeric star ratings
  - `Ratings`: Pulled out the number of ratings
- Replaced values like `"Not yet rated"` with `NULL` for accurate handling.

![image](https://github.com/user-attachments/assets/727b4589-a4ec-448b-a264-71f1f8b38bb8)

![image](https://github.com/user-attachments/assets/bf0f08bd-ff72-47d6-a405-c04c4d780c1e)

![image](https://github.com/user-attachments/assets/18d6a439-0e86-4bbf-9509-8dd0889b792d)

###  Listening Time
- Transformed verbose time values (e.g., `"4 hrs and 45 mins"`) into structured `HH:MM` format.
- Ensured compatibility by converting the values into SQL time format.

![image](https://github.com/user-attachments/assets/543fc41c-dae7-4c86-b6b1-ad5a191ac405)

### ✅ Outcomes
- 🔍 Increased data clarity and consistency across all major fields.
- 📐 Enabled precise querying and analysis for business intelligence.
- 🧩 Built a foundation for further data enrichment or dashboarding.

### 🧠 Skills Demonstrated
- SQL data wrangling & transformation  
- Text parsing and cleanup  
- Date & time format conversion  
- Null and edge-case handling  
- Real-world ETL logic simulation

---

## 👤 About the Author

**Created by Moid Ahmed**  
Student at Southern New Hampshire University (SNHU)  
Enjoys working with structured data, bringing order to messy datasets, and developing practical SQL solutions for real-world analysis.
