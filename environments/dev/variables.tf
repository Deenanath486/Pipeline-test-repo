variable "resource_groups" {
  description = "Map of resource groups for the dev environment."
  type = map(object({
    name     = string
    location = string
    tags     = optional(map(string), {})
  }))
}

variable "storage_accounts" {
  description = "Map of storage accounts for the dev environment."
  type = map(object({
    name                     = string
    resource_group_key       = string
    location                 = string
    account_tier             = optional(string, "Standard")
    account_replication_type = optional(string, "LRS")
    containers               = optional(list(string), [])
    tags                     = optional(map(string), {})
  }))
}
