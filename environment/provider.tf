terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.52.0"
    }
  }
  # backend "azurerm" {
  # resource_group_name  = "bkddevrg001"
  # storage_account_name = "bkdstgjd001"
  # container_name       = "tfstate"
  # key                  = "dev.tfstate"
  # }
}


provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
  subscription_id = "711f9f70-1892-49fb-a04f-5bf2c5a89677"
}
