
# Data Lake
output "gcp_data_lake_bucket" {
  value = google_storage_bucket.dl.id
}

# Data Warehouse
output "gcp_data_warehouse_dataset" {
  value = google_bigquery_dataset.dw.dataset_id
}