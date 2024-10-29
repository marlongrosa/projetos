#!/bin/bash
# sudo wget -O- https://raw.githubusercontent.com/marlongrosa/projetos/main/installTV.sh | bash

# Parar o serviço do TeamViewer
sudo systemctl stop teamviewerd

# Remover e reconfigurar o machine-id
sudo rm -rf /etc/machine-id
sudo systemd-machine-id-setup

# Instalar novo TeamViewer
sudo apt update

# Baixa o TV
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb

# Instala o TV Baixado
sudo apt install ./teamviewer_amd64.deb

# Reinicia a maquina
sudo reboot
