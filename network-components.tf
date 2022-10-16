resource "azurerm_lb" "WFE_LB" {
  name                = var.loadbalancer
  resource_group_name = "${var.resource_group}-loadbalancer"
  location            = var.region
  depends_on = [
    azurerm_resource_group.sp-availability-set
  ]
}

resource "azurerm_availability_set" "SP_wfe_AS" {
  name                         = var.avset
  resource_group_name          = "${var.resource_group}-availabilityset"
  location                     = var.region
  platform_fault_domain_count  = 3
  platform_update_domain_count = 4
  depends_on = [
    azurerm_resource_group.load-balancer
  ]
}


resource "azurerm_network_security_group" "sp_servers_nsg" {
  name = var.NSG
  resource_group_name = resource_group_name  = azurerm_resource_group.Vnet-SpServers.name
  location              = var.region
   
}

resource "azurerm_network_security_rule" "nsg_rule" {
  name                        = "sp-server-restrictions"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = resource_group_name  = azurerm_resource_group.Vnet-SpServers.name
  network_security_group_name = azurerm_network_security_group.name
}

