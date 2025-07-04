resource "azurerm_resource_group" "avd_rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "avd_networking" {
  source = "./modules/avd_networking"

  resource_group_name = azurerm_resource_group.avd_rg.name
  location            = azurerm_resource_group.avd_rg.location
  vnet_name           = var.vnet_name
  vnet_address_space  = var.vnet_address_space
  avd_subnet_name     = var.avd_subnet_name
  avd_subnet_address_prefixes = var.avd_subnet_address_prefixes
  tags                = var.tags
}

module "avd_core" {
  source = "./modules/avd_core"

  resource_group_name = azurerm_resource_group.avd_rg.name
  location            = azurerm_resource_group.avd_rg.location
  host_pool_name      = var.host_pool_name
  host_pool_type      = var.host_pool_type
  load_balancer_type  = var.load_balancer_type
  personal_desktop_assignment_type = var.personal_desktop_assignment_type
  host_pool_friendly_name = var.host_pool_friendly_name
  host_pool_description = var.host_pool_description
  host_pool_max_session_limit = var.host_pool_max_session_limit
  host_pool_custom_rdp_properties = var.host_pool_custom_rdp_properties
  workspace_name      = var.workspace_name
  workspace_friendly_name = var.workspace_friendly_name
  workspace_description = var.workspace_description
  application_group_name = var.application_group_name
  application_group_friendly_name = var.application_group_friendly_name
  application_group_description = var.application_group_description
  application_group_type = var.application_group_type
  tags                = var.tags
}

module "avd_session_hosts" {
  source = "./modules/avd_session_hosts"
  host_pool_name = "your-host-pool-name"

  resource_group_name = azurerm_resource_group.avd_rg.name
  location            = azurerm_resource_group.avd_rg.location
  subnet_id           = module.avd_networking.avd_subnet_id
  host_pool_id        = module.avd_core.host_pool_id
  host_pool_registration_token = var.host_pool_registration_token

  session_host_vm_count = var.session_host_vm_count
  session_host_vm_size = var.session_host_vm_size
  session_host_image_publisher = var.session_host_image_publisher
  session_host_image_offer = var.session_host_image_offer
  session_host_image_sku = var.session_host_image_sku
  session_host_image_version = var.session_host_image_version
  session_host_admin_username = var.session_host_admin_username
  session_host_admin_password = var.session_host_admin_password
  tags                = var.tags
}

# module "avd_monitoring" {
#   source = "./modules/avd_monitoring"

#   resource_group_name = azurerm_resource_group.avd_rg.name
#   location            = azurerm_resource_group.avd_rg.location
#   log_analytics_workspace_name = var.log_analytics_workspace_name
#   tags                = var.tags
# }