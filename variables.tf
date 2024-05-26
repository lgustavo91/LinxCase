variable "prefix" {
  description = "Prefix for resource naming"
  default     = "linxcase"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  default     = "linxcase"
}

variable "location" {
  description = "Azure region to deploy resources"
  default     = "East US"
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  default     = "10.0.0.0/16"
}

variable "subnet_address_prefix" {
  description = "Address prefix for the subnet"
  default     = "10.0.1.0/24"
}

variable "admin_username" {
  description = "Admin username for the VM"
  default     = "adminuser"
}

variable "admin_password" {
  description = "Admin password for the VM"
  default     = "AdminPassword123!"
  sensitive   = true
}

variable "vm_size" {
  description = "Size of the virtual machine"
  default     = "Standard_DS1_v2"
}

variable "image_publisher" {
  description = "Publisher of the VM image"
  default     = "Canonical"
}

variable "image_offer" {
  description = "Offer of the VM image"
  default     = "UbuntuServer"
}

variable "image_sku" {
  description = "SKU of the VM image"
  default     = "18.04-LTS"
}

variable "image_version" {
  description = "Version of the VM image"
  default     = "latest"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {
    environment = "Terraform"
  }
}
