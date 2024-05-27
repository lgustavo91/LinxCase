# Terraform Azure Setup

Este repositório contém arquivos Terraform para configurar uma infraestrutura básica no Azure, incluindo um servidor web acessível publicamente.

## Pré-requisitos

- Terraform instalado: [Instruções de instalação](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- Conta no Azure
- Azure CLI instalado: `az login`
- Postman

## Como usar

1. Clone o seguinte repositório:
   https://github.com/lgustavo91/LinxCase.git

2. Execute o `az login` e se autentique no portal Azure.

2. Inicialize o diretório do Terraform:
    terraform init

3. Verifique o plano de execução:
    terraform plan

4. Aplique as mudanças para criar os recursos:
    terraform apply


## Diagrama da Arquitetura.

Infrasestrutura provisionada em Ambiente Azure, Utilizando Terraform para automatização.

![image](https://github.com/lgustavo91/LinxCase/assets/52268689/cdf27ff5-2b73-40b7-9af4-1984096637b8)



## Destrua os recursos (Caso necessário)
    terraform destroy -auto-approve

