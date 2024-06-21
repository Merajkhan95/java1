resource "azurerm_app_service_plan" "appserviceplan1block" {
  name                = "appserviceplan-meraj1"
  location            = "east US"
  resource_group_name = "merajRG2"

  depends_on = [ azurerm_resource_group.rgblock ]

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "example1" {
  name                = "appservice-meraj1"
  location            = "east US"
  resource_group_name = "merajRG2"
  app_service_plan_id = azurerm_app_service_plan.appserviceplan1block.id
  

  depends_on = [ azurerm_app_service_plan.appserviceplan1block ]

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
    ftps_state = "AllAllowed"
  }


}