#Create all resource groups needed for AVD Pilot
resource "azurerm_resource_group" "addrg" {
  for_each = toset(var.az-rg)
  name     = "rg-${var.env}-${lower(each.value)}"
  location = var.region

  tags = {
    Environment = var.environment
    Provisioned = "terraform-azure-${var.gitenv}"
    Workload    = each.value
  }
}