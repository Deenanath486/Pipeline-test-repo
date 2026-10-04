variable "resource_group_name" {
  description = "Name of the resource group that holds the Terraform backend storage."
  type        = string
  default     = "Devyani-RG"
}

variable "location" {
  description = "Azure region for the backend resources."
  type        = string
  default     = "Central India"
}

variable "storage_account_name" {
  description = "Globally unique name for the backend storage account."
  type        = string
  default     = "devyani543212"
}

variable "container_name" {
  description = "Blob container that stores Terraform state files."
  type        = string
  default     = "tfstate"
}
