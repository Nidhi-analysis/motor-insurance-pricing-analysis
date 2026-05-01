
# Motor Insurance Pricing & Profitability Analysis

**End-to-end actuarial pricing project using the freMTPL2 dataset (678,000+ Third-Party Liability policies).**

##  Project Goal

Build a fully data-driven pricing framework that:
- Models claim frequency and severity using GLMs
- Computes risk‑based pure premiums
- Exposes mispriced segments
- Delivers an interactive dashboard for underwriters

##  Dataset

- **Source:** [freMTPL2](https://www.openml.org/search?type=data&status=active&id=41214) (OpenML)
- **Rows:** ~678,000 motor third-party liability policies
- **Targets:** `ClaimNb` (claim count) and `ClaimAmount` (severity)
- **Exposure:** `Exposure` (policy year fraction)

##  Tech Stack

- **Python**: pandas, scikit-learn, statsmodels, matplotlib, seaborn
- **SQL**: SQLite (local database)
- **Dashboard**: Tableau Public / Power BI
- **Version Control**: Git & GitHub

##  Repository Structure

- `data/` – raw and processed datasets (CSV, SQLite DB)
- `notebooks/` – Jupyter notebooks for EDA, modeling, evaluation
- `sql/` – SQL queries for KPI computation
- `dashboard/` – dashboard file and exported screenshots
- `reports/` – final written report (executive summary, figures)

##  How to Run

1. Clone this repo
2. Download `freMTPL2.csv` and place it in `data/`
3. Run `notebooks/01_data_engineering.ipynb` to create the SQLite database
4. Follow notebooks in order (`02_eda`, `03_frequency_model`, etc.)

##  Dashboard

[Link to Tableau Public / Power BI dashboard – to be added]

##  Contact

[Your Name] – [Your LinkedIn or email]