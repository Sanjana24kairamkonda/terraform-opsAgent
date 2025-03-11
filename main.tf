# Define the provider for Google Cloud
provider "google" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone
  credentials = file(var.google_credentials_file)  # Path to the service account key
}

# Create the service account for Cloud SQL Proxy (if needed)
resource "google_service_account" "cloud_sql_proxy_sa" {
  account_id   = "cloud-sql-proxy-sa"
  display_name = "Cloud SQL Proxy Service Account"
}

# Grant the service account the required role to access Cloud SQL
resource "google_project_iam_member" "cloud_sql_proxy_role" {
  project = var.project_id
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:${google_service_account.cloud_sql_proxy_sa.email}"
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

  tags = ["cloudsql-proxy"]
}

# Optionally, you can add other resources here, such as Cloud SQL instances, etc.
