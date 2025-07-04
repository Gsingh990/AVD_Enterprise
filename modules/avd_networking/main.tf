resource "azurerm_virtual_network" "main" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_address_space
  tags                = var.tags
}

resource "azurerm_subnet" "avd_subnet" {
  name                 = var.avd_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.avd_subnet_address_prefixes
  service_endpoints    = ["Microsoft.Storage", "Microsoft.KeyVault"]
  # delegation {
  #   name = "Microsoft.DesktopVirtualization/hostPools"
  #   service_delegation {
  #     name = "Microsoft.DesktopVirtualization/hostPools"
  #     actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
  #   }
  # }
}

resource "azurerm_network_security_group" "avd_nsg" {
  name                = "${var.avd_subnet_name}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_subnet_network_security_group_association" "avd_subnet_nsg_association" {
  subnet_id                 = azurerm_subnet.avd_subnet.id
  network_security_group_id = azurerm_network_security_group.avd_nsg.id
}

# NSG Rules for AVD
resource "azurerm_network_security_rule" "rdp_inbound" {
  name                        = "Allow-RDP-Inbound"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.avd_nsg.name
}

resource "azurerm_network_security_rule" "avd_agent_outbound" {
  name                        = "Allow-AVD-Agent-Outbound"
  priority                    = 110
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_ranges     = ["443"]
  source_address_prefix       = "*"
  destination_address_prefix  = "Internet"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.avd_nsg.name
}