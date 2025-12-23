module "resource_group" {
  source     = "../module/azurerm_resource_grp"
  rg_details = var.rg_details
}

module "networks" {
  depends_on = [module.resource_group]
  source     = "../module/azurerm_networks"
  network    = var.network
}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../module/azurerm_public_ip"
  public_ips = var.public_ips
}

module "virtual_machine" {
  depends_on       = [module.networks, module.kv_secret]
  source           = "../module/azurerm_virtual_machine"
  virtual_machines = var.virtual_machines

}

module "network_security" {
  depends_on = [module.resource_group]
  source     = "../module/azurerm_nsg_rule"
  nsgs       = var.nsgs
}

module "nsg_associate" {
  depends_on     = [module.networks]
  source         = "../module/azurerm_nsg_associate"
  nsg_associates = var.nsg_associates
}

module "key_vault" {
  depends_on = [module.resource_group]
  source     = "../module/azurerm_key_vault"
  key_vaults = var.key_vaults
}

module "kv_secret" {
  depends_on     = [module.key_vault]
  source         = "../module/azurerm_kv_secret"
  kv_secret_data = var.kv_secret_data
}

module "sql_server" {
  depends_on  = [module.resource_group]
  source      = "../module/azurerm_mssql_server"
  sql_servers = var.sql_servers
}

module "sql_database" {
  depends_on   = [module.sql_server]
  source       = "../module/azurerm_sql_database"
  sql_database = var.sql_database
}

