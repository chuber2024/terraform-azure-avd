#Create VM for AD DC
resource "azurerm_windows_virtual_machine" "addc01" {
  name                = "AVD-DC01"
  resource_group_name = "rg-${var.env}-${var.az-rg[2]}"
  location            = var.region
  size                = "Standard_B2s"
  admin_username      = var.azadminuser
  admin_password      = var.azadminpw
  network_interface_ids = [
    azurerm_network_interface.nicadvm.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
  depends_on = [ azurerm_network_interface.nicadvm ]
}