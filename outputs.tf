output "environment" {
  value = var.environment
}

output "Workspace" {
  value = "terraform-azure-${var.gitenv}"
}

output "StorageAccount-Diag" {
  value = azurerm_storage_account.storacc.primary_blob_endpoint
}

output "Subnet-NameIDs" {
  value = values(azurerm_subnet.vprsubnet)[*].name
}