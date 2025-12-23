resource "azurerm_key_vault_secret" "vm_secret" {
  for_each     = var.kv_secret_data
  name         = each.value.kv_sec_name
  value        = each.value.kv_sec_value
  key_vault_id = data.azurerm_key_vault.kv_dtblock[each.key].id
}
