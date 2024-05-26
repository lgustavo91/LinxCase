output "admin_username" {
  value = var.admin_username
}

output "public_ip_address" {
  value = azurerm_public_ip.pip.ip_address
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.vm.name
}
