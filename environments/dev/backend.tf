terraform {
  backend "azurerm" {
    resource_group_name  = "Santosh-RG"
    storage_account_name = "devyanitfstate20261003"
    container_name       = "tfstate"
    key                  = "dev/terraform.tfstate"
  }
}