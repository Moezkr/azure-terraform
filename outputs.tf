output "app_service_default_site_hostname" {
  value = azurerm_app_service.web_app.default_site_hostname
}


output "web_app_url" {
  value = "https://${azurerm_app_service.web_app.default_site_hostname}"
}
