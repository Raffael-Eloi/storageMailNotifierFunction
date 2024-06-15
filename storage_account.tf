resource "azurerm_storage_account" "storageAccount" {
  name                     = "storagemailnotifiersa"
  resource_group_name      = data.azurerm_resource_group.resourcegroup.name
  location                 = data.azurerm_resource_group.resourcegroup.location
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
}