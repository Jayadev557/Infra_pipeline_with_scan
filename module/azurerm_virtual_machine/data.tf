data "azurerm_subnet" "subnetdatablock" {
  for_each             = var.virtual_machines
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

