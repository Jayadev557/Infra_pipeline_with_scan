variable "kv_secret_data" {
  type = map(object({
    kv_sec_name  = string
    kv_sec_value = string
    kv_name      = string
    rg_name      = string
  }))
}
