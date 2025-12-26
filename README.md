# Manufacturing Data Modeling & SQL Analytics

## Overview

This project demonstrates the design and analysis of a normalized relational
database for a manufacturing operations domain. The goal is to showcase strong
SQL fundamentals, correct schema design, and analytical querying using
structured operational data.

The project focuses on data modeling and SQL analytics rather than automation
or orchestration.

---

## Architecture Overview

**Data Flow:**

Synthetic CSV Data → PostgreSQL → Analytical SQL Queries

This reflects a common analytics setup where structured data is loaded into a
relational database and queried directly to support operational insights.

---

## Data Model

The schema models the following core manufacturing entities:

- Parts
- Machines
- Operators
- Work Orders
- Production Runs

Each table is normalized and connected through primary and foreign keys to
ensure data integrity and support flexible analytical queries.

**Schema definition:**  
`sql/schema.sql`

---

## Sample Data

The project includes synthetic but relationally consistent sample data used to
validate the schema and support analytical workloads.

Data characteristics:
- Small, stable dimension tables (machine types, locations, shifts)
- Medium-sized entity tables (machines, operators, parts)
- Larger fact table for production activity
- Realistic timestamps and run durations

**Sample data location:**  
`data/sample/`

---

## Analytical Use Cases

The database supports analytical queries such as:

- Production volume and utilization by machine
- Average runtime by machine type and shift
- Operator productivity and workload distribution
- Identification of long-running production jobs (bottlenecks)
- Production trends over time
- Part-level production activity analysis

---

## Analytical SQL Queries

A collection of analytical SQL queries is provided to demonstrate:

- Multi-table joins
- Aggregation and grouping
- Time-based calculations
- Operational performance analysis

**Queries file:**  
`sql/queries.sql`

---

## Design Decisions

- A normalized relational schema was chosen to ensure consistency and avoid
  data duplication.
- PostgreSQL was selected for its robust SQL support and relational guarantees.
- Sample data is stored as CSV files to ensure reproducibility and transparency.
- The project intentionally focuses on schema design and SQL analytics rather
  than automation.

  