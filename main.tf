provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "resourcegroup" {
  name     = "RaffaLab"
}

resource "azurerm_storage_account" "storageAccount" {
  name                     = "storagemailnotifiersa"
  resource_group_name      = data.azurerm_resource_group.resourcegroup.name
  location                 = data.azurerm_resource_group.resourcegroup.location
  account_tier             = "Standard"
  account_replication_type = "RAGRS"
}

resource "azurerm_service_plan" "serviceplan" {
  name                = "StorageMailNotifierSP"
  resource_group_name = data.azurerm_resource_group.resourcegroup.name
  location            = data.azurerm_resource_group.resourcegroup.location
  os_type             = "Linux"
  sku_name            = "Y1"
}


resource "azurerm_linux_function_app" "function" {
  name                = "storageMailNotifierFn"
  resource_group_name = data.azurerm_resource_group.resourcegroup.name
  location            = data.azurerm_resource_group.resourcegroup.location

  storage_account_name       = azurerm_storage_account.storageAccount.name
  storage_account_access_key = azurerm_storage_account.storageAccount.primary_access_key

  service_plan_id = azurerm_service_plan.serviceplan.id

  site_config {}
}