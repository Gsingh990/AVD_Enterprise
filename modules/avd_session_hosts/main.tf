resource "azurerm_network_interface" "main" {
  count = var.session_host_vm_count

  name                = "${var.host_pool_name}-nic-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
  tags = var.tags
}

resource "azurerm_virtual_machine" "main" {
  count = var.session_host_vm_count

  name                  = "${var.host_pool_name}-vm-${count.index}"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.main[count.index].id]
  vm_size               = var.session_host_vm_size

  storage_image_reference {
    publisher = var.session_host_image_publisher
    offer     = var.session_host_image_offer
    sku       = var.session_host_image_sku
    version   = var.session_host_image_version
  }

  storage_os_disk {
    name              = "${var.host_pool_name}-osdisk-${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "${var.host_pool_name}-vm-${count.index}"
    admin_username = var.session_host_admin_username
    admin_password = var.session_host_admin_password
  }

  os_profile_windows_config {
    provision_vm_agent = true
    timezone           = "Central Standard Time"
  }
  tags = var.tags
}

# Custom Script Extension for AVD Agent Installation and Registration
resource "azurerm_virtual_machine_extension" "aad_join_and_avd_agent" {
  count = var.session_host_vm_count

  name                 = "AVDAgentInstall"
  virtual_machine_id   = azurerm_virtual_machine.main[count.index].id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.1"

  settings = <<SETTINGS
    {
        "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File install-avd-agent-aadjoin.ps1"
    }
SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
    {
        "script": "$hostPoolRegistrationToken = '$${var.host_pool_registration_token}';\n\n# Only attempt AVD agent installation if token is available (i.e., during apply)\nif (-not [string]::IsNullOrEmpty($hostPoolRegistrationToken)) {\n    # Download and Install AVD Agent\n    Invoke-WebRequest -Uri \"https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/blobByUri?uri=https://go.microsoft.com/fwlink/?linkid=2172303\" -OutFile \"$env:TEMP\\AVDAgent.msi\"\n    Start-Process -FilePath \"msiexec.exe\" -ArgumentList \"/i \"$env:TEMP\\AVDAgent.msi\" /qn /L*v \"$env:TEMP\\AVDAgentInstall.log\" REGISTRATIONTOKEN=$hostPoolRegistrationToken\" -Wait\n\n    # Download and Install AVD Bootloader\n    Invoke-WebRequest -Uri \"https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/blobByUri?uri=https://go.microsoft.com/fwlink/?linkid=2151488\" -OutFile \"$env:TEMP\\AVDBootloader.msi\"\n    Start-Process -FilePath \"msiexec.exe\" -ArgumentList \"/i \"$env:TEMP\\AVDBootloader.msi\" /qn /L*v \"$env:TEMP\\AVDBootloaderInstall.log\"\" -Wait\n}\n"
    }
PROTECTED_SETTINGS

  tags = var.tags

  depends_on = [
    azurerm_virtual_machine.main
  ]
}
