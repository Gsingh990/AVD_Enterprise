output "vnet_id" {
  description = "The ID of the AVD Virtual Network."
  value       = azurerm_virtual_network.main.id
}

output "avd_subnet_id" {
  description = "The ID of the AVD session hosts subnet."
  value       = azurerm_subnet.avd_subnet.id
}

# output "avd_nsg_id" {
#   description = "The ID of the AVD Network Security Group."
#   value       = azurerm_network_security_group.avd_nsg.id
# }