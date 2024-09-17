resource "azurerm_storage_account" "storacc" {
  name                     = var.sa-name
  resource_group_name      = "rg-${var.env}-${var.az-rg[0]}"
  location                 = var.region
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    Environment = var.environment
    Provisioned = "terraform-azure-${var.gitenv}"
    Workload    = var.az-rg[0]
  }
}

/* resource "azurerm_storage_account" "storfslacc" {
  name                     = var.sa-fsl-name
  resource_group_name      = "rg-${var.env}-${var.az-rg[1]}"
  location                 = var.region
  account_tier             = "Premium"
  account_kind = "FileStorage"
  account_replication_type = "LRS"
 
  tags = {
    Environment = var.environment
    Provisioned = "terraform-azure-${var.gitenv}"
    Workload    = var.az-rg[1]
  }
}

#Private Endpoint for FSLogics Storage
resource "azurerm_private_endpoint" "storfslaccpe" {
  name                = var.sa-fsl-ep-name
  location            = var.region
  resource_group_name = "rg-${var.env}-${var.az-rg[1]}"
  subnet_id           = azurerm_subnet.vprsubnet["${var.env}-snet-avd"].id

  private_service_connection {
    name                           = "privatelink.file.core.windows.net"
    private_connection_resource_id = azurerm_storage_account.storfslacc.id
    subresource_names              = ["file"]
    is_manual_connection           = false
  }
} */