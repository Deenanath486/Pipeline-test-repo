# Bootstrap: creates the Azure backend infrastructure using local state.
# Run this ONCE before initialising any environment with the azurerm backend.
#
# Steps:
#   1. cd bootstrap
#   2. terraform init
#   3. terraform apply
#   4. Uncomment the backend block in environments/dev/backend.tf
#   5. cd ../environments/dev && terraform init -reconfigure

resource "azurerm_resource_group" "backend" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    environment = "bootstrap"
    managed_by  = "terraform"
  }
}

resource "azurerm_storage_account" "backend" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.backend.name
  location                 = azurerm_resource_group.backend.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  # Harden the backend storage account
  min_tls_version            = "TLS1_2"
  https_traffic_only_enabled = true

  tags = {
    environment = "bootstrap"
    managed_by  = "terraform"
  }
}

resource "azurerm_storage_container" "tfstate" {
  name                  = var.container_name
  storage_account_id    = azurerm_storage_account.backend.id
  container_access_type = "private"
}
