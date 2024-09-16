terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.24.0"
    }
  }
}


provider "google" {
  credentials = file("/home/dell/terraform/acoustic-cargo-416714-c04b9fca2f30.json")
  project     = "acoustic-cargo-416714"
  region      = "us-central1-a"
}