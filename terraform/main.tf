# Terraform configuration for Azure resources
# Followed Azure and Terraform best practices

terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

# Add your Azure resources here
