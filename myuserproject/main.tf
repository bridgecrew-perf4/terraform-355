terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.50.0"
    }
  }
}


provider "google" {
  project = "pivotal-diorama-291019"
  region  = "us-central1"
  zone    = "us-central1-c"
  credentials= "credentials.json"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "centos-7-v20201112"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}
