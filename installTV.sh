#!/bin/bash
# sudo wget -O- https://raw.githubusercontent.com/marlongrosa/projetos/main/installTV.sh | bash

# Parar o serviço do TeamViewer
sudo systemctl stop teamviewerd

# Parar o serviço do AnyDesk
sudo systemctl stop anydesk

# Remover e reconfigurar o machine-id
sudo rm -rf /etc/machine-id
sudo systemd-machine-id-setup

# Remover o ID do AnyDesk
sudo rm -rf /var/lib/anydesk/service.conf
sudo rm -rf /etc/anydesk/service.conf

# Aceitar automaticamente os termos do TeamViewer
sudo apt install teamviewer
sudo teamviewer --daemon start
sudo teamviewer --accept-license

# Configurar o TeamViewer para iniciar junto com o sistema operacional
sudo systemctl enable teamviewerd

# Configurar o AnyDesk para iniciar junto com o sistema operacional
sudo systemctl enable anydesk

# Iniciar o serviço do TeamViewer
sudo systemctl start teamviewerd

# Iniciar o serviço do AnyDesk
sudo systemctl start anydesk
