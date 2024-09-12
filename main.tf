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
  address_space       = ["10.100.0.0/16"]

  subnet {
    name             = "${var.env}-snet-avd-01"
    address_prefixes = ["10.100.1.0/24"]
  }

  subnet {
    name             = "${var.env}-snet-adds-01"
    address_prefixes = ["10.100.2.0/24"]
  }

  tags = {
    environment = var.environment
  }
}