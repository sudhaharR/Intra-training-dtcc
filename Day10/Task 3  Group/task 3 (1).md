# Data
|   |   |   |   |   |   |   |
|---|---|---|---|---|---|---|
|month|branch_id|city|product_type|active_customers|total_balance_usd|monthly_transactions|
|2025-01|BR001|New York|Savings Account|420|2604000|420|
|2025-01|BR002|Boston|Checking Account|510|1428000|680|
|2025-01|BR003|Chicago|Credit Card|350|630000|920|
|2025-01|BR004|Dallas|Home Loan|125|23125000|310|
|2025-01|BR005|Seattle|Business Loan|95|9025000|240|
|2025-02|BR001|New York|Checking Account|435|1218000|460|
|2025-02|BR002|Boston|Savings Account|390|2418000|405|
|2025-02|BR003|Chicago|Credit Card|370|666000|980|
|2025-02|BR004|Dallas|Home Loan|130|24050000|325|
|2025-02|BR005|Seattle|Business Loan|102|9690000|255|
|2025-03|BR001|New York|Credit Card|365|657000|950|
|2025-03|BR002|Boston|Home Loan|118|21830000|295|
|2025-03|BR003|Chicago|Savings Account|445|2759000|430|
|2025-03|BR004|Dallas|Business Loan|110|10450000|280|
|2025-03|BR005|Seattle|Checking Account|520|1456000|700|

# Objective
To analyse the above dataset using various tools such as numpy, pandas etc..

# Steps

- Step 1: Downloading dataset
- Step 2: Install python
- Step 3: create virtual environment
- Step 4: Install and import the required libraries(numpy, pandas)
- Step 5: Load the dataset using pandas
- Step 6: Use the library functions to explore and analyse the above dataset to get the following outcomes
	- What is the average number of monthly transactions? 
	  `df["monthly_transactions"].mean()`
	- What is the total balance across all records?
	  `df["total_balance_usd"].sum()`
	- What are the unique cities in the dataset?
	  `df["city"].unique()`
	- What are the cities with the highest total active customers?
	  `df.groupby("city")["active_customers"].sum().sort_values(ascending=False)`
	- What is the average number of active customers for each product type?
	  `df.groupby("product_type")["active_customers"].mean()`

