resource "azurerm_key_vault" "kv_block" {
  for_each                    = var.key_vaults
  name                        = each.value.kv_name
  location                    = each.value.location
  resource_group_name         = each.value.rg_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
      "Backup",
      "Create",
      "Delete",
      "Get",
      "Import",
      "List",
      "Purge",
      "Update",
    ]

    secret_permissions = [
      "Get",
      "Set",
      "Backup",
      "Delete",
      "Get",
      "List",
      "Purge",
      "Recover",
      "Restore"
    ]

    storage_permissions = [
      "Get",
    ]
  }
}
