terraform {
  required_version = ">=1.3"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "< 4.3"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }

  cloud {
    organization = "ksandbox"

    workspaces {
      name = "sandbox"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

provider "random" {}