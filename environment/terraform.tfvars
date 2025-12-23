#---------------------#
#   Resource Group    #
#---------------------#
rg_details = {
  rg1 = {
    rg_name    = "test-jd-rg001"
    location   = "France Central "
    managed_by = null
    tags = {
      environment = "test"
      owner       = "jayadev"
      project     = "todo_app"
      costcenter  = "IT-001"
    }
  }
}


#===========Vnet & Subnet===========

network = {
  Vnet = {
    vnet_name     = "test-jd-vnet001"
    location      = "France Central"
    rg_name       = "test-jd-rg001"
    address_space = ["10.0.0.0/24"]
    subnets = [
      {
        subnet_name      = "test-jd-subnet001"
        address_prefixes = ["10.0.0.0/25"]
      },

      {
        subnet_name      = "AzureBastionSubnet"
        address_prefixes = ["10.0.0.128/25"]
      }
    ]

    tags = {
      environment = "test"
      owner       = "jd"
      project     = "todo_app"
      costcenter  = "IT-001"
    }
  }
}

#=========Public_IP=================

public_ips = {
  pip1 = {
    pip_name          = "testfrpip001"
    rg_name           = "test-jd-rg001"
    location          = "France Central"
    allocation_method = "Static"
    tags = {
      environment = "test"
      owner       = "jd"
    }
  }
}

#===========Virtual_Machine================

virtual_machines = {
  vm1 = {
    nic_name       = "testnic001"
    vm_name        = "testvm001"
    rg_name        = "test-jd-rg001"
    location       = "France Central"
    size           = "Standard_D2s_v3" #"Standard_F2"
    admin_username = "adminuser"
    admin_password = "Password@1234"
    subnet_name    = "test-jd-subnet001"
    vnet_name      = "test-jd-vnet001"
  }
}


#=============NSG========================


nsgs = {
  rule1 = {
    nsg_name = "testnsg001"
    location = "France Central"
    rg_name  = "test-jd-rg001"
    tags = {
      environment = "test"
      owner       = "jd"
    }
    nsg_rules = [
      {
        rule_name                  = "allow_http"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        rule_name                  = "allow-ssh"
        priority                   = 200
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
}

#===========NSG_Association=====================

nsg_associates = {
  associate1 = {
    nsg_name    = "testnsg001"
    rg_name     = "test-jd-rg001"
    subnet_name = "test-jd-subnet001"
    vnet_name   = "test-jd-vnet001"
  }
}

#=========Key_Vault==================

key_vaults = {
  kv1 = {
    kv_name  = "testkv001"
    location = "France Central"
    rg_name  = "test-jd-rg001"
  }
}

#==============KV_SECRET==============

kv_secret_data = {
  vm_user = {
    kv_sec_name  = "vm-username"
    kv_sec_value = "adminuser"
    kv_name      = "testkv001"
    rg_name      = "test-jd-rg001"
  }
  vm_pass = {
    kv_sec_name  = "vm-password"
    kv_sec_value = "P@ssw0rd@123"
    kv_name      = "testkv001"
    rg_name      = "test-jd-rg001"
  }
}


#=============SQL_Server==================

sql_servers = {
  server1 = {
    server_name                  = "testserver021"
    rg_name                      = "test-jd-rg001"
    location                     = "France Central"
    administrator_login          = "adminuser"
    administrator_login_password = "P@ssw0rd@12345"
    tags = {
      environment = "test"
      owner       = "jd"
    }
  }
}

#===========SQL_DATABASE==================

sql_database = {
  db1 = {
    db_name     = "testdb001"
    server_name = "testserver021"
    rg_name     = "test-jd-rg001"
    tags = {
      environment = "test"
      owner       = "jd"
    }
  }
}
