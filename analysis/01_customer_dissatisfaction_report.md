# Customer Dissatisfaction Analysis

## Business Question
Why are customers giving low ratings?

## Dataset
- Source: Olist E-commerce dataset
- Fact table: fact_orders_master
- Grain: Item-level table aggregated to order-level for analysis
- Total orders analyzed: 96,478

---

## Key Findings

### 1. Delivery delay is the strongest driver of dissatisfaction
- Delayed orders receive low ratings in **52.9%** of cases
- On-time orders receive low ratings in only **9.2%** of cases

This indicates that delayed delivery increases the likelihood of a low rating by nearly **6x**.

---

### 2. Delay alone does not explain all dissatisfaction
Several categories show high low-rating percentages even when delay rates are moderate (7–9%).

Examples:
- Home & furniture categories (furniture, home decor)
- IT accessories
- Office furniture

This suggests additional drivers such as:
- Product quality issues
- Expectation mismatch
- Fragile or bulky items

---

### 3. High-revenue categories also show high dissatisfaction
Some of the highest-revenue categories also suffer from elevated low-rating rates:
- Beauty & health
- Home & bath
- IT accessories
- Home decor

These categories represent high business risk, as dissatisfaction affects both revenue and brand trust.

---

## Conclusion
Customer dissatisfaction is primarily driven by delivery delays, but delays alone do not explain the full picture.
Product-category-specific issues play a significant role, especially in high-volume and high-revenue categories.

Improving delivery performance and addressing category-specific quality and expectation gaps would have the greatest impact on customer satisfaction.

---

## Next Steps
- Regional analysis of delayed orders
- Seller-level performance review
- Product quality signal extraction from reviews (future work)