terraform {
  required_version = ">=1.0"

  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "~>2.1"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.13"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.6"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.12.1"
    }
  }
}

provider "azurerm" {
  features {}
}