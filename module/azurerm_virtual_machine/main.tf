resource "azurerm_network_interface" "nicblock" {
  for_each            = var.virtual_machines
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnetdatablock[each.key].id
    private_ip_address_allocation = "Dynamic"
    # public_ip_address_id          = data.azurerm_public_ip.pipdatablock[each.key].id
  }
}
#secret ka 2 ek password ka ek user ka data block lagega , and kv ka data blaock 
resource "azurerm_linux_virtual_machine" "vmblock" {
  for_each            = var.virtual_machines
  name                = each.value.vm_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  size                = each.value.size
  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.nicblock[each.key].id, ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
