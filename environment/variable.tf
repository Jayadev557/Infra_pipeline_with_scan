variable "rg_details" {
  type = map(object({
    rg_name    = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
}

variable "network" {
  type = map(object({
    vnet_name     = string
    location      = string
    rg_name       = string
    address_space = optional(list(string))
    subnets = list(object({
      subnet_name      = string
      address_prefixes = list(string)
    }))
    tags = optional(map(string))
  }))
}


variable "public_ips" {
  type = map(object({
    pip_name          = string
    rg_name           = string
    location          = string
    allocation_method = string
    tags              = optional(map(string))
  }))
}

variable "virtual_machines" {
  type = map(object({
    nic_name       = string
    vm_name        = string
    rg_name        = string
    location       = string
    size           = string
    admin_username = string
    admin_password = string
    subnet_name    = string
    vnet_name      = string
  }))
}

variable "nsgs" {
  type = map(object({
    nsg_name = string
    location = string
    rg_name  = string
    tags     = optional(map(string))
    nsg_rules = list(object({
      rule_name                  = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}

variable "nsg_associates" {
  type = map(object({
    nsg_name    = string
    rg_name     = string
    subnet_name = string
    vnet_name   = string
  }))
}


variable "key_vaults" {
  type = map(object({
    kv_name  = string
    location = string
    rg_name  = string
  }))
}

variable "kv_secret_data" {
  type = map(object({
    kv_sec_name  = string
    kv_sec_value = string
    kv_name      = string
    rg_name      = string
  }))
}


variable "sql_servers" {
  type = map(object({
    server_name                  = string
    rg_name                      = string
    location                     = string
    administrator_login          = string
    administrator_login_password = string
    tags                         = optional(map(string))
  }))
}

variable "sql_database" {
  type = map(object({
    db_name     = string
    rg_name     = string
    server_name = string
    tags        = optional(map(string))
  }))
}
