resource "azurerm_virtual_desktop_host_pool" "main" {
  name                = var.host_pool_name
  location            = var.location
  resource_group_name = var.resource_group_name
  type                = var.host_pool_type
  load_balancer_type  = var.load_balancer_type
  personal_desktop_assignment_type = var.personal_desktop_assignment_type
  friendly_name       = var.host_pool_friendly_name != "" ? var.host_pool_friendly_name : null
  description         = var.host_pool_description != "" ? var.host_pool_description : null
  maximum_sessions_allowed = var.host_pool_max_session_limit
  custom_rdp_properties = var.host_pool_custom_rdp_properties != "" ? var.host_pool_custom_rdp_properties : null
  tags                = var.tags
}

resource "azurerm_virtual_desktop_workspace" "main" {
  name                = var.workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  friendly_name       = var.workspace_friendly_name != "" ? var.workspace_friendly_name : null
  description         = var.workspace_description != "" ? var.workspace_description : null
  tags                = var.tags
}

resource "azurerm_virtual_desktop_application_group" "main" {
  name                = var.application_group_name
  location            = var.location
  resource_group_name = var.resource_group_name
  type                = var.application_group_type
  host_pool_id        = azurerm_virtual_desktop_host_pool.main.id
  friendly_name       = var.application_group_friendly_name != "" ? var.application_group_friendly_name : null
  description         = var.application_group_description != "" ? var.application_group_description : null
  tags                = var.tags
}
