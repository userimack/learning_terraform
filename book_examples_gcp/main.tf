provider "google" {
  credentials = file("../secrets/stp-jira-ef84d3581045.json")
  project     = "stp-jira"
  region      = "us-central1"
  zone        = "us-central1-c"

}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-example"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-bionic-v20200807"
    }
  }

  network_interface {
    network = "default"
    access_config {

    }
  }
}
