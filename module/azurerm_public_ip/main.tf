resource "azurerm_public_ip" "pipblock" {
  for_each            = var.public_ips
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method #"Static"
  tags                = each.value.tags
}
