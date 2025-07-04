variable "resource_group_name" {
  description = "The name of the resource group for AVD resources."
  type        = string
}

variable "location" {
  description = "The Azure region to deploy AVD resources into."
  type        = string
}

variable "vnet_name" {
  description = "The name of the Virtual Network for AVD."
  type        = string
}

variable "vnet_address_space" {
  description = "The address space for the AVD Virtual Network."
  type        = list(string)
}

variable "avd_subnet_name" {
  description = "The name of the subnet for AVD session hosts."
  type        = string
}

variable "avd_subnet_address_prefixes" {
  description = "The address prefixes for the AVD session hosts subnet."
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
  default     = {}
}
