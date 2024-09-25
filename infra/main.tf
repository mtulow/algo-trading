terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.6.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.6.3"
    }
  }
}

provider "google" {
  credentials = file(var.credentials)
  project     = var.project
  region      = var.region
}

provider "random" {
  # Configuration options
}

resource "random_id" "suffix" {
  keepers = {
    # Generate a new id each time we switch to a new AMI id
    gcs_bucket_name = var.gcs_bucket_name
  }

  byte_length = 4
}

# Data Lake: GCS
resource "google_storage_bucket" "dl" {
  name          = "${var.gcs_bucket_name}-${random_id.suffix.hex}"
  location      = var.location
  force_destroy = true


  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

# Data Warehouse: BigQuery
resource "google_bigquery_dataset" "dw" {
  dataset_id = var.bq_dataset_name
  location   = var.location
}