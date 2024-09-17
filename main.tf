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