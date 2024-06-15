resource "azurerm_linux_function_app" "function" {
  name                = "storageMailNotifierFn"
  resource_group_name = data.azurerm_resource_group.resourcegroup.name
  location            = data.azurerm_resource_group.resourcegroup.location

  storage_account_name       = azurerm_storage_account.storageAccount.name
  storage_account_access_key = azurerm_storage_account.storageAccount.primary_access_key

  service_plan_id = azurerm_service_plan.serviceplan.id

  site_config {}
}