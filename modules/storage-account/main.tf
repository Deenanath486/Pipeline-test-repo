resource "azurerm_storage_account" "this" {
  for_each = var.storage_accounts

  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type

  tags = each.value.tags
}

resource "azurerm_storage_container" "this" {
  for_each = {
    for item in local.containers : "${item.storage_key}.${item.container_name}" => item
  }

  name                  = each.value.container_name
  storage_account_name  = azurerm_storage_account.this[each.value.storage_key].name
  container_access_type = "private"
}

locals {
  containers = flatten([
    for storage_key, storage in var.storage_accounts : [
      for container_name in storage.containers : {
        storage_key    = storage_key
        container_name = container_name
      }
    ]
  ])
}
