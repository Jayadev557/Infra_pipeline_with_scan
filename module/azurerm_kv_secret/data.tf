data "azurerm_key_vault" "kv_dtblock" {
  for_each            = var.kv_secret_data
  name                = each.value.kv_name
  resource_group_name = each.value.rg_name
}
