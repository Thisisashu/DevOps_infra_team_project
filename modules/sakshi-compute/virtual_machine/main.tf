resource "azurerm_linux_virtual_machine" "vm" {
  name                = "ubuntu-vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_B1s"
  admin_username      = var.admin_username
  network_interface_ids = [azurerm_network_interface.nic.id]

  admin_ssh_key {
    username   = var.admin_username
    public_key = file("~/.ssh/id_rsa.pub") 
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

 source_image_reference {
  publisher = "Canonical"
  offer     = "UbuntuServer"
  sku       = "20_04-lts"
  version   = "latest"
}

disable_password_authentication = true
}