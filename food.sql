-- LETS LOOK AT THE DATA

SELECT *
FROM food;

-- BASIC DATA CHECKING LIKE SEE IF DATA ENTRIES ARE VALID LIKE IF GPA IS UNDER OR 4

SELECT *
FROM food
ORDER BY GPA DESC
LIMIT 1;

-- BEFORE DOING ANYTHING WE NEED TO CREATE A NEW TABLE WITH ALL THIS INFORMATION AS YOU SHOULD NEVER WORK ON RAW DATA INCASE OF ANY ERRORS

CREATE TABLE food_stage
SELECT * FROM food;

SELECT *
FROM food_stage;

-- NOW WE CAN WORK ON DATA CLEAN UP
-- ALOT OF DATA VALUES ARE EITHER 1 OR 2 WHICH ARE BASICALLY OPTIONS SO WE NEED TO FIX AND WRITE THE ACTUAL CHOICES
-- FIRST WE NEED TO DISABLE SAFE UPDATES SO WE CAN EASILY WORK ON EVERYTHING

SET SQL_SAFE_UPDATES = 1;

-- FIXING DATA TYPE FIRST SO WE CAN CHANGE THE VALUES TO STRINGS

ALTER TABLE food_stage
MODIFY COLUMN Gender VARCHAR(20),
MODIFY COLUMN breakfast VARCHAR(20),
MODIFY COLUMN coffee VARCHAR(20),
MODIFY COLUMN calories_day VARCHAR(20),
MODIFY COLUMN comfort_food_reasons_coded VARCHAR(20),
MODIFY COLUMN cook VARCHAR(20),
MODIFY COLUMN cuisine VARCHAR(20),
MODIFY COLUMN diet_current_coded VARCHAR(20),
MODIFY COLUMN drink VARCHAR(20),
MODIFY COLUMN eating_changes_coded VARCHAR(20),
MODIFY COLUMN eating_changes_coded1 VARCHAR(20),
MODIFY COLUMN eating_out VARCHAR(20),
MODIFY COLUMN employment VARCHAR(20),
MODIFY COLUMN ethnic_food VARCHAR(20),
MODIFY COLUMN exercise VARCHAR(20),
MODIFY COLUMN father_education VARCHAR(20),
MODIFY COLUMN fav_cuisine_coded VARCHAR(20),
MODIFY COLUMN fav_food VARCHAR(20),
MODIFY COLUMN fries VARCHAR(20),
MODIFY COLUMN fruit_day VARCHAR(20),
MODIFY COLUMN grade_level VARCHAR(20),
MODIFY COLUMN greek_food VARCHAR(20),
MODIFY COLUMN ideal_diet_coded VARCHAR(20),
MODIFY COLUMN income VARCHAR(20),
MODIFY COLUMN indian_food VARCHAR(20),
MODIFY COLUMN marital_status VARCHAR(20),
MODIFY COLUMN mother_education VARCHAR(20),
MODIFY COLUMN nutritional_check VARCHAR(20),
MODIFY COLUMN on_off_campus VARCHAR(20),
MODIFY COLUMN parents_cook VARCHAR(20),
MODIFY COLUMN pay_meal_out VARCHAR(20),
MODIFY COLUMN persian_food VARCHAR(20),
MODIFY COLUMN self_perception_weight VARCHAR(20),
MODIFY COLUMN soup VARCHAR(20),
MODIFY COLUMN sports VARCHAR(20),
MODIFY COLUMN thai_food VARCHAR(20),
MODIFY COLUMN tortilla_calories VARCHAR(20),
MODIFY COLUMN turkey_calories VARCHAR(20),
MODIFY COLUMN veggies_day VARCHAR(20),
MODIFY COLUMN vitamins VARCHAR(20),
MODIFY COLUMN waffle_calories VARCHAR(20),
MODIFY COLUMN italian_food VARCHAR(20);

-- LETS CHECK

DESCRIBE food_stage;

-- AND WHILE WE'RE HERE LETS CHANGE THE COLUMNS NAME TO PASCAL CASE

ALTER TABLE food_stage
RENAME COLUMN Gender TO Gender,
RENAME COLUMN breakfast TO Breakfast,
RENAME COLUMN coffee TO Coffee,
RENAME COLUMN calories_chicken TO ChickenCal,
RENAME COLUMN calories_scone TO SconeCal,
RENAME COLUMN calories_day TO CaloriesImp,
RENAME COLUMN comfort_food_reasons_coded TO ComfortFoodReasons,
RENAME COLUMN cook TO Cook,
RENAME COLUMN cuisine TO Cuisine,
RENAME COLUMN diet_current_coded TO DietCurrent,
RENAME COLUMN drink TO Drink,
RENAME COLUMN eating_changes_coded TO EatingChanges,
RENAME COLUMN eating_changes_coded1 TO EatingChanges2,
RENAME COLUMN eating_out TO EatingOut,
RENAME COLUMN employment TO Employment,
RENAME COLUMN ethnic_food TO EthnicFood,
RENAME COLUMN exercise TO Exercise,
RENAME COLUMN father_education TO FatherEducation,
RENAME COLUMN fav_cuisine_coded TO FavCuisine,
RENAME COLUMN fav_food TO FavFood,
RENAME COLUMN fries TO Fries,
RENAME COLUMN fruit_day TO FruitDay,
RENAME COLUMN grade_level TO GradeLevel,
RENAME COLUMN greek_food TO GreekFood,
RENAME COLUMN ideal_diet_coded TO IdealDiet,
RENAME COLUMN income TO Income,
RENAME COLUMN indian_food TO IndianFood,
RENAME COLUMN marital_status TO MaritalStatus,
RENAME COLUMN mother_education TO MotherEducation,
RENAME COLUMN nutritional_check TO NutritionalCheck,
RENAME COLUMN on_off_campus TO LivingSituation,
RENAME COLUMN parents_cook TO ParentsCook,
RENAME COLUMN pay_meal_out TO PayMealOut,
RENAME COLUMN persian_food TO PersianFood,
RENAME COLUMN self_perception_weight TO SelfWeight,
RENAME COLUMN soup TO Soup,
RENAME COLUMN sports TO Sports,
RENAME COLUMN thai_food TO ThaiFood,
RENAME COLUMN tortilla_calories TO BurritoCal,
RENAME COLUMN turkey_calories TO PaneraCal,
RENAME COLUMN veggies_day TO VeggiesDay,
RENAME COLUMN vitamins TO Vitamins,
RENAME COLUMN waffle_calories TO WaffleCal,
RENAME COLUMN italian_food TO ItalianFood,
RENAME COLUMN weight TO Weight;

ALTER TABLE food_stage
MODIFY COLUMN ItalianFood VARCHAR(20);

SELECT *
FROM food_stage;

-- FIXING THE DATA CHOICES

UPDATE food_stage
SET Gender = CASE
				WHEN Gender = 2 THEN 'Male'
                WHEN Gender = 1 THEN 'Female'
                ELSE Gender
			END,
Breakfast = CASE
				WHEN Breakfast = 1 THEN 'Cereal'
                WHEN Breakfast = 2 THEN 'Donut'
                ELSE Breakfast
			END,
CaloriesImp = CASE
			WHEN CaloriesImp = 'nan' THEN 'NoResponse'
            WHEN CaloriesImp = 1 THEN 'IDK'
            WHEN CaloriesImp = 2 THEN 'NotImp'
            WHEN CaloriesImp = 3 THEN 'Imp'
            WHEN CaloriesImp = 4 THEN 'VeryImp'
            ELSE CaloriesImp
            END;

UPDATE food_stage
SET 
    Coffee = CASE
        WHEN Coffee = '1' THEN 'Frapuccino'
        WHEN Coffee = '2' THEN 'Espresso'
        ELSE Coffee
    END,
    ComfortFoodReasons = CASE
        WHEN ComfortFoodReasons = '1' THEN 'Stress'
        WHEN ComfortFoodReasons = '2' THEN 'Boredom'
        WHEN ComfortFoodReasons = '3' THEN 'Sadness'
        WHEN ComfortFoodReasons = '4' THEN 'Hunger'
        WHEN ComfortFoodReasons = '5' THEN 'Lazy'
        WHEN ComfortFoodReasons = '6' THEN 'Cold'
        WHEN ComfortFoodReasons = '7' THEN 'Happy'
        WHEN ComfortFoodReasons = '8' THEN 'TV'
        WHEN ComfortFoodReasons = '9' THEN 'None'
        ELSE ComfortFoodReasons
    END,
    Cook = CASE
        WHEN Cook = '1' THEN 'Daily'
        WHEN Cook = '2' THEN 'Weekly'
        WHEN Cook = '3' THEN 'Rarely'
        WHEN Cook = '4' THEN 'Holidays'
        WHEN Cook = '5' THEN 'Never'
        ELSE Cook
    END,
    Cuisine = CASE
		WHEN Cuisine = 'nan' THEN 'NoResponse'
        WHEN Cuisine = '1' THEN 'American'
        WHEN Cuisine = '2' THEN 'Mexican'
        WHEN Cuisine = '3' THEN 'Asian'
        WHEN Cuisine = '4' THEN 'Indian'
        WHEN Cuisine = '5' THEN 'Fusion'
        WHEN Cuisine = '6' THEN 'Other'
        ELSE Cuisine
    END,
    DietCurrent = CASE
        WHEN DietCurrent = '1' THEN 'Healthy'
        WHEN DietCurrent = '2' THEN 'Unhealthy'
        WHEN DietCurrent = '3' THEN 'Repetitive'
        WHEN DietCurrent = '4' THEN 'Unclear'
        ELSE DietCurrent
    END,
    Drink = CASE
        WHEN Drink = '1' THEN 'Juice'
        WHEN Drink = '2' THEN 'Soda'
        ELSE Drink
    END,
    EatingChanges = CASE
        WHEN EatingChanges = '1' THEN 'Worse'
        WHEN EatingChanges = '2' THEN 'Better'
        WHEN EatingChanges = '3' THEN 'Same'
        WHEN EatingChanges = '4' THEN 'Unclear'
        ELSE EatingChanges
    END;
    
UPDATE food_stage
SET 
  EatingChanges2 = CASE EatingChanges2
    WHEN 'nan' THEN 'NoResponse'
    WHEN '1' THEN 'EatFast'
    WHEN '2' THEN 'MoreFood'
    WHEN '3' THEN 'WorseQuality'
    WHEN '4' THEN 'SameFood'
    WHEN '5' THEN 'Healthier'
    WHEN '6' THEN 'Unclear'
    WHEN '7' THEN 'MoreCoffee'
    WHEN '8' THEN 'LessFood'
    WHEN '9' THEN 'MoreSweets'
    WHEN '10' THEN 'Timing'
    WHEN '11' THEN 'MoreSnacks'
    WHEN '12' THEN 'MoreWater'
    WHEN '13' THEN 'MoreVariety'
    ELSE EatingChanges2
  END,
  EatingOut = CASE EatingOut
    WHEN 'nan' THEN 'NoResponse'
    WHEN '1' THEN 'Never'
    WHEN '2' THEN '1-2x'
    WHEN '3' THEN '2-3x'
    WHEN '4' THEN '3-5x'
    WHEN '5' THEN 'Everyday'
    ELSE EatingOut
  END,
  Employment = CASE Employment
	WHEN 'nan' THEN 'NoResponse'
    WHEN '1' THEN 'FullTime'
    WHEN '2' THEN 'PartTime'
    WHEN '3' THEN 'No'
    WHEN '4' THEN 'Other'
    ELSE Employment
  END,
  EthnicFood = CASE EthnicFood
    WHEN 'nan' THEN 'NoResponse'
    WHEN '1' THEN 'VeryUnlikely'
    WHEN '2' THEN 'Unlikely'
    WHEN '3' THEN 'Neutral'
    WHEN '4' THEN 'Likely'
    WHEN '5' THEN 'VeryLikely'
    ELSE EthnicFood
  END,
  Exercise = CASE Exercise
    WHEN 'nan' THEN 'NoResponse'
    WHEN '1' THEN 'Everyday'
    WHEN '2' THEN '2-3xPerWeek'
    WHEN '3' THEN 'OncePerWeek'
    WHEN '4' THEN 'Sometimes'
    WHEN '5' THEN 'Never'
    ELSE Exercise
  END,
  FatherEducation = CASE FatherEducation
    WHEN 'nan' THEN 'NoResponse'
    WHEN '1' THEN 'LessHS'
    WHEN '2' THEN 'HS'
    WHEN '3' THEN 'SomeCollege'
    WHEN '4' THEN 'College'
    WHEN '5' THEN 'Graduate'
    ELSE FatherEducation
  END,
  FavCuisine = CASE FavCuisine
    WHEN 'nan' THEN 'NoResponse'
    WHEN '0' THEN 'None'
    WHEN '1' THEN 'ItalFreGre'
    WHEN '2' THEN 'SpanMex'
    WHEN '3' THEN 'ArabTurk'
    WHEN '4' THEN 'Asian'
    WHEN '5' THEN 'American'
    WHEN '6' THEN 'African'
    WHEN '7' THEN 'Jamaican'
    WHEN '8' THEN 'Indian'
    ELSE FavCuisine
  END,
  FavFood = CASE FavFood
    WHEN 'nan' THEN 'NoResponse'
    WHEN '1' THEN 'CookedHome'
    WHEN '2' THEN 'StoreBought'
    WHEN '3' THEN 'Both'
    ELSE FavFood
  END,
  Fries = CASE Fries
    WHEN 'nan' THEN 'NoResponse'
    WHEN '1' THEN 'McdFries'
    WHEN '2' THEN 'HomeFries'
    ELSE Fries
  END,
  FruitDay = CASE FruitDay
    WHEN 'nan' THEN 'NoResponse'
    WHEN '1' THEN 'VeryUnlikely'
    WHEN '2' THEN 'Unlikely'
    WHEN '3' THEN 'Neutral'
    WHEN '4' THEN 'Likely'
    WHEN '5' THEN 'VeryLikely'
    ELSE FruitDay
  END,
  GradeLevel = CASE GradeLevel
    WHEN 'nan' THEN 'NoResponse'
    WHEN '1' THEN 'Freshman'
    WHEN '2' THEN 'Sophomore'
    WHEN '3' THEN 'Junior'
    WHEN '4' THEN 'Senior'
    ELSE GradeLevel
  END,
  GreekFood = CASE GreekFood
    WHEN 'nan' THEN 'NoResponse'
    WHEN '1' THEN 'VeryUnlikely'
    WHEN '2' THEN 'Unlikely'
    WHEN '3' THEN 'Neutral'
    WHEN '4' THEN 'Likely'
    WHEN '5' THEN 'VeryLikely'
    ELSE GreekFood
  END,
  IdealDiet = CASE IdealDiet
    WHEN 'nan' THEN 'NoResponse'
    WHEN '1' THEN 'PortionControl'
    WHEN '2' THEN 'AddVeggies'
    WHEN '3' THEN 'Balance'
    WHEN '4' THEN 'LessSugar'
    WHEN '5' THEN 'HomeCooked'
    WHEN '6' THEN 'CurrentDiet'
    WHEN '7' THEN 'MoreProtein'
    WHEN '8' THEN 'Unclear'
    ELSE IdealDiet
  END,
  Income = CASE Income
    WHEN 'nan' THEN 'NoResponse'
    WHEN '1' THEN '<15K'
    WHEN '2' THEN '15K-30K'
    WHEN '3' THEN '30K-50K'
    WHEN '4' THEN '50K-70K'
    WHEN '5' THEN '70K-100K'
    WHEN '6' THEN '>100K'
    ELSE Income
  END,
  IndianFood = CASE IndianFood
    WHEN 'nan' THEN 'NoResponse'
    WHEN '1' THEN 'VeryUnlikely'
    WHEN '2' THEN 'Unlikely'
    WHEN '3' THEN 'Neutral'
    WHEN '4' THEN 'Likely'
    WHEN '5' THEN 'VeryLikely'
    ELSE IndianFood
  END,
  ItalianFood = CASE ItalianFood
    WHEN 'nan' THEN 'NoResponse'
    WHEN '1' THEN 'VeryUnlikely'
    WHEN '2' THEN 'Unlikely'
    WHEN '3' THEN 'Neutral'
    WHEN '4' THEN 'Likely'
    WHEN '5' THEN 'VeryLikely'
    ELSE ItalianFood
  END,
  MaritalStatus = CASE MaritalStatus
    WHEN 'nan' THEN 'NoResponse'
    WHEN '1' THEN 'Single'
    WHEN '2' THEN 'Relationship'
    WHEN '3' THEN 'Cohabiting'
    WHEN '4' THEN 'Married'
    WHEN '5' THEN 'Divorced'
    WHEN '6' THEN 'Widowed'
    ELSE MaritalStatus
  END,
  MotherEducation = CASE MotherEducation
    WHEN 'nan' THEN 'NoResponse'
    WHEN '1' THEN 'LessHS'
    WHEN '2' THEN 'HS'
    WHEN '3' THEN 'SomeCollege'
    WHEN '4' THEN 'College'
    WHEN '5' THEN 'Graduate'
    ELSE MotherEducation
  END,
  
  NutritionalCheck = CASE NutritionalCheck
	WHEN 'nan' THEN 'NoResponse'
    WHEN '1' THEN 'Never'
    WHEN '2' THEN 'CertainOnly'
    WHEN '3' THEN 'VeryRarely'
    WHEN '4' THEN 'MostProducts'
    WHEN '5' THEN 'Everything'
    ELSE NutritionalCheck
  END,
  LivingSituation = CASE LivingSituation
	WHEN 'nan' THEN 'NoResponse'
    WHEN '1' THEN 'OnCampus'
    WHEN '2' THEN 'RentOffCampus'
    WHEN '3' THEN 'LiveWithParents'
    WHEN '4' THEN 'OwnHouse'
    ELSE LivingSituation
  END,
  ParentsCook = CASE ParentsCook
    WHEN 'nan' THEN 'NoResponse'
    WHEN '1' THEN 'AlmostEveryday'
    WHEN '2' THEN '2-3xWeek'
    WHEN '3' THEN '1-2xWeek'
    WHEN '4' THEN 'HolidaysOnly'
    WHEN '5' THEN 'Never'
    ELSE ParentsCook
  END,
  PayMealOut = CASE PayMealOut
    WHEN 'nan' THEN 'NoResponse'
    WHEN '1' THEN 'UpTo5'
    WHEN '2' THEN '5-10'
    WHEN '3' THEN '10-20'
    WHEN '4' THEN '20-30'
    WHEN '5' THEN '30-40'
    WHEN '6' THEN 'Above40'
    ELSE PayMealOut
  END,
  PersianFood = CASE PersianFood
    WHEN 'nan' THEN 'NoResponse'
    WHEN '1' THEN 'VeryUnlikely'
    WHEN '2' THEN 'Unlikely'
    WHEN '3' THEN 'Neutral'
    WHEN '4' THEN 'Likely'
    WHEN '5' THEN 'VeryLikely'
    ELSE PersianFood
  END,
  SelfWeight = CASE SelfWeight
    WHEN 'nan' THEN 'NoResponse'
    WHEN '6' THEN 'NoSelfView'
    WHEN '5' THEN 'Overweight'
    WHEN '4' THEN 'SlightOverweight'
    WHEN '3' THEN 'JustRight'
    WHEN '2' THEN 'VeryFit'
    WHEN '1' THEN 'Slim'
    ELSE SelfWeight
  END,
  Soup = CASE Soup
    WHEN 'nan' THEN 'NoResponse'
    WHEN '1' THEN 'VeggieSoup'
    WHEN '2' THEN 'CreamySoup'
    ELSE Soup
  END,
  Sports = CASE Sports
    WHEN 'nan' THEN 'NoResponse'
    WHEN '1' THEN 'Yes'
    WHEN '2' THEN 'No'
    WHEN '99' THEN 'NoResponse'
    ELSE Sports
  END,
  ThaiFood = CASE ThaiFood
    WHEN 'nan' THEN 'NoResponse'
    WHEN '1' THEN 'VeryUnlikely'
    WHEN '2' THEN 'Unlikely'
    WHEN '3' THEN 'Neutral'
    WHEN '4' THEN 'Likely'
    WHEN '5' THEN 'VeryLikely'
    ELSE ThaiFood
  END,
  VeggiesDay = CASE VeggiesDay
	WHEN 'nan' THEN 'NoResponse'
    WHEN '1' THEN 'VeryUnlikely'
    WHEN '2' THEN 'Unlikely'
    WHEN '3' THEN 'Neutral'
    WHEN '4' THEN 'Likely'
    WHEN '5' THEN 'VeryLikely'
    ELSE VeggiesDay
  END,
  Vitamins = CASE Vitamins
	WHEN 'nan' THEN 'NoResponse'
    WHEN '1' THEN 'Yes'
    WHEN '2' THEN 'No'
    ELSE Vitamins
  END;
    
SELECT *
FROM food_stage;

-- AFTER ALL THAT LETS NOW FIX THE WEIGHT.

SELECT Weight
FROM food_stage;

-- FIRST WE MAKE ALL THE TEXT VALUES AS NULL
-- NOW THIS DATA IS SMALL BUT IMAGINE IF WE HAD THOUSAND OF ROWS JUST USING EXACT MATCHES WONT BE GOOD

UPDATE food_stage
SET Weight = NULL
WHERE Weight NOT LIKE '%0%'
AND Weight NOT LIKE '%1%'
AND Weight NOT LIKE '%2%'
AND Weight NOT LIKE '%3%'
AND Weight NOT LIKE '%4%'
AND Weight NOT LIKE '%5%'
AND Weight NOT LIKE '%6%'
AND Weight NOT LIKE '%7%'
AND Weight NOT LIKE '%8%'
AND Weight NOT LIKE '%9%';

UPDATE food_stage
SET Weight = 240
WHERE Weight LIKE '%240';

UPDATE food_stage
SET Weight = 144
WHERE Weight LIKE '144%';

-- SO THIS IS THE CASE WHERE I WANT THE WEIGHT TO BE AN INT COLUMN, HENCE LEAVING IT NULL IS IMPORTANT AS PUTTING NA OR NoResponse WOULD BE INCORRECT

ALTER TABLE food_stage
MODIFY COLUMN Weight INT;

DESCRIBE food_stage;

-- NOW THIS TABLE HAS ALOT OF NLP DATA WHICH IS USEFUL FOR MACHINE LEARNING BUT WE DONT REALLY CARE ABOUT THAT SO WE CAN JUST DROP THOSE COLUMNS
-- ALSO REMOVE THE COLUMNS THAT ARE STRAIGHT UP DUPLICATES

ALTER TABLE food_stage
DROP COLUMN comfort_food,
DROP COLUMN comfort_food_reasons,
DROP COLUMN `comfort_food_reasons_coded_[0]`,
DROP COLUMN diet_current,
DROP COLUMN eating_changes,
DROP COLUMN father_profession,
DROP COLUMN fav_cuisine,
DROP COLUMN food_childhood,
DROP COLUMN healthy_meal,
DROP COLUMN ideal_diet,
DROP COLUMN meals_dinner_friend,
DROP COLUMN mother_profession,
DROP COLUMN type_sports;

SELECT *
FROM food_stage;

-- ALSO LETS FIND ANY DUPLICATES

SELECT ROW_NUMBER() OVER(
					PARTITION BY GPA, Gender, Breakfast, ChickenCal, CaloriesImp, SconeCal, Coffee, ComfortFoodReasons, Cook, Cuisine, DietCurrent, EatingChanges, EatingChanges2, EatingOut, Employment, EthnicFood, FatherEducation, FavCuisine, FavFood, FruitDay, Fries, GradeLevel, GreekFood, healthy_feeling, IdealDiet, Income, IndianFood, ItalianFood, life_rewarding, MaritalStatus, MotherEducation, NutritionalCheck, LivingSituation, ParentsCook, PayMealOut, PersianFood, SelfWeight, Soup, Sports, ThaiFood, BurritoCal, PaneraCal, VeggiesDay, Vitamins, WaffleCal, Weight
                    ) AS row_num
FROM food_stage;

-- NONE

-- LETS RENAME THE LAST FEW COLUMNS

ALTER TABLE food_stage
RENAME COLUMN life_rewarding TO LifeRewardRate;

ALTER TABLE food_stage
RENAME COLUMN healthy_feeling TO HealthRate;