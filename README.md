# 🍽️ Food Preferences Dataset Cleaning Project (SQL)

This repository showcases a complete data cleaning process of a food preference survey dataset using **MySQL**. The original dataset contained inconsistent, incomplete, and ambiguous values that needed to be cleaned and standardized for accurate analysis. All queries were written and executed in **MySQL**, and screenshots have been included to demonstrate each transformation.

---

## 🧠 Project Objective

To clean and prepare raw food-related survey data into a structured, analysis-ready format. The dataset consisted of user responses on various topics such as diet habits, food preferences, health behaviors, and demographics.

Rather than altering the original dataset directly, a **staging table** (`food_stage`) was created to apply transformations. This ensured the original data remained untouched and allowed for clean auditing of the transformation steps.

---

## 🛠️ Tools Used

- **MySQL** – for all data inspection, transformation, type conversion, and cleaning.

---

## 🧹 Data Cleaning Strategy

The dataset required extensive cleanup and standardization. The following steps were taken:

### 🔸 1. Column Standardization

- All column names were renamed to **PascalCase** for readability and SQL compatibility.  
  Example: `breakfast` → `Breakfast`, `calories_day` → `CaloriesImp`

### 🔸 2. Gender Normalization

- Numeric codes and ambiguous values were converted:
  - `0` → `'Male'`, `1` → `'Female'`, null/other → `'NoResponse'`

### 🔸 3. Handling Null and Ambiguous Values

- Replaced `'nan'`, `'NaN'`, empty strings, and nulls with `'NoResponse'` or `'Unknown'` for consistency.

### 🔸 4. Binary Flag Columns

- Transformed columns using `0`/`1` into readable values:
  - `1` → `'Yes'`
  - `0` or null → `'No'` or `'NoResponse'`

### 🔸 5. Categorical Mapping for Coded Fields

- Translated coded values into human-readable labels:
  - `ComfortFoodReasons`: `1` → `'Stress'`, `2` → `'Boredom'`, etc.
  - `IdealDiet`, `FavCuisine`, and `EatingChanges` were similarly decoded.
  - Ensured consistency between duplicated columns like `EatingChanges` and `EatingChanges2`.

### 🔸 6. Lifestyle Behavior Columns

- Cleaned and standardized columns like `Exercise`, `Smoker`, `PayMealOut`, `LivingSituation`.
- Uniform text formatting (`'Yes'`, `'No'`, `'NoResponse'`), removal of inconsistent free-text.

### 🔸 7. Self-Perception & Weight Columns

- Normalized responses for perceived weight (`SelfWeight`) into standard categories.

### 🔸 8. Food Item Calorie Columns

- Renamed vague columns for clarity:  
  `calories_chicken` → `ChickenCal`, `waffle_calories` → `WaffleCal`, etc.
- Checked for nulls and ensured consistent value entry.

---

## 🔢 Data Type Refinement

To improve data integrity and future querying performance, **data types were altered** where appropriate:

- **Boolean-type columns** (e.g., `Coffee`, `ParentsCook`, `Exercise`) were converted from numeric or text to `ENUM('Yes','No','NoResponse')`.
- **Coded categorical columns** were updated to `VARCHAR` with cleaned, mapped values.
- **Numerical columns** (e.g., `ChickenCal`, `SconeCal`) were kept or converted to appropriate numeric types (`INT` or `DECIMAL`) based on precision needs.
- Ensured that all columns reflected their actual data use-case rather than relying on the original incorrect or generic types.

---

## ✅ Summary

This SQL project involved comprehensive transformation steps including:

- Renaming and standardizing column headers
- Cleaning inconsistent values
- Mapping coded fields to readable categories
- Handling nulls and ambiguous entries
- Updating and correcting data types to match content and purpose

All changes were applied through SQL in a dedicated staging table to ensure data quality, reproducibility, and clear version control.

---

## 👤 About the Author

**Created by Moid Ahmed**  
Student at Southern New Hampshire University (SNHU)  
Enjoys working with structured data, bringing order to messy datasets, and developing practical SQL solutions for real-world analysis.

---
