#variable "test" {default = "test"}

provider "google" {
  project     = "bryantest"
  region      = "us-west1-a"
 # credentials = file(var.path)
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
