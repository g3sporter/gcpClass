provider "google" {
 #credentials = "${file("/Users/bryan/hashicorp/bryanTest-d87f1249d43c.json")}"
  project     = "bryanTest"
  region      = "us-west1"
}

resource "google_compute_instance" "default" {

  name         = "test"
  machine_type = "n1-standard-1"
  zone         = "us-west1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1604-lts"
    }
  }
  network_interface {
    network = "default"
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }

}
