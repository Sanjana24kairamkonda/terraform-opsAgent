project_id            = "eng-artifact-453305-g4"
region                = "us-central1"
zone                  = "us-central1-a"
google_credentials_file = "gcp-key.json"
vm_name               = "ops-agent-vm"
startup_script        = <<-EOT
  # Install Ops Agent
  curl -sSO https://dl.google.com/cloudagents/install-ops-agent.sh
  sudo bash install-ops-agent.sh --also-enable
EOT
