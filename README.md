# Winery Customer & Revenue Analytics

An end-to-end MIS/data analytics portfolio project inspired by boutique winery operations and front-of-house wine education experience. The project demonstrates relational database design, SQL analysis, Excel validation, and a Power BI-ready star/relational model.

> **Data note:** All customer, transaction, visit, wine, and membership records in this repository are fictional and generated solely for portfolio/educational use. No employer or real customer data is included.

## Business Objective
A boutique California winery wants to better understand customer behavior, tasting-room performance, product sales, and wine-club membership. The analysis focuses on revenue trends, purchasing patterns, tasting experiences, and opportunities to improve customer value.

## Tools
- MySQL / SQL
- Excel
- Power BI
- ER modeling / relational database design

## Data Model
The database contains six related entities: Customer, Visit, Transaction, Transaction Item, Wine, and Membership. `transaction_item` acts as the associative table between transactions and wines.

See `er-diagram/winery_er_diagram.svg`.

## Portfolio Dataset
- 180 fictional customers
- 352 winery visits
- 312 transactions
- 680 transaction line items
- 42 wine-club membership records
- 10 wines

## Analysis Questions
1. Which wines generate the most product revenue?
2. What is the average transaction value?
3. How does revenue change by month?
4. Which tasting experiences are associated with the most revenue?
5. How do members and non-members compare on customer revenue?
6. Which customers have the highest lifetime value?
7. How do reservations and walk-ins compare?
8. What does the customer geographic mix look like?
9. What is the wine-club membership mix?

## Snapshot of Results
- Net transaction revenue: **$46,438.10**
- Average transaction value: **$148.84**
- Units sold: **1,063**
- Membership records / customer base: **23.3%**
- Top wine by gross product revenue: **Library Cabernet Sauvignon**
- Active-member average customer revenue among purchasers: **$330.57**
- Non-member average customer revenue among purchasers: **$276.73**

These results come from the fictional portfolio dataset and are intended to demonstrate analytical workflow rather than represent an actual winery's performance.

## Repository Structure
```text
data/              CSV source tables
sql/               MySQL schema and analysis queries
excel/             Analysis and validation workbook
er-diagram/        Relational model diagram
dashboard/         Power BI build guide and DAX measures
```

## How to Reproduce
1. Run `sql/database_schema.sql` in MySQL Workbench.
2. Import the CSVs in `data/` into their corresponding tables.
3. Run `sql/analysis_queries.sql`.
4. Open `excel/winery_analysis.xlsx` to review validation and analysis outputs.
5. Load the CSVs into Power BI and follow `dashboard/POWER_BI_BUILD_GUIDE.md`.

## Interview Talking Points
- Designed a normalized relational schema using primary/foreign keys and one-to-many relationships.
- Used `transaction_item` to resolve the many-to-many business relationship between transactions and wines.
- Used joins, grouping, aggregate functions, date grouping, and conditional logic to answer business questions.
- Connected technical analysis to customer behavior, tasting-room performance, and wine-club strategy.
