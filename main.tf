terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  credentials = file("/Users/bigsur/Downloads/eight-brothers-85e295582269.json")
  project = var.project_id
  region  = var.region
}

resource "google_storage_bucket" "example_bucket" {
  name     = "${var.environment}-example-bucket-${random_id.bucket_id.hex}"
  location = var.region
}

resource "random_id" "bucket_id" {
  byte_length = 4
}
