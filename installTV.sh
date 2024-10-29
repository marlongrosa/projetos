#!/bin/bash
# sudo wget -O- https://raw.githubusercontent.com/marlongrosa/projetos/main/installTV.sh | bash

# Parar o serviço do TeamViewer
echo "Parando o serviço do TeamViewer..."
sudo systemctl stop teamviewerd

# Remover o machine-id e configurá-lo novamente
echo "Removendo o machine-id e recriando-o..."
sudo rm -f /etc/machine-id
sudo systemd-machine-id-setup

# Remover arquivos de configuração específicos do TeamViewer
echo "Limpando configurações antigas do TeamViewer..."
sudo rm -rf /var/lib/teamviewer/config/global.conf
sudo rm -rf /var/lib/teamviewer/config/client.conf
sudo rm -rf ~/.config/teamviewer
sudo rm -rf /etc/teamviewer

# Remover e recriar o UUID do D-Bus, que também influencia o ID do TeamViewer
echo "Regenerando o UUID do D-Bus..."
sudo rm -rf /var/lib/dbus/machine-id
sudo dbus-uuidgen --ensure=/var/lib/dbus/machine-id

# Atualizar lista de pacotes
echo "Atualizando a lista de pacotes..."
sudo apt update

# Baixar e instalar o TeamViewer
echo "Baixando e instalando a versão mais recente do TeamViewer..."
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb -O /tmp/teamviewer_amd64.deb
sudo apt install -y /tmp/teamviewer_amd64.deb

# Remover o pacote baixado
rm /tmp/teamviewer_amd64.deb

# Reiniciar o sistema
echo "Reiniciando o sistema para aplicar mudanças..."
sudo reboot
