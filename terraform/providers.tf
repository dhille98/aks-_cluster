terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.97.1"
    }
  }
# backend "azurerm" {
#   resource_group_name = "azdevopsdemo"
#   storage_account_name = "workshopstateatqt"
#   container_name = "workshop"
#   key = "nop.terraform.tfstate"
#
#   
}


provider "azurerm" {
  features {
    
  }
}