# Power BI Dashboard Build Guide

Use the six CSV files in `/data` as sources.

## Model relationships
- Customers[customer_id] 1 -> * Visits[customer_id]
- Visits[visit_id] 1 -> * Transactions[visit_id]
- Transactions[transaction_id] 1 -> * Transaction_Items[transaction_id]
- Wines[wine_id] 1 -> * Transaction_Items[wine_id]
- Customers[customer_id] 1 -> 0..1 Memberships[customer_id]

## Core measures
```DAX
Total Revenue = SUM(Transactions[total_amount])
Transactions = COUNTROWS(Transactions)
Average Transaction Value = DIVIDE([Total Revenue], [Transactions])
Units Sold = SUM(Transaction_Items[quantity])
Customers = DISTINCTCOUNT(Customers[customer_id])
Members = DISTINCTCOUNT(Memberships[customer_id])
Membership Conversion = DIVIDE([Members], [Customers])
```

## One-page dashboard
Top row KPI cards:
- Total Revenue
- Average Transaction Value
- Transactions
- Units Sold
- Membership Conversion

Recommended visuals:
1. Line chart: Revenue by transaction month
2. Bar chart: Gross product revenue by wine
3. Column chart: Revenue by tasting type
4. Donut chart: Revenue by wine type
5. Bar chart: Member vs non-member revenue per customer
6. Slicers: tasting type, wine type, membership tier

## Portfolio note
This dataset is fictional and was created for educational portfolio use. The project is inspired by boutique winery operations and does not contain employer/customer data.
