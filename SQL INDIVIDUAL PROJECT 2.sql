-- To create Table for pet healthcare record

use DBMS;
create table pet_healthcare_records
(S_No int(3),
Pet_Name varchar(15),
Gender varchar(10),
Age_in_years int(3),
Weight_in_Kgs varchar(5),
Species varchar(20),
Breed varchar(20),
Health_Condition varchar(30),
Visit_Date varchar(10),
Last_Vaccination_Date varchar(10),
Vaccination_Required varchar(5),
Phone_No varchar(10),
Address varchar(50),
Doctor_Assigned varchar(20));


-- To insert data into pet_healthcare_record table

insert into pet_healthcare_records(S_No, Pet_Name, Gender, Age_in_years, Weight_in_kgs, 
Species, Breed, Health_Condition, Visit_Date, Last_Vaccination_Date, Vaccination_Required,
Phone_No, Address, Doctor_Assigned)
values(1, "Goofy", "Male", 1, 5, "Dog", "Shihtzu", "Vomitting", "06/11/2023","01/09/2023", 
"No", 9924554752, "B-205, Lotus residency,Mumbai", "Mr.chirag Singh"),
(2, "Coco", "Female", 1, 6, "Dog", "Lhasa", "Bruises", "12/05/2023", "10/02/2023",
"Yes", 9088645331, "C block, house.no-10, Navi Mumbai", "Mrs. Sunidhi Rathore"),
(3, "Alex", "Male", 2, 25, "Dog","Golden retriever", "Bacterial infection", "10/09/2023",
"20/03/2023", "Yes", 9756643211, "1002, D-block, Elogent heights, Mumbai", "Mr. Raj Malhotra"),
(4, "Max", "Male", 3, 29, "Dog","German Shepherd", "Ear infection", "25/12/2023", "01/02/2023",
"No", 9665321667, "H-3, florence bungalows, Navi Mumbai", "Mrs. Sunidhi Rathore"),
(5, "Lilly", "Female", 9, 4, "Cat", "Persian", "Eye problem", "16/07/2023", "24/01/2023",
"Yes", 9007543211, "A-502, Glory residency, Mumbai", "Mrs. Archana nair"),
(6, "James", "Male", 5, 7, "Cat", "Sphynx", "Dental disease", "19/08/2023", "30/03/2023",
"No", 9115743554, "E block, 908, tulip avenue, mumbai", "Mr. Sunil Yadav"),
(7, "Ginger", "Female", 1, 3, "Cat", "Ragdoll", "Diarrhea", "28/10/2023", "02/10/2023",
"yes", 9006432177, "D3-102, Taj regency, Navi Mumbai", "Mrs. Shreeya Iyer"),
(8, "Ryan", "Male", 4, 5, "Cat", "Siberian", "Respiratory infection", "06/06/2023",
 "17/01/2023", "No", 9228754311, "House no- 62, lulu heights, Mumbai", "Mrs. Shradha Ahir"),
(9, "Sara", "Female", 7, 4, "Cat", "Manx", "Vomitting", "08/07/2023", "15/06/2023",
"No", 9990467445, "G- block, 101,Diamond flats, Mumbai", "Mr. Abhishek Kapoor"),
(10, "Tyson", "Male", 3, 22, "Dog", "Bull dog", "Leg injury", "22/10/2023", "22/10/2023",
"Yes", 9123866432, "House.No- 9,Gulmohar township", "Mrs. Shreeya Iyer");


-- To create another table which includes certain past records of the pet

use DBMS;
create table pet_past_healthcare_records
(S_No int(3),
Pet_Name varchar(15),
Doctor_Assigned varchar(20),
Health_Condition varchar(30));
insert into Pet_past_healthcare_records(S_No, Pet_Name, Doctor_Assigned, Health_Condition)
values(1, "Goofy", "Mr.Raj Malhotra", "Vomitting"),
(2, "Coco", "Mrs. Sunidhi Rathore", "Bacterial infection"),
(3, "Alex", "Mr.Chirag Singh", "Bruises"),
(4, "Max", "Mrs. Sunidhi Rathore", "Ear infection"),
(5, "Lilly", "Mr.Sunil Yadav", "Dental disease"),
(6, "James", "Mrs. Archana Nair", "Eye problem"),
(7, "Ginger", "Mrs. Shreeya Iyer", "Diarrhea"),
(8, "Ryan", "Mr. Abhishek Kapoor", "Vomitting"),
(9, "Sara", "Mrs. Shradha Ahir", "Respiratory infection"),
(10, "Tyson", "Mrs. Shreeya Iyer", "Leg injury");


-- 1. To identify the consistency of same doctors assigned in past and present records
SELECT *
FROM pet_healthcare_records
INNER JOIN pet_past_healthcare_records
ON pet_healthcare_records.Pet_Name = pet_past_healthcare_records.Pet_Name 
AND pet_healthcare_records.Doctor_Assigned = pet_past_healthcare_records.Doctor_Assigned;

-- 2. To identify the same issue faced by pets in past and present records
SELECT *
FROM pet_healthcare_records
INNER JOIN pet_past_healthcare_records
ON pet_healthcare_records.Pet_Name = pet_past_healthcare_records.Pet_Name 
AND pet_healthcare_records.Health_Condition = pet_past_healthcare_records.Health_Condition;

-- 3. To fetch the details of only male dogs
select Pet_Name, Breed, Species
from pet_healthcare_records
where Species="Dog" and Gender="Male"
order by Pet_Name;

-- 4. To join together pet_healthcare_records and pet_past_healthcare_records to form a single table 
select*
FROM pet_healthcare_records
LEFT JOIN pet_past_healthcare_records
ON pet_healthcare_records.Pet_Name = pet_past_healthcare_records.Pet_Name;

-- 5. To identify the Pets who require vaccination
Select Pet_Name, Species, Last_Vaccination_Date, Vaccination_Required
from pet_healthcare_records
having Vaccination_Required= "Yes";

-- 6. To identify the most common health condition faced by an year old dogs
select*
from pet_healthcare_records
where 
Species= "Dog" and 
Age_in_years=1 
order by Health_Condition;

-- 7. To combine the records of vaccination related information
select 
Last_Vaccination_Date, 
Vaccination_Required
from pet_healthcare_records
union all
select 
Health_Condition, 
Pet_Name
from pet_past_healthcare_records;

-- 8. To categorize dogs according to their age
SELECT 
CASE 
    WHEN Species="Dog" AND Age_in_years=1 THEN "Baby Dog"
    ELSE "Adult Dog"
END as "Categorized acc to age"
FROM pet_healthcare_records
WHERE Species="Dog";

-- 9. To categorize cats acc to their age
SELECT 
CASE 
    WHEN Species="Cat" AND Age_in_years=1 THEN "Baby Cat"
    ELSE "Adult Cat"
END as "Categorized acc to age"
FROM pet_healthcare_records
WHERE Species="Cat";

-- 10. To calculate the number of adult dogs in the table
SELECT COUNT(*) as "Number of Adult Dogs"
FROM pet_healthcare_records
WHERE Species="Dog" AND Age_in_years>=1;

-- 11. To calculate the number of adult cats in table
SELECT COUNT(*) as "Number of Adult Cats"
FROM pet_healthcare_records
WHERE Species="Cat" AND Age_in_years>=1;

-- 12. To insert a new row in pet_healthcare_records
Insert into pet_healthcare_records(S_No, Pet_Name, Gender, Age_in_years, Weight_in_kgs, Species, Breed, Health_Condition,
Visit_Date, Last_Vaccination_Date, Vaccination_Required, Phone_No, Address, Doctor_Assigned)
values(11, "Bruno", "Male", 3, 8, "Dog", "Labrador", "Ear infection", "03/03/2023", "01/11/2023", "No", 9000754332, "D-block, 603, Bnjara hills",
"Mr.Sunil Yadav")










