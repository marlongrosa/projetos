#!/bin/bash
# sudo wget -O- https://raw.githubusercontent.com/marlongrosa/projetos/main/installTV.sh | bash

# Parar o serviço do TeamViewer
systemctl stop teamviewerd

# Remover e reconfigurar o machine-id
sudo rm -rf /etc/machine-id && sudo systemd-machine-id-setup

# Aceitar automaticamente os termos do TeamViewer
teamviewer setup --accept-license

# Configurar o TeamViewer para iniciar junto com o sistema operacional
teamviewer --daemon enable

# Iniciar o serviço do TeamViewer
teamviewer --daemon start
