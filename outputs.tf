output "public_ip_address" {
  description = "The public IP address of the Load Balancer"
  value       = azurerm_public_ip.pip.ip_address
}

output "admin_username" {
  description = "The admin username for the VM"
  value       = var.admin_username
}
