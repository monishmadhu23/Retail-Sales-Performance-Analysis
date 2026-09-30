# Retail Sales Performance: End-to-End Analysis & Dashboard

An end-to-end data analytics pipeline transforming **249 messy retail transaction records** across 4 regions into an analytics database and an interactive stakeholder-facing dashboard.

## 🛠️ Tech Stack & Roles
* **Excel:** Initial data data profiling and exploration.
* **Python (Pandas, Seaborn):** Programmatic data cleaning, outlier imputation, and cross-validation.
* **SQL (MySQL):** Relational database hosting and high-value transactional aggregation.
* **Power BI:** Data modeling (Star Schema) and interactive report deployment.

---

## 📊 Dataset & Data Quality Framework
The raw dataset contained key issues like missing prices, blank categories, inconsistent casing (e.g., `south ` vs `South`), and year errors. 

### Methodology (Before vs. After):
* **Missing Prices/Quantities:** Imputed using the median to resist extreme revenue skewing.
* **Blank/Unknown Categories:** Imputed programmatically using the product-level mode (e.g., linking missing categories back to specific products like Laptops).
* **Casing & Text Issues:** Standardized strings (trimmed whitespace, normalized lowercase anomalies).
* **Auditability:** Every single change was mapped to new audit columns (`Data_Quality_Flag`, `Quantity_Flag`, `Price_Flag`) ensuring the data history is transparent and retrievable.

---

## 💻 SQL Analysis Pipeline
The transformed dataset was hosted in a MySQL database (`sales_project`). Advanced logic queries were executed to extract critical business layers:
* Regional transactional aggregates using `GROUP BY`.
* Segmenting performance targets using `HAVING` filters (e.g., regions exceeding ₹1,000,000 in total sales).
* Slicing extreme orders higher than the dataset average via nested non-correlated subqueries.

---

## 💡 Key Business Insights
* **The Revenue Engine:** The **South region** dominates retail health, driving **₹35.58L (40.5% of total revenue)**, significantly pacing the East region.
* **Seasonal Surge:** **June** represents the absolute seasonal apex, drawing **₹17.2L**—nearly doubling the next highest-performing month.
* **Category Focus:** **Electronics** holds a major product concentration, accounting for **62.2% of overall sales (₹54.63L)**, primarily propelled by Laptops (₹21.4L) and Monitors (₹19.6L).

---

## 🚀 Future Enhancements (Roadmap)
1. Convert static data files into automated, live pipeline connections.
2. Integrate a Python-based machine learning forecasting model to project future demand spikes.
3. Incorporate deeper unit metrics like Gross Profit Margins and Customer Lifetime Value (CLV).
