variable "resource_group_name" {
  description = "The name of the resource group for AVD resources."
  type        = string
}

variable "location" {
  description = "The Azure region to deploy AVD resources into."
  type        = string
}

# variable "log_analytics_workspace_name" {
#   description = "The name of the Log Analytics Workspace for AVD monitoring."
#   type        = string
# }

variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
  default     = {}
}