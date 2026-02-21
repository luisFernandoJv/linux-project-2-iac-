#!/bin/bash

# ==============================================================================
# Script de Provisionamento de Servidor Web (Apache)
# Autor: Luis Fernando Alexandre dos Santos
# Descrição: Atualiza o sistema, instala o Apache e faz o deploy da aplicação
# ==============================================================================

# 1. Definição de Variáveis (Boas práticas para manutenção)
REPO_URL="https://github.com/luisFernandoJv/p-gina-divulga-o-Start-Aprova-o/archive/refs/heads/main.zip"
DIR_TEMP="/tmp/projeto-iac"
DIR_APACHE="/var/www/html"
PACOTES="apache2 unzip"

# 2. Cores para feedback visual (Melhora a experiência de quem executa)
VERDE='\033[0;32m'
NC='\033[0m' # Sem cor

echo -e "${VERDE}[INFO] Iniciando o provisionamento do servidor...${NC}"

# 3. Verificação de usuário root (Segurança básica)
if [ "$EUID" -ne 0 ]; then
  echo "Por favor, execute como root (sudo)."
  exit 1
fi

echo -e "${VERDE}[INFO] Atualizando o sistema e instalando dependências...${NC}"
# O parâmetro -y assume "sim" para tudo, evitando interrupção do script
apt-get update -y > /dev/null 2>&1
apt-get upgrade -y > /dev/null 2>&1
apt-get install $PACOTES -y > /dev/null 2>&1

echo -e "${VERDE}[INFO] Baixando e configurando a aplicação...${NC}"

# 4. Garante que o ambiente está limpo antes de começar (Idempotência)
rm -rf $DIR_TEMP
mkdir -p $DIR_TEMP

# Entra no diretório temporário
cd $DIR_TEMP

# Baixa o arquivo silenciosamente (-q)
wget -q $REPO_URL -O main.zip
unzip -q main.zip

# 5. Deploy: Move os arquivos para o local correto
echo -e "${VERDE}[INFO] Copiando arquivos para o diretório Web...${NC}"
# Limpa o diretório padrão do apache para evitar conflitos
rm -rf $DIR_APACHE/*
# Copia o conteúdo da pasta descompactada (independente do nome dela) para o Apache
cp -R */* $DIR_APACHE/

# 6. Limpeza e Reinício de Serviço
echo -e "${VERDE}[INFO] Limpando arquivos temporários e reiniciando serviço...${NC}"
rm -rf $DIR_TEMP
systemctl enable apache2
systemctl restart apache2

echo -e "${VERDE}[SUCESSO] Provisionamento finalizado! O site está no ar.${NC}"