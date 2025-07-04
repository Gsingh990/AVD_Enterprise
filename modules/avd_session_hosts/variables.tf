variable "resource_group_name" {
  description = "The name of the resource group for AVD resources."
  type        = string
}

variable "location" {
  description = "The Azure region to deploy AVD resources into."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the Subnet to join the AVD session hosts to."
  type        = string
}

variable "host_pool_id" {
  description = "The ID of the AVD Host Pool."
  type        = string
}

variable "host_pool_registration_token" {
  description = "The registration token for the AVD Host Pool."
  type        = string
  sensitive   = true
}

variable "session_host_vm_count" {
  description = "The number of AVD session host VMs to deploy."
  type        = number
}

variable "session_host_vm_size" {
  description = "The VM size for the AVD session hosts."
  type        = string
}

variable "session_host_image_publisher" {
  description = "The publisher of the VM image for AVD session hosts."
  type        = string
}

variable "session_host_image_offer" {
  description = "The offer of the VM image for AVD session hosts."
  type        = string
}

variable "session_host_image_sku" {
  description = "The SKU of the VM image for AVD session hosts."
  type        = string
}

variable "session_host_image_version" {
  description = "The version of the VM image for AVD session hosts."
  type        = string
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

variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
  default     = {}
}

variable "host_pool_name" {
  description = "The name of the host pool to use as a prefix for resources."
  type        = string
}