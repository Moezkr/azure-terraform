terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.12.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

resource "azurerm_resource_group" "goldstack_rg" {
  name     = "goldpaster-rg"
  location = "West Europe"
}

resource "azurerm_app_service_plan" "webapp_plan" {
  name                = "webapp-plan"
  location            = azurerm_resource_group.webstack_rg.location
  resource_group_name = azurerm_resource_group.webstack_rg.name

  sku {
    tier = "Standard"
    size = "S1"
  }

  kind     = "Linux"
  reserved = true
}

resource "azurerm_app_service" "web_app" {
  name                = "web-app"
  location            = azurerm_resource_group.webapp_rg.location
  resource_group_name = azurerm_resource_group.webapp_rg.name
  app_service_plan_id = azurerm_app_service_plan.webapp_plan.id

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "WEBSITES_PORT"                       = "5000"
    "FLASK_APP"                           = "app.py"
  }

  site_config {
    linux_fx_version = "PYTHON|3.9"
  }

  https_only = true
}

resource "azurerm_app_service_source_control" "webapp_code" {
  app_id                  = azurerm_app_service.webapp_app.id
  repo_url                = "https://github.com/Moezkr/azure-terraform.git"
  branch                  = "main"
  use_manual_integration  = true
}
