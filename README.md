### SalesRefine - Sales data cleaning using SQL

This project focuses on cleaning and preparing raw retail transaction data using MySQL. The goal was to transform unstructured and partially inconsistent transactional data into a clean, structured, and analysis-ready dataset.
The dataset contains retail sales transactions including invoice information, product details, quantities, pricing, timestamps, customer IDs, and country information.


### Objectives

- Standardize inconsistent date formats
- Validate data integrity
- Detect anomalies and duplicates
- Engineer revenue metrics
- Prepare structured dataset for analytics

### Cleaning Process

##### 1. Date Standardization

InvoiceDate was stored as TEXT in the format:

```sql 
DD-MM-YYYY HH:MM
```

A proper DATE column was created and populated:

```sql
ALTER TABLE retails
ADD COLUMN sales_date DATE;
```

``` sql
UPDATE retails
SET sales_date = STR_TO_DATE(InvoiceDate, '%d-%m-%Y %H:%i');
```

##### 2. Revenue Calculation

A calculated revenue column was added:

```sql
ALTER TABLE retails
ADD COLUMN revenue DECIMAL(10,2);
```

```sql UPDATE retails
SET revenue = Quantity * UnitPrice;
```

##### 3. Data Validation

The following integrity checks were performed:

- Checked for NULL values
- Verified no negative quantities
- Confirmed no cancelled invoices
- Performed duplicate detection

Example duplicate check:

```sql
SELECT InvoiceNo, StockCode, COUNT(*)
FROM retails
GROUP BY InvoiceNo, StockCode
HAVING COUNT(*) > 1;
```

Outcome

The dataset is now:

- Date-standardized
- Revenue-enhanced
- Integrity-validated
- Structured for analytical querying

Tools Used

- MySQL
- SQL (DDL & DML)
- Aggregation and validation queries


By transforming raw retail transaction data into a validated and structured dataset, this project establishes a strong foundation for reliable business analysis and reporting.

--------------

### License

This project is licensed under the MIT License.
