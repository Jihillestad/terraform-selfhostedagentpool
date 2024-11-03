resource "azurerm_storage_account" "eshoponweb" {
  name                     = "eshoponweb987987"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "data" {
  name                  = "data"
  storage_account_name  = azurerm_storage_account.eshoponweb.name
  container_access_type = "blob"
}

resource "azurerm_storage_blob" "windows-agent-install" {
  name                   = "windows-agent-install.ps1"
  storage_account_name   = azurerm_storage_account.eshoponweb.name
  storage_container_name = azurerm_storage_container.data.name
  type                   = "Block"
  source                 = "./windows-agent-install.ps1"
}
