# Create a resource group (if you don't have one)
az group create --name terraform-rg --location eastus

# Run Terraform container (will pull from Docker Hub)
# Recreate with an infinite wait command
az container create `
  --resource-group terraform-rg `
  --name terraform-shell `
  --image hashicorp/terraform:latest `
  --os-type Linux `
  --cpu 1 `
  --memory 1.5 `
  --restart-policy OnFailure `
  --command-line "tail -f /dev/null"  # Keeps container running

# Then attach
az container attach --resource-group terraform-rg --name terraform-shell
