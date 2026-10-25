# Data-Driven Smartphone Selection: A Jumia Market Analysis
## Description
This project applies Excel, SQL, and Power BI to analyze smartphone listings from Jumia Nigeria, evaluate pricing and specifications, and identify the most suitable smartphone options based on budget, RAM, ROM, brand availability, and value for money. The analysis transforms raw product data into actionable insights to support informed, data-driven purchasing decisions.

<br>

## TABLE OF CONTENTS
- #### [Project Scope](#Project Scope)
  - [Evaluation of Problem](#Evaluation of Problem)
  - [Objective](#objective)
- #### [Data Identification](#Data Identification)
  - [Data Requirements & Sources](Data Requirements & Sources)
  - [Availability & Compliance Checks](#Availability & Compliance Checks)
- #### [Data Acquisition & Extraction](#Data Acquisition & Extraction)
  - [Collection & Extraction](#Collection & Extraction)
  - [Data Exploration](#Data Exploration)
  - [Data Cleaning](#Data Cleaning)
  - [Validation & Quality Checks](#Validation & Quality Checks)
- #### [Visualization](#Visualization)
  - [Results](#Results)
  - [DAX Measures](#DAX Measures)
- #### [Analysis](#Analysis)
  - [Exploratory Data Analysis](#Exploratory Data Analysis)
  - [Discovery](#Discovery)
- #### [Recommendations](#Recommendations)
  - [Potential Courses of Action](#Potential Courses of Action)
  - [Estimated Impact of Choice](#Estimated Impact of Choice)
- #### [Conclusion](#Conclusion)






## PROJECT SCOPE
### EVALUATION OF PROBLEM
A friend is asking for recommendations on a possible choice of phone. The key or core features that she’s looking for in the phone are RAM (Phone processor) and ROM (Phone Memory). She has a budget of N300k – N450k to make the purchase. Also, she wants a brand that is common that the spare parts can be easily sourced in the case of phone damage and repair.

### OBJECTIVE
The goal, aim or objective of this project is to get an idea on the details and prices of phones to enable her make a choice. So, she’s looking to make a choice based on the;
  -	Phone Brand
  -	Phone RAM
  -	Phone ROM; and 
  -	Phone price (N300k – N450k)

With these, this our analytical project will be answering the following key questions;
1.	How many phone brands do we have from the listing?
2.	Which are the top 5 brands with the most (common) listing?
3.	What are the RAM ranges of the phones under the price category (N300k – N450k)?
4.	What are the ROM ranges of the phones under the price category (N300k – N450k)?
5.	Which phones give the best value for money in terms of Brand, ROM and RAM? 

<br>

## DATA IDENTIFICATION
### DATA SOURCE
Since the purchase will be made from local stores in the country, we needed to a place where the prices of different phones are listed to give us an idea of what the prices might be. There are many sites that sell phone online, but for the safety, quality, accuracy and originality, we decided to use the most common or popular one, Jumia Online Stores. We will get the current phone listing from Jumia Official Website (www.jumia.com.ng).
### DATA AVAILABILITY AND COMPLIANCE CHECKS
We extracted 400+ rows of phone listing, which had;
  •	Phone names
  •	Brand names
  •	Phone RAM
  •	Phone ROM
  •	Colour
  •	Network strength
  •	Battery strength
  •	Seller store
  •	Phone initial price
  •	Discount
  •	Phone price after discount
  •	Rating reviews
  •	Normal rating
  •	Payment status
  •	Carts
  •	Promo status
  •	Store

What we need;
  -	Phone names
  -	Phone RAM
  -	Phone ROM
  -	Phone initial price
  -	Phone price after discount

<br>

## DATA ACQUISITION & PREPARATION
### DATA COLLECTION
We used Power Query to access the Jumia Official webpage to extract the data from the site.
POWER QUERY CODE
'''
POWER QUERY
let
    Pages = List.Numbers(6, 25),
    Tables = List.Transform(Pages, each fnJumiaPage(_)),
    Combined = Table.Combine(Tables)
in
    Combined
'''

### DATA EPLORATION
Data exploration notes;
1.	Contains 412 rows
2.	Has 10 columns 
3.	Contains a lot of missing values in all columns except columns 1 & 2.
4.	We will only be needing phone name, phone storage and processor (if available), phone price and company name. so other columns will be removed.
5.	There was an OUKITEL Phone that has a 24GB RAM 256 ROM, yet, it was cheap. We investigated it and found out that it was a discount offer from one of the sellers.

### DATA CLEANING NOTES
1.	After exploring the already collected data with Excel, we pulled it into MySQL workbench for cleaning.
2.	While the data was pulled in, we encountered several errors that prevented the data from being imported properly. We;
    -	Re-saved the file as ‘CSV UTF 8’ file.
    -	Changed the datatype of the columns to ‘VARCHAR’.
This allowed for smooth loading of the table.
3.	We added the following columns;
    -	brand_name (represents the phone brand)
    -	phone_name (each phones name only) – trimmed to maximum of 30 characters.
    -	phone_ROM (each phone’s ROM if available)
    -	phone_RAM (each phone’s RAM if available)
    -	row_id (to make each row unique)
4.	We have about 412 rows of phone listings from different stores (sellers). But during deduplication, we keep getting some listed as duplicates despite rating_reviews showing different ratings (pertaining to the seller). So, we decided to identify each row with a store name. Since the objective is to get the best phone as regards the Phone name, brand, price, RAM and ROM, we carried on despite the fact that different phones can be listed by the same seller or store.

5.	We removed any row which any of these columns were not containing any value;
    -	brand_name
    -	phone_RAM
    -	phone_ROM

6.	The extracted columns and rows in the data were placed in an SQL view, known as view_cleaned_jumia_phones.

### VALIDITY AND QAULITY CHECKS
We need the following columns for our analysis;
1.	row_id
2.	brand_name
3.	phone_name
4.	phone_price
5.	phone_ROM
6.	phone_RAM
And they’re all available.

#### We’ll be performing the following validity and compliance checks;

<ins>ROW COUNT</ins>
![ROW COUNT](assets/images/Cleaned data Row Count.png)
<br>

<ins>COLUMN COUNT</ins>
![COLUMN COUNT](assets/images/Cleaned data Column Count.png)
<br>

<ins>DATA TYPES CHECK</ins>
![DATA TYPES CHECK](assets/images/Cleaned data Datatype Check.png)
<br>

<ins>DUPLICATE CHECK</ins>
![DUPLICATE CHECK]()
<br>

<br>

## VISUALIZATION
### RESULTS
![RESULTS](assets/images/Jumia Smartphone Market Insights Dashboard.png)
<br>

### DAX Meausres
<ins>Average Phone Price</ins>
![Average Phone Price]()
<br>

<ins>Total No of Phones</ins>
![Total No of Phones]()
<br>

<br>

## ANALYSIS
### EXPLORATORY DATA ANALYSIS
<iins>Findings</ins>
What did we find?

For this analysis, we need to focus on the following questions;
1.	How many phone brands do we have from the listing?
2.	Which are the top 5 brands with the most (common) listing?
3.	What are the RAM ranges of the phones under the price category (N300k – N450k)?
4.	What are the ROM ranges of the phones under the price category (N300k – N450k)?
5.	Which phones give the best value for money in terms of Brand, ROM and RAM?

From our Dataset, we have;
1.	Phones brands listed
We have about 35 different Phone brands in the phone listing


<br>

## RECOMMENDATIONS

<br>

## CONCLUSION

<br>


