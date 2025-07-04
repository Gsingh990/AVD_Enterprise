variable "resource_group_name" {
  description = "The name of the resource group for AVD resources."
  type        = string
}

variable "location" {
  description = "The Azure region to deploy AVD resources into."
  type        = string
}

variable "host_pool_name" {
  description = "The name of the AVD Host Pool."
  type        = string
}

variable "host_pool_type" {
  description = "The type of the AVD Host Pool (Pooled or Personal)."
  type        = string
}

variable "load_balancer_type" {
  description = "The load balancer type for the AVD Host Pool (BreadthFirst or DepthFirst)."
  type        = string
}

variable "personal_desktop_assignment_type" {
  description = "The personal desktop assignment type for the AVD Host Pool (Automatic or Direct). Only applicable for Personal host pools."
  type        = string
}

variable "host_pool_friendly_name" {
  description = "A friendly name for the AVD Host Pool."
  type        = string
  default     = ""
}

variable "host_pool_description" {
  description = "A description for the AVD Host Pool."
  type        = string
  default     = ""
}

variable "host_pool_max_session_limit" {
  description = "The maximum number of sessions allowed on a host pool."
  type        = number
  default     = 10
}

variable "host_pool_custom_rdp_properties" {
  description = "Custom RDP properties for the Host Pool."
  type        = string
  default     = ""
}

variable "workspace_name" {
  description = "The name of the AVD Workspace."
  type        = string
}

variable "workspace_friendly_name" {
  description = "A friendly name for the AVD Workspace."
  type        = string
  default     = ""
}

variable "workspace_description" {
  description = "A description for the AVD Workspace."
  type        = string
  default     = ""
}

variable "application_group_name" {
  description = "The name of the AVD Application Group."
  type        = string
}

variable "application_group_friendly_name" {
  description = "A friendly name for the AVD Application Group."
  type        = string
  default     = ""
}

variable "application_group_description" {
  description = "A description for the AVD Application Group."
  type        = string
  default     = ""
}

variable "application_group_type" {
  description = "The type of the AVD Application Group (RemoteApp or Desktop)."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
  default     = {}
}
