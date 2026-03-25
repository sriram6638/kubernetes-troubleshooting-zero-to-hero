# Terraform Azure CI/CD Setup

This folder contains production-grade Terraform configuration and a GitHub Actions workflow for deploying Azure resources securely and automatically.

## Structure

- `main.tf` — Terraform provider and backend config
- `variables.tf` — Input variables
- `outputs.tf` — Output values
- `backend.tfvars` — Backend state configuration (edit with your Azure details)
- `.github/workflows/terraform.yml` — CI/CD pipeline for Terraform

## Setup Steps

1. **Create Azure Storage for State**
   - Create a resource group and storage account for Terraform state.
   - Example:
     ```sh
     az group create --name <RESOURCE_GROUP_NAME> --location <LOCATION>
     az storage account create --name <STORAGE_ACCOUNT_NAME> --resource-group <RESOURCE_GROUP_NAME> --sku Standard_LRS
     az storage container create --name tfstate --account-name <STORAGE_ACCOUNT_NAME>
     ```
2. **Configure Backend**
   - Edit `backend.tfvars` with your resource group, storage account, and container.

3. **Configure GitHub Secrets**
   - Add `AZURE_CLIENT_ID`, `AZURE_TENANT_ID`, `AZURE_SUBSCRIPTION_ID` from your Azure AD App Registration (Service Principal or OIDC).

4. **CI/CD Pipeline**
   - On push/PR to `main`, the workflow will:
     - Authenticate to Azure
     - Run `terraform init`, `validate`, `plan`, and `apply` (on main branch)

5. **Best Practices**
   - Use remote backend for state
   - Never commit secrets
   - Use OIDC or Service Principal for authentication
   - Protect `main` branch
   - Require PR review before merge

## References
- [Terraform Azure Provider Docs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Terraform Style Guide](https://developer.hashicorp.com/terraform/language/style)
- [Azure OIDC Auth](https://learn.microsoft.com/en-us/azure/developer/github/connect-from-azure?tabs=azure-cli%2Clinux)
