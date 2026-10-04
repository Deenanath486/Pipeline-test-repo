module "resource_groups" {
  source = "../../modules/resource-group"

  resource_groups = var.resource_groups
}

module "storage_accounts" {
  source = "../../modules/storage-account"

  # Resolve resource_group_key → actual name and drop the key field,
  # which is not part of the child module's variable type.
  storage_accounts = {
    for k, sa in var.storage_accounts : k => {
      name                     = sa.name
      resource_group_name      = module.resource_groups.resource_group_names[sa.resource_group_key]
      location                 = sa.location
      account_tier             = sa.account_tier
      account_replication_type = sa.account_replication_type
      containers               = sa.containers
      tags                     = sa.tags
    }
  }

  depends_on = [module.resource_groups]
}
