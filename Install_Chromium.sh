#!/bin/bash
# sudo wget -O- https://raw.githubusercontent.com/marlongrosa/projetos/main/installTV.sh | bash

systemctl stop teamviewerd
sudo rm -rf /etc/machine-id && sudo systemd-machine-id-setup
teamviewer --daemon start
exit
teamviewer
