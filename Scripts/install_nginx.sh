#!/bin/bash

while [ -z "$(terraform output public_ip_address)" ]; do
    echo "Aguardando a atribuição do endereço IP público..."
    sleep 10
done

PUBLIC_IP=$(terraform output public_ip_address)
ssh adminuser@$PUBLIC_IP 'sudo usermod -aG sudo adminuser && sudo apt-get update && sudo apt-get install -y nginx && sudo systemctl enable nginx && sudo systemctl start nginx'