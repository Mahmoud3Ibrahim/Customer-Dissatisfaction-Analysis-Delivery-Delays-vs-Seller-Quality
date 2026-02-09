# Olist E-commerce Delivery & Quality Analysis  
**Junior Data Analyst Portfolio Project**

---

## Project Objective
This project analyzes customer dissatisfaction in an e-commerce platform using the Olist dataset.

The objective is to identify the main drivers behind low customer review scores and determine whether dissatisfaction is primarily caused by:
- Delivery delays
- Seller quality issues
- Or a combination of both

The project follows a layered analytical approach:
- **Python** for data preparation and exploration
- **SQL** for structured KPI analysis and seller-level diagnostics
- **Power BI** for executive-level storytelling and decision support

---

## 1. Python Analysis – Data Preparation & Exploration

### What was done
Python was used as the foundation layer to prepare reliable, analysis-ready data:

- Cleaned and validated order lifecycle timestamps
- Engineered delivery-related features:
  - `delivery_time_days`
  - `is_delayed`
- Validated review data integrity
- Analyzed rating distributions and complaint patterns
- Exported clean analytical datasets for SQL and Power BI

### Key insights from Python
- Delayed orders are significantly more likely to receive low review scores
- 1-star reviews are highly concentrated among delayed deliveries
- Delivery delays alone do not fully explain customer dissatisfaction

Python helped establish the initial hypothesis:
> Delivery delay is a major driver of dissatisfaction, but not the only one.

---

## 2. SQL Analysis – KPI Modeling & Seller Diagnostics

SQL was used to move from exploration to explainable and auditable metrics.

### What was built
Modular SQL scripts and views were created to compute seller-level KPIs, including:

- Delivered orders count
- Delay rate (%)
- Average delay duration (days)
- Average review score
- Low-rating percentage (1–2 stars)
- High-risk seller classification

Key outputs include:
- Seller delay KPIs
- Seller quality KPIs
- High-risk seller watchlist
- Combined delay and quality risk indicators

### Key insights from SQL
- Some sellers show both high delay rates and poor review scores  
  → Operational delivery issues
- Another group of sellers shows acceptable delivery performance but poor review scores  
  → Quality-driven dissatisfaction
- Customer dissatisfaction can exist even when delivery performance is acceptable

SQL confirmed a dual failure model:
> Customer dissatisfaction is driven by both logistics performance and seller quality issues.

---

## 3. Power BI Dashboard – Executive Storytelling

Power BI was used to explain outcomes, not to rediscover them.

### Dashboard purpose
The dashboard consolidates Python and SQL outputs into a single executive-facing view that answers:

- How strongly do delivery delays impact customer satisfaction?
- Is poor seller quality an independent problem?
- Which sellers represent the highest operational risk?

### Key visuals
- KPI cards summarizing delivery performance and dissatisfaction
- Delay vs low-rating comparison
- Rating distribution for delayed orders
- Scatter plot showing:
  - Delay rate vs average review score
  - Bubble size representing business impact (order volume)
  - Top 20 high-impact sellers only

### What Power BI adds
- Visual separation between delay-driven and quality-driven dissatisfaction
- Clear identification of sellers requiring different interventions
- A narrative suitable for decision-makers rather than analysts

---

## Final Conclusions

This analysis demonstrates that:

1. Delivery delays significantly increase the likelihood of low customer ratings  
2. Delivery performance alone does not explain all customer dissatisfaction  
3. A distinct group of sellers exhibits poor customer satisfaction despite acceptable delivery performance  
4. Customer dissatisfaction is driven by two separate failure modes:
   - Operational delivery delays
   - Seller quality issues

### Business implication
Improving logistics alone will not fully resolve customer dissatisfaction without targeted seller quality controls.

---

## Tools & Skills Demonstrated
- Python (Pandas, feature engineering, data validation)
- SQL (KPI modeling, aggregation, risk classification)
- Power BI (dashboard design, analytical storytelling)
- Business-focused analytical reasoning