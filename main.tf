# Azure Provider source and version being usedterraform
terraform {
  backend "remote" {
    organization = "CMHL"
    workspaces {
      name = "terraform-azure-avd"
    }
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.1.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  client_id       = var.azclient_id
  client_secret   = var.azclient_secret
  tenant_id       = var.aztenant_id
  subscription_id = var.azsubscription_id
}

resource "azurerm_resource_group" "rg-pilot" {
  name     = "rg-${var.env}-net-01"
  location = var.region

  tags = {
    Environment = var.environment
    Provisioned = "terraform-azure-${var.gitenv}"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.env}-vnet-01"
  location            = azurerm_resource_group.rg-pilot.location
  resource_group_name = azurerm_resource_group.rg-pilot.name
  address_space       = [var.vnet_ipas]

  tags = {
    environment = var.environment
  }
}

resource "azurerm_subnet" "vprsubnet" {
  for_each             = var.private_subnets
  name                 = "${var.env}${each.key}"
  resource_group_name  = azurerm_resource_group.rg-pilot.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.100.${each.value}.0/24"]
}