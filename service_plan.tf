resource "azurerm_service_plan" "serviceplan" {
  name                = "StorageMailNotifierSP"
  resource_group_name = data.azurerm_resource_group.resourcegroup.name
  location            = data.azurerm_resource_group.resourcegroup.location
  os_type             = "Linux"
  sku_name            = "Y1"
}