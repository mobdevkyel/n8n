la#!/bin/bash
# Instalador do N8N em Docker
# Autor: Autotic
# Versao: 0.1

#!/bin/bash

# Atualiza os pacotes disponíveis nos repositórios
sudo apt -y update

# Atualiza todos os pacotes instalados para suas versões mais recentes
sudo apt -y upgrade

# Instala o Docker
sudo apt install -y docker.io

# Define o fuso horário do sistema para America/Sao_Paulo
sudo timedatectl set-timezone America/Sao_Paulo

# Executa o contêiner do N8N com Docker
sudo docker run -d --restart unless-stopped --name n8n_sheila -p 5678:5678 -v ~/.n8n:/home/node/.n8n n8nio/n8n

# Inicia o N8N com o recurso de tunelamento
sudo docker exec -it n8n n8n start --tunnel

# Obtém o endereço IP do servidor
host=$(sudo hostname -I | head -n1 | cut -d " " -f1)

# Limpa a tela do terminal
clear

# Exibe a mensagem de sucesso e a URL de acesso ao N8N
echo "N8N INSTALADO COM SUCESSO!"
echo "Acesse a URL: http://${host}:5678"


# curl -sSL https://raw.githubusercontent.com/mobdevkyel/n8n/main/n8n.sh | bash
# curl -sSL https://autotic.com.br/setup-n8n-docker.sh | bash
# wget -O install.sh http://www.aapanel.com/script/install-ubuntu_6.0_en.sh && sudo bash install.sh aapanel

