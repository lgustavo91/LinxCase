provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-vnet"
  address_space       = [var.vnet_address_space]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "${var.prefix}-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_address_prefix]
}

resource "azurerm_public_ip" "pip" {
  name                = "${var.prefix}-pip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "nic" {
  name                = "${var.prefix}-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "${var.prefix}-vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = var.vm_size
  admin_username      = "adminuser"
  admin_password      = var.admin_password
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  tags = var.tags
}

resource "null_resource" "transfer_install_script" {
  provisioner "file" {
    source      = "${path.module}/install_nginx.sh"  # Caminho local do script no seu computador
    destination = "/tmp/install_nginx.sh"            # Caminho de destino na VM
    connection {
      type     = "ssh"
      host     = azurerm_public_ip.pip.ip_address    # Substitua pelo endereço IP público da sua VM
      user     = var.admin_username                  # Substitua pela variável que armazena o nome de usuário
      password = var.admin_password                  # Substitua pela variável que armazena a senha do usuário
    }
  }
}

resource "null_resource" "install_nginx" {
  depends_on = [null_resource.transfer_install_script]

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      host     = azurerm_public_ip.pip.ip_address  # Substitua pelo endereço IP público da sua VM
      user     = var.admin_username                # Substitua pela variável que armazena o nome de usuário
      password = var.admin_password                # Substitua pela variável que armazena a senha do usuário
    }

    inline = [
      "chmod +x /tmp/install_nginx.sh",  # Adiciona permissão de execução ao script
      "/tmp/install_nginx.sh"            # Executa o script
    ]
  }
}

