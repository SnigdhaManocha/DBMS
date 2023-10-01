* To create a table hospital management
create database DBMS;
use DBMS;

create table Hospital_Management
(S_No int(3), 
Patient_Name varchar(20), 
Patient_Gender varchar(10),
Patient_Weight int(3),
Patient_Age int(3),
Phone_No varchar(10), 
Health_Issue varchar(20), 
Blood_Group varchar(5), 
Patient_Address varchar(20), 
Appointment_Date varchar(20), 
Appointment_Time varchar(20),
Visit_Date varchar(20), 
Visit_Time varchar(20),
 Doctor_Assigned varchar(20));

insert into Hospital_Management(S_No, Patient_Name, Patient_Gender,Patient_Weight,
Patient_Age, Phone_No, Health_Issue, Blood_Group, Patient_Address, Appointment_Date, 
Appointment_Time, Visit_Date, Visit_Time, Doctor_Assigned)
values(1, "Ms.Sejal Kapoor", "Female", 50, 20, "9543667810", "High fever", "O+", "123- Ishwar Buildings",
"11/02/2023", "10:30 AM", "11/02/2023", "10:00AM", "Mrs. Sunidhi Sharma"),
(2, "Mr.Shyam Kumar", "Male", 60, 30, "9124671230", "Cold", "A+", "A-102, Jawahar Estate", "20/09/2023",
"11:15 AM", "20/09/2023", "11:15 AM", "Mr. Ayush Iyer"),
(3, "Mr.Ashok Sharma", "Male", 74, 24, "9034512865", "Cough", "B+", 
"House no.15 ,Forest road, Valley building", "13/02/2023","12:00PM", "13/02/2023",
"12:00 PM", "Mrs. Yash Malik"),
(4, "Mr.Raj Nair", "Male", 55, 15, "9459317540", "Throat pain", "AB+", "D-Block, Rainforest apartments",
"01/02/2023", "4:00 PM", "01/02/2023", "4:05 PM", "Mrs. Shreya Singh"),
(5, "Mrs. Radha Kapoor", "Female", 56, 33, "9514703895", "Chest pain", "O-", "301, Rose plot", "05/02/2023",
"5:30 PM", "08/02/2023", "5:45 PM", "Mr. Shrey Rathore"),
(6, "Mrs. Devi Dixit", "Female", 50, 19, "9600712450", "Body pain", "B-", "A-810, Nehru resort","09/02/2023",
"01:30 PM", "12/02/2023", "2:00 PM", "Ms. Yashvi Shetty"),
(7, "Mr. Akash Maheswari", "Male", 75, 34, "9112700544", "Stomach pain", "A+", "C-block, Seawoods",
"30/02/2023", "6:30 PM", "30/02/2023", "6:15 PM", "Mr. Abhishek Thakur"),
(8, "Ms. Simran Shah", "Female", 45, 28, "9975880312", "High fever", "O+", "305, New complex", "22/02/2023",
"7:00 PM", "22/02/2023", "7:10 PM", "Mr. Adit Patel"),
(9, "Mrs.Maya Patel", "Female", 51, 28, "9655079855", "Breathing issue", "B-", "A1-602, Waterose residency",
"07/02/2023", "9:30 AM", "07/02/2023", "12;35 PM", "Mrs. Anu Thakkar"),
(10, "Mr. Virat Vyas", "Male", 74, 17, "9225689006", "Full body pain", "AB+", "B2- 607, Shresht flats",
"13/02/2023", "9:55 AM", "13/02/2023", "9;55 AM", "Ms. Neha Kataria");-- To identify the number of female patients
* To create a table Hospital management 2
use DBMS;

Create table Hospital_Management2(S_No int(10), Patient_Name varchar(30), Test_Recommended varchar(5),
Number_Of_Tests_Recommended int(10));

insert into Hospital_Management2(S_No, Patient_Name, Test_Recommended, 
Number_Of_Tests_Recommended)
values
(1, "Ms.Sejal Kapoor", "YES", 5),
(2, "Mr. Shyam Kumar", "NO", 0),
(3, "Mr. Ashok Sharma", "NO", 0),
(4, "Mr. Raj Nair", "YES", 3),
(5, "Mrs.Raj Nair", "NO", 0),
(6, "Mrs.Devi Dixit", "YES", 3),
(7, "Mr. Akash Maheshwari", "YES", 7),
(8, "Ms. Simran Shah", "NO", 0),
(9, "Mr. Maya Patel", "YES", 6),
(10, "Mr.Virat Vyas", "NO",0);

use dbms
select*from Hospital_Management;



select*
from Hospital_Management
where Patient_Gender= "Female";

-- To identify the number of patient falling in bar of 15-30
select*
from Hospital_Management
where Patient_Age between 15 and 30;

-- To arrange the patient data in ascending order of patient age
select Patient_Name,Patient_Age
from Hospital_Management
order by Patient_Age;

-- To identift the Average age of patient grouped on the basis of health issues
select Health_Issue, Avg(Patient_Age)
from Hospital_Management
group by Health_Issue;

-- To group together the patient with the doctors assigned to them
select concat(Patient_Name," ","AND"," ", Doctor_Assigned) as "Patient_Name AND Doctor_Assigned"
from Hospital_Management;

-- To remove the first 10 rows and give the output with maximum limit of 10 rows
select*
from Hospital_Management
limit 10 offset 10;


-- To count the number of rows in the taable
select count(*)
from Hospital_Management;

-- To calculate the patients whos weight is less than 55
select*
from Hospital_Management
where not (Patient_Weight<55);

-- To join the full data from Hospita[ management and only the common data 
-- from Hotel Management2
select* from Hospital_Management left outer join Hospital_Management2
on Hospital_Management.Patient_Name=Hospital_Management2.Patient_Name;

-- To join the full data from Hospital Management2 and only the common data
-- from Hospital Management 
select*from Hospital_Management right outer join Hospital_Management2
on Hospital_Management.Patient_Name=Hospital_Management2.Patient_Name;

-- To identify the youngest patient who visited hsopital
select*
from Hospital_Management
where Patient_Age= (select Min(Patient_Age) from Hospital_Management);

-- To identify the eldest patient who visited hospital
select*
from Hospital_Management
where Patient_Age= (select Max(Patient_Age) from Hospital_Management); 

-- To identify the number of female patients from the total  umber of patients
select
case
when Patient_Gender="Female" Then "Female"
end as "Female Patients"
from Hospital_Management;

-- To calculate the total number of female patients who visited hospital
select sum(Patient_Gender="Female") as "Total NO.OF female Patients"
from Hospital_Management;

-- To join the full data from Hospital management and only the common data 
-- from Hotel Management2 where patient gender is female
select* from Hospital_Management left outer join Hospital_Management2
on Hospital_Management.Patient_Name=Hospital_Management2.Patient_Name
where Patient_Gender= "Female";

-- To join the full data from Hospital management2 and only the common data 
-- from Hotel Management where patient gender is male
select* from Hospital_Management left outer join Hospital_Management2
on Hospital_Management.Patient_Name=Hospital_Management2.Patient_Name
where Patient_Gender= "Male";


-- To add a new row to the hospital management table
insert into Hospital_Management(S_No, Patient_Name, Patient_Gender, Patient_Weight,
Patient_Age, Phone_No, Health_Issue, Blood_Group, Patient_Address, Appointment_Time,
Appointment_Date, Visit_Date, Visit_Time, Doctor_Assigned)
values
(11, "Ms.Sunidhi Goyal","Female", 41, 22, "9446900345", "Cold", "AB+", 
"201, Sunrise flats", "29/02/2023", "3:42 PM", "29/02/2023", "3:50 PM", 
"Mr. Rahul Gupta");

-- To create a new column inside an existing table
alter table Hospital_Management2
add column (Immediate_Test_Required varchar(3));

-- To identify the patients whose blood group is either O+ or AB+
use dbms;
select*
from Hospital_Management
where (Blood_Group= "O+" OR Blood_Group= "AB+");

-- To identify the total of each column from the Hospital Management table
select
count(Patient_Name) as Total_No_Of_Patients, 
count(distinct Patient_Gender) as Total_No_Of_Patient_Genders,
count(distinct Patient_weight) as Total_No_Of_Patient_Weights,
count(distinct Patient_Age) as Total_No_Of_Patient_Age,
count(Phone_No) as Total_No_Of_Phone_No,
count(distinct Health_Issue) as Total_No_Of_Health_Issues,
count(distinct Blood_Group) as Total_No_Of_Blood_Group,
count(Patient_Address) as Total_No_Of_Patient_Address,
Count(distinct appointment_Date) as Total_No_Of_Appointment_Date,
count(distinct Appointment_Time) as Total_No_Of_Appointment_Time,
count(distinct Visit_Date) as Total_No_Of_Visit_Date,
count(distinct Visit_Time) as Total_No_Of_Visit_Time,
count(Doctor_Assigned) as Total_No_Of_Doctor_Assigned
from Hospital_Management;

-- To order the patients who require test based on number of tests mentioned
use dbms;
select Test_Recommended, Number_Of_Tests_Recommended
from hospital_management2
where Test_Recommended ="YES"
Order by Number_Of_Tests_Recommended asc;

-- To identify the Morning, Afternoon and Evening Appointment
select
case
when Appointment_Time< "11:55 AM" then "Morning Appointment"
when Appointment_Time< "4:00 PM" then "Afternoon Appointment"
else "Evening Appointment"
end as "Appointment_Period"
from hospital_management;



-- To identify the patients who arrived on same time as appointment time
select*
from hospital_management
where Visit_Time= Appointment_Time;

-- To identify those patients who didn't arrive on same date as appointment date
select*
from hospital_management
where not Visit_Date = Appointment_Date;

-- To identify patients who have negative blood groups
select*
from hospital_management
where Blood_Group like "%-";


































