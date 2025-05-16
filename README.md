# 🍽️ Food Preferences Dataset Cleaning Project (SQL)

This repository showcases a complete data cleaning process of a food preference survey dataset using **MySQL**. The original dataset contained inconsistent, incomplete, and ambiguous values that needed to be cleaned and standardized for accurate analysis. All queries were written and executed in **MySQL**, and screenshots have been included to demonstrate each transformation.

---

## 🧠 Project Objective

To clean and prepare raw food-related survey data into a structured, analysis-ready format. The dataset consisted of user responses on various topics such as diet habits, food preferences, health behaviors, and demographics.

Rather than altering the original dataset directly, a **staging table** (`food_stage`) was created to apply transformations. This ensured the original data remained untouched and allowed for clean auditing of the transformation steps.

---

## 🛠️ Tools Used

- **MySQL** – for all data inspection, cleaning, transformation, and querying.

---

## 🧹 Data Cleaning Strategy

The dataset contained numerous inconsistencies, coded values, nulls, and formatting issues. The following cleaning steps were performed entirely in SQL within MySQL:

### 🔸 1. Column Standardization

- All column names were renamed to **PascalCase** for better readability and SQL compatibility.  
  Example:
  - `breakfast` → `Breakfast`
  - `calories_day` → `CaloriesImp`
  - `comfort_food_reasons_coded` → `ComfortFoodReasons`

### 🔸 2. Gender Normalization

- Mapped numeric and ambiguous values to clear labels:
  - `0` → `'Male'`
  - `1` → `'Female'`
  - Any nulls or invalid entries → `'NoResponse'`

### 🔸 3. Handling Null and Ambiguous Values

- All `'nan'`, `'NaN'`, or null-like entries were replaced with `'NoResponse'` or `'Unknown'` where appropriate.
- This was applied across nearly all columns to ensure consistent null handling.

### 🔸 4. Binary Flag Columns

- Multiple columns with `0`/`1` values (e.g., `Breakfast`, `Coffee`, `ParentsCook`) were converted:
  - `1` → `'Yes'`
  - `0` or null → `'No'` or `'NoResponse'`

### 🔸 5. Categorical Mapping for Coded Fields

Several columns used integer codes that were mapped to descriptive strings:

- **Comfort Food Reasons**
  - `1` → `'Stress'`, `2` → `'Boredom'`, `3` → `'Depression'`, etc.
- **Ideal Diet**
  - Mapped codes to options like `'Low Carb'`, `'Paleo'`, `'Keto'`, `'Balanced'`, etc.
- **FavCuisine**
  - Mapped to `'Italian'`, `'Mexican'`, `'Chinese'`, `'Indian'`, `'American'`, etc.
- **Eating Changes**
  - Normalized multiple variations of yes/no responses, accounted for multiple survey versions (`EatingChanges`, `EatingChanges2`).

### 🔸 6. Lifestyle Behavior Columns

- Columns such as `Exercise`, `Smoker`, `PayMealOut`, and `LivingSituation` were cleaned:
  - Mapped inconsistent text responses and codes to `'Yes'`, `'No'`, or `'NoResponse'`
  - Ensured boolean-type columns had uniform casing and clarity

### 🔸 7. Self-Perception & Weight Columns

- **SelfWeight** responses like `"Too Much"`, `"Too Little"`, `"About Right"` were standardized and assigned `'NoResponse'` for any unknowns.
- Normalized perception values into proper case and readable categories.

### 🔸 8. Food Item Calorie Columns

- Columns like `ChickenCal`, `SconeCal`, `PaneraCal`, `WaffleCal`, and `BurritoCal` were renamed from unclear names and checked for nulls.
- Any missing entries were labeled `'NoResponse'` or left null as needed for numeric columns.

---

## ✅ Summary

This SQL project involved over 20 transformation steps including:

- Column renaming
- Null value handling
- Value replacement for binary and categorical fields
- Text standardization
- Normalization across duplicated or multi-version fields

The cleaned dataset is now ready for meaningful analysis and visualization.

---

## 👤 About the Author

**Created by Moid Ahmed**  
Student at Southern New Hampshire University (SNHU)  
Loves working with structured data and building meaningful insights through clean, logical transformations.

---
