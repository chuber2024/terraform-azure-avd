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