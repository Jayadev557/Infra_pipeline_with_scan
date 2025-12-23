variable "sql_servers" {
  type =  map(object({
    server_name =  string
    rg_name = string
    location = string
    administrator_login = string
    administrator_login_password = string
    tags = optional (map(string))
  }))
}