terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.7.0"
    }
  }

  # Update this block with the location of your terraform state file
  backend "azurerm" {
    resource_group_name  = "rg-terraform-github-actions-state"
    storage_account_name = "aadeshterraform"
    container_name       = "tfstate"
    key                  = "DYN1SFSa4OTxier7HKJIgGyNYaMbtvzcP42KwFayB32Lcgg4XA9mJr1cZLqugFO3SaeLn8rF/c4w+AStQdHWjA=="
    use_oidc             = true
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}

# Define any Azure resources to be created here. A simple resource group is shown here as a minimal example.
resource "azurerm_resource_group" "rg-aks" {
  name     = var.resource_group_name
  location = var.location
}
