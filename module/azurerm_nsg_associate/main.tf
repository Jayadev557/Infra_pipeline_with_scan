resource "azurerm_subnet_network_security_group_association" "nsg_associate" {
  for_each                  = var.nsg_associates
  subnet_id                 = data.azurerm_subnet.example[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg_block[each.key].id
}
