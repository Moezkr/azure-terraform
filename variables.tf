variable "deployment_location" {
  description = "Azure region where resources will be deployed"
  default     = "West Europe"
}

variable "resource_group" {
  description = "Azure Resource Group name"
  default     = "goldpaster-resource-group"
}

variable "app_service_plan" {
  description = "Name of the Azure App Service Plan"
  default     = "goldpaster-appservice-plan"
}

variable "azure_subscription_id" {
  description = "Azure Subscription ID for authentication"
}

variable "azure_client_id" {
  description = "Azure Service Principal Client ID"
}

variable "azure_client_secret" {
  description = "Azure Service Principal Client Secret"
  sensitive   = true
}

variable "azure_tenant_id" {
  description = "Azure Tenant ID"
}
