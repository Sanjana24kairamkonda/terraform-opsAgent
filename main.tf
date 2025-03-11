# Define the provider for Google Cloud
provider "google" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone
  credentials = file(var.google_credentials_file)  # Path to the service account key
}

# Create the VM instance
resource "google_compute_instance" "cloudsql_proxy_vm" {
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/family/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata = {
    startup-script = var.startup_script  # The script to install the Ops Agent
  }

}

# Optionally, you can add other resources here, such as Cloud SQL instances, etc.
