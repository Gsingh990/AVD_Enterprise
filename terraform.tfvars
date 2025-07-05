resource_group_name = "rg-avd-enterprise"
location            = "eastus"

tags = {
  environment = "prod"
  project     = "avd-enterprise"
}

vnet_name = "vnet-avd-enterprise"
vnet_address_space = ["10.10.0.0/16"]
avd_subnet_name = "snet-avd-hosts"
avd_subnet_address_prefixes = ["10.10.1.0/24"]

host_pool_name = "hp-avd-enterprise"
host_pool_type = "Pooled"
load_balancer_type = "BreadthFirst"
personal_desktop_assignment_type = "Automatic"
host_pool_friendly_name = "Enterprise AVD Host Pool"
host_pool_description = "Host Pool for Enterprise AVD Solution"
host_pool_max_session_limit = 10
host_pool_custom_rdp_properties = ""

workspace_name = "ws-avd-enterprise"
workspace_friendly_name = "Enterprise AVD Workspace"
workspace_description = "Workspace for Enterprise AVD Solution"

application_group_name = "ag-avd-enterprise-desktop"
application_group_friendly_name = "Enterprise AVD Desktop App Group"
application_group_description = "Desktop Application Group for Enterprise AVD Solution"
application_group_type = "Desktop"

session_host_vm_count = 2
session_host_vm_size = "Standard_D4s_v3"
session_host_image_publisher = "MicrosoftWindowsDesktop"
session_host_image_offer = "Windows-11"
session_host_image_sku = "win11-21h2-avd"
session_host_image_version = "latest"
session_host_admin_username = "avdadmin"
session_host_admin_password = "YourSecurePassword!123"

# log_analytics_workspace_name = "la-avd-enterprise"
