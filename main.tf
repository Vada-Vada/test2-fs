terraform {
  required_providers {
    google = {
        source = "hashicorp/google"
        version = "~> 5.0"
    }
  }
}

provider "google" {
  project = "my-first-project-451009"
  region = "us-west1"
}

resource "google_storage_bucket" "mybucket" {
  name = "my-terraform-bucket-1234"
  location = "us-west1"

  versioning {
    enabled = true
  }

  labels = {
    environment = "student-lab"
    managed_by = "terraform"
  }
}

output "bucket_name" {
  value = google_storage_bucket.mybucket.name
}