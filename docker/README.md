# Stream Processing in SQL with RisingWave

## Setting up RisingWave with Docker Compose

Reference: <https://docs.risingwave.com/docs/current/risingwave-docker-compose/>

For this workshop, I have slightly modified the `docker-compose.yml` file to include clickhouse as well.

The `docker-compose.yml` file is located in the `docker` directory.

It contains the following key components:

| Service | Exposed Port |
|:--------|:----:|
| RisingWave (Stream Processing) | ... |
| Clickhouse (Downstream Delivery) | ... |
| Redpanda (Upstream Ingestion) | ... |
| Grafana (Visualization) | 3001 |
| Prometheus (Metrics) | 9500 |
| MinIO (Storage) | 9400 |
| Etcd (Metadata Storage) | ... |
| PostgreSQL (Database) | 5432 |


---
---

## Ingesting Data into RisingWave using Kafka

Reference:

- <https://docs.risingwave.com/docs/current/ingest-from-kafka/>
- <https://docs.risingwave.com/docs/current/data-ingestion/>

The `seed_kafka.py` file contains the logic to process the data and populate RisingWave.

Here we:

1. Process the `taxi_zone` data and insert it into RisingWave. This is just ingested with DML over `psycopg`, since it's a small dataset.
1. Process the `trip_data` and insert it into RisingWave. This is ingested via Kafka.

In order to simulate real-time data, we will replace the `timestamp` fields in the `trip_data` with `timestamp`s close to the current time.

Let's start ingestion into RisingWave by running it:

```bash
stream-kafka
```

Now we can let that run in the background.

Let's open another terminal to create the trip_data table:

```bash
source commands.sh
psql -f risingwave-sql/table/trip_data.sql
```

You may look at their definitions by running:

```bash
psql -c 'SHOW TABLES;'
```

---
---

## How to sink data from RisingWave to Clickhouse

Reference:

- <https://docs.risingwave.com/docs/current/data-delivery/>
- <https://docs.risingwave.com/docs/current/sink-to-clickhouse/>

We have done some simple analytics and processing of the data in RisingWave.

Now we want to sink the data out to Clickhouse, for further analysis.

We will create a Clickhouse table to store the data from the materialized views.

```sql
CREATE TABLE avg_fare_amt(
    avg_fare_amount_per_min numeric,
    num_rides_per_min Int64,
) ENGINE = ReplacingMergeTree
PRIMARY KEY (avg_fare_amount_per_min, num_rides_per_min);
```

We will create a Clickhouse sink to sink the data from the materialized views to the Clickhouse table.

```sql
CREATE SINK IF NOT EXISTS avg_fare_amt_sink AS SELECT avg_fare_amount_per_min, num_rides_per_min FROM avg_fare_amt
WITH (
    connector = 'clickhouse',
    type = 'append-only',
    clickhouse.url = 'http://clickhouse:8123',
    clickhouse.user = '',
    clickhouse.password = '',
    clickhouse.database = 'default',
    clickhouse.table='avg_fare_amt',
    force_append_only = 'true'
);
```

Now we can run queries on the data ingested into clickhouse:

```bash
clickhouse-client-term
```

Run some queries in `Clickhouse`

```sql
-- TODO: Write some queries here
```

---
---

## Summary

In this workshop you have learnt:

- How to ingest data into RisingWave using Kafka
- How to process the data using Materialized Views
  - Using Aggregations
  - Using Temporal Filters
  - Using Window Functions (Tumble)
  - Using Joins
  - Layering MVs to build a stream pipeline
- How to sink the data out from RisingWave to Clickhouse

---

## What's next?

<https://tutorials.risingwave.com/docs/category/basics>

---
---
---
