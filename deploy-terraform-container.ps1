# Create a resource group (if you don't have one)
az group create --name terraform-rg --location eastus

# Run Terraform container (will pull from Docker Hub)
az container create \
  --resource-group terraform-rg \
  --name terraform-shell \
  --image hashicorp/terraform:latest \
  --os-type Linux \
  --cpu 1 \
  --memory 1.5 \  # 1.5GB recommended for interactive use
  --restart-policy OnFailure \  # Restarts if the shell crashes
  --command-line "/bin/sh"  # Keeps container alive with a shell
