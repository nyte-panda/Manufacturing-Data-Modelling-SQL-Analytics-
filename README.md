# Manufacturing-Data-Modelling-SQL-Analytics-

## Project Overview 

This project focuses on designing a clean, normalized relational data model for a manufacturing operations domain. The goal is to demonstrate strong SQL fundamentals, correct schema design, and analytical querying on structured operational data. 

The system models core manufacturing entities such as parts, machines, work orders, and production runs, and supports analystical queries to answer common operational questions. 

---

## Architecture Overview
**Data Flow (MVP):**

RAW CSV Files → PostgresSQL → SQL Analytics Queries

This project focuses exclusively on data modeling and querying. ETL orchestration and automation are intentionally out of scope. 

---

## Data Model 
The schema models the following core entities:
- Parts
- Machines
- Work Orders
- Production Runs
- Operators

Each table is normalized and linked using primary and foreign keys to ensure data integrity and support analytical queries. 

*(ER diagram to be added)*

---

## Analytical Use Cases
The database is designed to support queries such as: 
- Production output per machine
- Average runtime per work order
- Downtime by operator
- Bottlenecks by part type

---

## Example Queries 
*(To be added once schema and sample data are in place)*

---

## Design Decisions 
- A normalzed relational schema was chosen to ensure data consistency and avoid duplication.
- PostgreSQL was selected for its strong SQL support and relational guarantees.
- This project intentionally focuses on schema design and querying rather than automation.


---

## How to Run Locally 
*(Instructions to be added once schema and sample data and finalized)*

---

## Future Improvements 
- Add sample data generation scripts.
- Introduce indexing strategies for performance optimization.
- Expand analytical queries.
