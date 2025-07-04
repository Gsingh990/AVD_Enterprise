output "session_host_private_ips" {
  description = "A list of private IP addresses of the AVD session hosts."
  value       = azurerm_network_interface.main[*].private_ip_address
}

output "session_host_ids" {
  description = "A list of resource IDs of the AVD session host VMs."
  value       = azurerm_virtual_machine.main[*].id
}
