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
