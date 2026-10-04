terraform {
  required_version = ">= 1.5.0"

  # Bootstrap intentionally uses local state — no backend block here.
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"
    }
  }
}

provider "azurerm" {
  features {}
}
