# Provisionamento Automatizado de Servidor Web (IaC)

Este repositório contém um script de **Infraestrutura como Código (IaC)** desenvolvido em Shell Script para automatizar o provisionamento de um servidor web Linux e o deploy de uma aplicação estática.

## 🚀 Sobre o Projeto

O objetivo deste script é eliminar a configuração manual de servidores, garantindo que o ambiente seja configurado de forma rápida, padronizada e reproduzível. Ele foi projetado para ser utilizado como **User Data** na AWS ou **Startup Script** no Google Cloud Platform (GCP).

### ⚙️ Funcionalidades

- **Atualização do Sistema:** Garante que o SO (baseado em Debian/Ubuntu) esteja com os pacotes mais recentes.
- **Instalação de Dependências:** Instalação automatizada do servidor web Apache2 e utilitários.
- **Deploy da Aplicação:** Download e extração automática dos artefatos da aplicação "Start Aprovação" diretamente do GitHub.
- **Idempotência:** O script prepara o ambiente limpando arquivos temporários e diretórios antigos antes do deploy, evitando conflitos em execuções subsequentes.
- **Logging:** Feedback visual colorido para monitoramento da execução no terminal.

## 🛠️ Tecnologias Utilizadas

- **Linguagem:** Bash / Shell Script
- **Servidor Web:** Apache HTTP Server
- **OS:** Linux (Ubuntu/Debian)
- **Conceito:** Infrastructure as Code (IaC)

## 📋 Como Executar

1.  Clone este repositório ou baixe o script no servidor de destino.
2.  Dê permissão de execução:
    ```bash
    chmod +x script-iac.sh
    ```
3.  Execute o script como root (sudo):
    ```bash
    sudo ./script-iac.sh
    ```

---

_Desenvolvido por Luis Fernando | DevOps & Cloud Engineer_
