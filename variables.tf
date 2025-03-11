variable "project_id" {
  description = "The Google Cloud Project ID"
  type        = string
}

variable "region" {
  description = "The Google Cloud region"
  type        = string
}

variable "zone" {
  description = "The Google Cloud zone"
  type        = string
}

variable "google_credentials_file" {
  description = "Path to the GCP service account JSON key file"
  type        = string
}

variable "vm_name" {
  description = "Name of the VM instance"
  type        = string
}

variable "machine_type" {
  description = "The type of the machine"
  type        = string
  default     = "e2-medium"
}

variable "startup_script" {
  description = "The startup script to install Ops Agent"
  type        = string
}
