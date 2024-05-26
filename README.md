# Terraform Azure Setup

Este repositório contém arquivos Terraform para configurar uma infraestrutura básica no Azure, incluindo um servidor web acessível publicamente.

## Pré-requisitos

- Terraform instalado: [Instruções de instalação](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- Conta no Azure
- Azure CLI configurado: `az login`

## Como usar

1. Clone o repositório:
   git clone https://github.com/seu-usuario/terraform-azure-setup.git
   cd terraform-azure-setup

2. Inicialize o diretório do Terraform:
    terraform init

3. Verifique o plano de execução:
    terraform plan

4. Aplique as mudanças para criar os recursos:
    terraform apply

5. 

6. Destrua os recursos (Caso necessário)
    terraform destroy -auto-approve
