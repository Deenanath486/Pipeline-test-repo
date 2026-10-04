output "storage_account_ids" {
  description = "Map of storage account keys to their IDs."
  value       = { for k, sa in azurerm_storage_account.this : k => sa.id }
}

output "storage_account_names" {
  description = "Map of storage account keys to their names."
  value       = { for k, sa in azurerm_storage_account.this : k => sa.name }
}

output "primary_blob_endpoints" {
  description = "Map of storage account keys to their primary blob endpoints."
  value       = { for k, sa in azurerm_storage_account.this : k => sa.primary_blob_endpoint }
}

output "container_ids" {
  description = "Map of container composite keys to their resource manager IDs."
  value       = { for k, c in azurerm_storage_container.this : k => c.resource_manager_id }
}
