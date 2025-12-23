data "azurerm_network_security_group" "nsg_block" {
  for_each            = var.nsg_associates
  name                = each.value.nsg_name
  resource_group_name = each.value.rg_name
}

data "azurerm_subnet" "example" {
  for_each             = var.nsg_associates
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}
