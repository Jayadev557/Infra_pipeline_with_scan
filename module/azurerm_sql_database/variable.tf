variable "sql_database" {
  type = map(object({
    db_name     = string
    rg_name     = string
    server_name = string
    tags        = optional(map(string))
  }))
}
