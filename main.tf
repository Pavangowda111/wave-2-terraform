resource "google_compute_instance" "wav2-linux" {
  name         = "wave2-linux1"
  machine_type = var.machine_type
  zone         = "asia-south2-b"

  boot_disk {
    initialize_params {
      image = var.image_linux
      labels = {
        my_label = "value"
      }
    }
  }
  network_interface {
    network = "custom"
    subnetwork = var.test_subnet

  }
  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "new-service-account@${var.project}.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}
resource "google_compute_instance" "wav2-windows" {
  count        = var.vm_count
  name         = "wave2-win${count.index}"
  machine_type = var.machine_type
  zone         = "asia-south2-c"

  boot_disk {
   // kms_key_self_link = google_kms_crypto_key.key-garage.id
    initialize_params {
      image = var.image_windows
      labels = {
        my_label = "value"
      }
    }
  }
  network_interface {
    network = "custom"
    subnetwork = var.test_subnet

  }
  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "new-service-account@${var.project}.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}
