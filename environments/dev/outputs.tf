output "resource_group_names" {
  description = "Names of all provisioned resource groups."
  value       = module.resource_groups.resource_group_names
}

output "resource_group_ids" {
  description = "IDs of all provisioned resource groups."
  value       = module.resource_groups.resource_group_ids
}

output "storage_account_names" {
  description = "Names of all provisioned storage accounts."
  value       = module.storage_accounts.storage_account_names
}

output "storage_account_ids" {
  description = "IDs of all provisioned storage accounts."
  value       = module.storage_accounts.storage_account_ids
}

output "primary_blob_endpoints" {
  description = "Primary blob endpoints of all provisioned storage accounts."
  value       = module.storage_accounts.primary_blob_endpoints
}
