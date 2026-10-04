output "resource_group_name" {
  description = "Name of the backend resource group."
  value       = azurerm_resource_group.backend.name
}

output "storage_account_name" {
  description = "Name of the backend storage account."
  value       = azurerm_storage_account.backend.name
}

output "container_name" {
  description = "Name of the tfstate blob container."
  value       = azurerm_storage_container.tfstate.name
}

output "backend_config_snippet" {
  description = "Copy this block into environments/dev/backend.tf and run terraform init -reconfigure."
  value       = <<-EOT
    terraform {
      backend "azurerm" {
        resource_group_name  = "${azurerm_resource_group.backend.name}"
        storage_account_name = "${azurerm_storage_account.backend.name}"
        container_name       = "${azurerm_storage_container.tfstate.name}"
        key                  = "dev/terraform.tfstate"
      }
    }
  EOT
}
