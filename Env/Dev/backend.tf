terraform {
  backend "azurerm" {
    resource_group_name  = "RG-IAC-EUS-01"
    storage_account_name = "vvhitstiac"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
