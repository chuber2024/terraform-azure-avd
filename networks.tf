#Create virtual network and subnets for Pilot AVD
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.env}-vnet"
  location            = var.region
  resource_group_name = "rg-${var.env}-${var.az-rg[4]}"
  address_space       = [var.vnet_ipas]

  tags = {
    Environment = var.environment
    Provisioned = "terraform-azure-${var.gitenv}"
    Workload    = var.az-rg[4]
  }
}

resource "azurerm_subnet" "vprsubnet" {
  for_each             = var.private_subnets
  name                 = each.key
  resource_group_name  = "rg-${var.env}-${var.az-rg[4]}"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.100.${each.value}.0/24"]
}