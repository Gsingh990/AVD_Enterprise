# resource "azurerm_log_analytics_workspace" "main" {
#   name                = var.log_analytics_workspace_name
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   sku                 = "PerGB2018"
#   retention_in_days   = 30
#   tags                = var.tags
# }

# resource "azurerm_log_analytics_solution" "avd_solution" {
#   solution_name         = "DesktopVirtualization"
#   resource_group_name   = var.resource_group_name
#   location              = azurerm_log_analytics_workspace.main.location
#   workspace_resource_id = azurerm_log_analytics_workspace.main.id
#   workspace_name        = azurerm_log_analytics_workspace.main.name

#   plan {
#     publisher = "Microsoft.DesktopVirtualization"
#     product   = "OMSGallery/DesktopVirtualization"
#   }
#   tags = var.tags
# }