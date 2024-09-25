# Data Engineering Course Project: Crypto Dashboard

## Objective

The goal of this project is to apply all the concepts learned in the [Data Engineering Zoomcamp]() to build an end-to-end data pipeline.

---

## Problem statement

Develop a dashboard with two tiles by:

- [x] Selecting a dataset of interest (see [Datasets](https://github.com/DataTalksClub/data-engineering-zoomcamp/blob/main/projects/datasets.md))
- [ ] Creating a pipeline for processing this dataset and putting it to a data lake
- [ ] Creating a pipeline for moving the data from the lake to a data warehouse
- [ ] Transforming the data in the data warehouse: prepare it for the dashboard
- [ ] Building a dashboard to visualize the data

---

## Data Pipeline

The pipeline could be __stream__ or __batch__: this is the first thing you'll need to decide

- [x] __Stream:__ If you want to consume data in real-time and put them to data lake
- [ ] __Batch:__ If you want to run things periodically (e.g. hourly/daily)

---

## Technologies 

You don't have to limit yourself to technologies covered in the course. You can use alternatives as well:

- [x] __Cloud Platform:__ `GCP`
    - `AWS`, `GCP`, `Azure`, ...
- [x] __Infrastructure-as-Code (IaC):__ `Terraform`
    - `Terraform`, `Pulumi`, `Cloud Formation`, ...
- [x] __Workflow Orchestration:__ `Prefect`
    - `Airflow`, `Prefect`, `Luigi`, ...
- [x] __Data Lake:__ `GCS`
    - `S3`, `GCS`, `Azure Blob Storage`, ...
- [x] __Data Warehouse:__ `Snowflake`
    - `BigQuery`, `Snowflake`, `Redshift`, ...
- __Transformation:__
    - [x] __Stream Processing:__ `Kafka`
        - `Kafka`, `Pulsar`, `Kinesis`, ...
    - [ ] __Batch Processing:__
        - `Spark`, `Flink`, `AWS Batch`, ...

---

## Evaluation Criteria

- __Problem description__
    - [ ] 0 points: Problem is not described
    - [ ] 2 points: Problem is described but shortly or not clearly 
    - [ ] 4 points: Problem is well described and it's clear what the problem the project solves
- __Cloud Platform__
    - [ ] 0 points: Cloud is not used, things run only locally
    - [ ] 2 points: The project is developed in the cloud
    - [ ] 4 points: The project is developed in the cloud and IaC tools are used
- __Data Ingestion__ (choose either batch or stream)
    - [ ] __Stream__
        - [ ] 0 points: No streaming system (like Kafka, Pulsar, etc)
        - [ ] 2 points: A simple pipeline with one consumer and one producer
        - [ ] 4 points: Using consumer/producers and streaming technologies (like Kafka streaming, Spark streaming, Flink, etc)
    - [ ] __Batch__ / __Workflow Orchestration__
        - [ ] 0 points: No workflow orchestration
        - [ ] 2 points: Partial workflow orchestration: some steps are orchestrated, some run manually
        - [ ] 4 points: End-to-end pipeline: multiple steps in the DAG, uploading data to data lake
- __Data Warehouse__
    - [ ] 0 points: No DWH is used
    - [ ] 2 points: Tables are created in DWH, but not optimized
    - [ ] 4 points: Tables are partitioned and clustered in a way that makes sense for the upstream queries (with explanation)
- __Transformations__ (dbt, spark, etc)
    - [ ] 0 points: No tranformations
    - [ ] 2 points: Simple SQL transformation (no dbt or similar tools)
    - [ ] 4 points: Tranformations are defined with dbt, Spark or similar technologies
- __Dashboard__
    - [ ] 0 points: No dashboard
    - [ ] 2 points: A dashboard with 1 tile
    - [ ] 4 points: A dashboard with 2 tiles
- __Reproducibility__
    - [ ] 0 points: No instructions how to run the code at all
    - [ ] 2 points: Some instructions are there, but they are not complete
    - [ ] 4 points: Instructions are clear, it's easy to run the code, and the code works

---

## Dashboard

You can use any of the tools shown in the course (Data Studio or Metabase) or any other BI tool of your choice to build a dashboard. If you do use another tool, please specify and make sure that the dashboard is somehow accessible to your peers.

Your dashboard should contain at least two tiles, we suggest you include:

- 1 graph that shows the distribution of some categorical data
- 1 graph that shows the distribution of the data across a temporal line

Ensure that your graph is easy to understand by adding references and titles.

Example dashboard: ![image](https://user-images.githubusercontent.com/4315804/159771458-b924d0c1-91d5-4a8a-8c34-f36c25c31a3c.png)

---
---
---