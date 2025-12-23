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
