# Terraform backend configuration for Azure
# Replace values with your actual resource group, storage account, and container

resource_group_name  = "testing"
storage_account_name = "drstorage123"
container_name       = "tfstate"
key                  = "terraform.tfstate"
