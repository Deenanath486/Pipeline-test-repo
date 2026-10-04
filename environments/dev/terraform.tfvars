resource_groups = {
  devyani_rg = {
    name     = "Devyani-RG"
    location = "Central India"
    tags = {
      environment = "dev"
      managed_by  = "terraform"
    }
  }

  axion_rg = {
    name     = "Axion-RG"
    location = "Central India"
    tags = {
      environment = "dev"
      managed_by  = "terraform"
    }
  }
}

storage_accounts = {
  devyani_sa = {
    name                     = "devyanitfstate20261004"
    resource_group_key       = "devyani_rg"
    location                 = "Central India"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    containers               = ["tfstate"]
    tags = {
      environment = "dev"
      managed_by  = "terraform"
    }
  }
}