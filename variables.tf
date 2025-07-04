variable "resource_group_name" {
  description = "The name of the resource group for AVD resources."
  type        = string
  default     = "rg-avd-enterprise"
}

variable "location" {
  description = "The Azure region to deploy AVD resources into."
  type        = string
  default     = "eastus"
}

variable "tags" {
  description = "A map of tags to assign to all resources."
  type        = map(string)
  default     = {
    environment = "prod"
    project     = "avd-enterprise"
  }
}

variable "vnet_name" {
  description = "The name of the Virtual Network for AVD."
  type        = string
  default     = "vnet-avd-enterprise"
}

variable "vnet_address_space" {
  description = "The address space for the AVD Virtual Network."
  type        = list(string)
  default     = ["10.10.0.0/16"]
}

variable "avd_subnet_name" {
  description = "The name of the subnet for AVD session hosts."
  type        = string
  default     = "snet-avd-hosts"
}

variable "avd_subnet_address_prefixes" {
  description = "The address prefixes for the AVD session hosts subnet."
  type        = list(string)
  default     = ["10.10.1.0/24"]
}

variable "host_pool_name" {
  description = "The name of the AVD Host Pool."
  type        = string
  default     = "hp-avd-enterprise"
}

variable "host_pool_type" {
  description = "The type of the AVD Host Pool (Pooled or Personal)."
  type        = string
  default     = "Pooled"
}

variable "load_balancer_type" {
  description = "The load balancer type for the AVD Host Pool (BreadthFirst or DepthFirst)."
  type        = string
  default     = "BreadthFirst"
}

variable "personal_desktop_assignment_type" {
  description = "The personal desktop assignment type for the AVD Host Pool (Automatic or Direct). Only applicable for Personal host pools."
  type        = string
  default     = "Automatic"
}

variable "host_pool_friendly_name" {
  description = "A friendly name for the AVD Host Pool."
  type        = string
  default     = "Enterprise AVD Host Pool"
}

variable "host_pool_description" {
  description = "A description for the AVD Host Pool."
  type        = string
  default     = "Host Pool for Enterprise AVD Solution"
}

variable "host_pool_max_session_limit" {
  description = "The maximum number of sessions allowed on a host pool."
  type        = number
  default     = 10
}

variable "host_pool_registration_token" {
  description = "The registration token for the AVD host pool."
  type        = string
  sensitive   = true
}

variable "host_pool_custom_rdp_properties" {
  description = "Custom RDP properties for the Host Pool."
  type        = string
  default     = ""
}

variable "workspace_name" {
  description = "The name of the AVD Workspace."
  type        = string
  default     = "ws-avd-enterprise"
}

variable "workspace_friendly_name" {
  description = "A friendly name for the AVD Workspace."
  type        = string
  default     = "Enterprise AVD Workspace"
}

variable "workspace_description" {
  description = "A description for the AVD Workspace."
  type        = string
  default     = "Workspace for Enterprise AVD Solution"
}

variable "application_group_name" {
  description = "The name of the AVD Application Group."
  type        = string
  default     = "ag-avd-enterprise-desktop"
}

variable "application_group_friendly_name" {
  description = "A friendly name for the AVD Application Group."
  type        = string
  default     = "Enterprise AVD Desktop App Group"
}

variable "application_group_description" {
  description = "A description for the AVD Application Group."
  type        = string
  default     = "Desktop Application Group for Enterprise AVD Solution"
}

variable "application_group_type" {
  description = "The type of the AVD Application Group (RemoteApp or Desktop)."
  type        = string
  default     = "Desktop"
}

variable "session_host_vm_count" {
  description = "The number of AVD session host VMs to deploy."
  type        = number
  default     = 2
}

variable "session_host_vm_size" {
  description = "The VM size for the AVD session hosts."
  type        = string
  default     = "Standard_D4s_v3"
}

variable "session_host_image_publisher" {
  description = "The publisher of the VM image for AVD session hosts."
  type        = string
  default     = "MicrosoftWindowsDesktop"
}

variable "session_host_image_offer" {
  description = "The offer of the VM image for AVD session hosts."
  type        = string
  default     = "Windows-10"
}

variable "session_host_image_sku" {
  description = "The SKU of the VM image for AVD session hosts."
  type        = string
  default     = "win10-21h2-avd"
}

variable "session_host_image_version" {
  description = "The version of the VM image for AVD session hosts."
  type        = string
  default     = "latest"
}

variable "session_host_admin_username" {
  description = "Administrator username for the AVD session hosts."
  type        = string
}

variable "session_host_admin_password" {
  description = "Administrator password for the AVD session hosts."
  type        = string
  sensitive   = true
}

# variable "log_analytics_workspace_name" {
#   description = "The name of the Log Analytics Workspace for AVD monitoring."
#   type        = string
#   default     = "la-avd-enterprise"
# }