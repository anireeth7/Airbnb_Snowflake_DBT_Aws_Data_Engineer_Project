Airbnb Modern Data Stack: End-to-End Data Engineering Project

Project Overview

This project demonstrates a production-grade ELT (Extract, Load, Transform) pipeline leveraging the Modern Data Stack (MDS). The primary objective is to transform raw Airbnb listing and review data into actionable insights for business intelligence. By utilizing a combination of cloud infrastructure and modern transformation tools, the project ensures data quality, documentation, and scalability.

Technical Stack

Cloud Provider: Amazon Web Services (AWS)

Data Warehouse: Snowflake

Transformation Tool: dbt (Data Build Tool)

Orchestration & Storage: AWS S3

Business Intelligence: Preset / Superset (or your preferred BI tool)

Language:  SQL, Jinja

Architecture Design

The pipeline follows a modular architecture to ensure clean data separation and reliable processing:

Extraction & Loading: Raw data is staged in AWS S3 and loaded into Snowflake using Stage and Copy commands.

Transformation (dbt): * Bronze Layer (Staging): Initial cleaning, renaming, and type casting.

Silver Layer (Intermediate): Joining sources and applying business logic (e.g., handling nulls in price, date formatting).

Gold Layer (Mart): Final dimension and fact tables optimized for reporting.

Data Quality: Implementation of dbt tests (Unique, Not Null, Accepted Values) and custom singular tests to ensure data integrity.

Documentation: Automated documentation generated via dbt docs.

Key Features

Slowly Changing Dimensions (SCD): Implementation of snapshots to track historical changes in listing prices and availability.

Data Governance: Role-based access control (RBAC) within Snowflake to manage developer and analyst permissions.

Automated Testing: Schema and data tests integrated into the transformation workflow to catch anomalies before they reach the BI layer.

Modular SQL: High use of Common Table Expressions (CTEs) for readability and maintainability.

Project Structure

Bash
├── dbt_project/
│   ├── models/
│   │   ├── dim/          # Dimension tables (Hosts, Listings)
│   │   ├── fct/          # Fact tables (Reviews)
│   │   └── src/          # Staging models (Source definitions)
│   ├── snapshots/        # SCD Type 2 tracking
│   ├── tests/            # Custom data quality tests
│   └── dbt_project.yml   # Project configuration
├── data/                 # Sample raw datasets
└── README.md
How to Run This Project
Prerequisites: * A Snowflake account and an AWS S3 bucket.

dbt Core or dbt Cloud installed.

Setup:

Configure your profiles.yml to connect to your Snowflake instance.

Upload the raw CSV data from the /data folder to your S3 bucket.

Execution:

Bash
dbt deps    # Install dependencies
dbt seed    # Load CSVs (if using dbt seed)
dbt run     # Execute transformations
dbt test    # Run data quality tests
Insights and Analytics
The final gold layer enables analysis on:

Correlation between host response rates and listing ratings.

Price fluctuations over time using SCD Type 2 snapshots.

Sentiment trends based on review frequency and guest feedback.
