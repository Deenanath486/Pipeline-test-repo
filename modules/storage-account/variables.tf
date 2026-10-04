variable "storage_accounts" {
  description = "Map of storage accounts to create."
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = optional(string, "Standard")
    account_replication_type = optional(string, "LRS")
    containers               = optional(list(string), [])
    tags                     = optional(map(string), {})
  }))
}
