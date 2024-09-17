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
  depends_on = [ azurerm_resource_group.addrg ]
}

resource "azurerm_subnet" "vprsubnet" {
  for_each             = var.private_subnets
  name                 = each.key
  resource_group_name  = "rg-${var.env}-${var.az-rg[4]}"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.100.${each.value}.0/24"]
  depends_on = [ azurerm_virtual_network.vnet ]
}

#Create NiC and Public IP for AD VM
resource "azurerm_public_ip" "pubipadvm" {
  name                = var.pub-ip-advm
  resource_group_name = "rg-${var.env}-${var.az-rg[2]}"
  location            = var.region
  allocation_method   = "Static"

  tags = {
    Environment = var.environment
    Provisioned = "terraform-azure-${var.gitenv}"
    Workload    = var.az-rg[2]
  }
}
resource "azurerm_network_interface" "nicadvm" {
  name                = var.nic-advm-name
  location            = var.region
  resource_group_name = "rg-${var.env}-${var.az-rg[2]}"

  ip_configuration {
    name                          = var.ip-nic-advm-name
    subnet_id                     = azurerm_subnet.vprsubnet["plt-snet-adds"].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pubipadvm.id
  }
  depends_on = [ azurerm_public_ip.pubipadvm ]
}

