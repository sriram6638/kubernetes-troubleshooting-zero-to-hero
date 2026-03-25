# Variables for Terraform Azure deployment

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  default = "testing"
}

variable "location" {
  description = "The Azure region to deploy resources."
  type        = string
  default     = "centralindia"
}

# Add more variables as needed for your resources
