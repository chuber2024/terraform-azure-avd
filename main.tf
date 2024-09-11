resource "azurerm_resource_group" "rg-pilot" {
  name     = "rg-plt-net-01"
  location = "West Europe"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "plt-vnet-01"
  location            = azurerm_resource_group.rg-pilot.location
  resource_group_name = azurerm_resource_group.rg-pilot.name
  address_space       = ["10.100.0.0/16"]

  subnet {
    name             = "plt-snet-avd-01"
    address_prefixes = ["10.100.1.0/24"]
  }

  subnet {
    name             = "plt-snet-adds-01"
    address_prefixes = ["10.100.2.0/24"]
  }

  tags = {
    environment = var.environment
  }
}