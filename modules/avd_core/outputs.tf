output "host_pool_id" {
  description = "The ID of the AVD Host Pool."
  value       = azurerm_virtual_desktop_host_pool.main.id
}

# output "host_pool_registration_token" {
#   description = "The registration token for the AVD Host Pool."
#   value       = azurerm_virtual_desktop_host_pool.main.registration_info[0].token
#   sensitive   = true
# }

output "workspace_id" {
  description = "The ID of the AVD Workspace."
  value       = azurerm_virtual_desktop_workspace.main.id
}

output "application_group_id" {
  description = "The ID of the AVD Application Group."
  value       = azurerm_virtual_desktop_application_group.main.id
}
