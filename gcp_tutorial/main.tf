provider "google" {
  version = "3.5.0"

  credentials = file("/Users/mahendra/learning_terraform/secrets/stp-jira-ef84d3581045.json")

  project = "stp-jira"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}
