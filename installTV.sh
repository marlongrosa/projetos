#!/bin/bash
# sudo wget -O- https://raw.githubusercontent.com/marlongrosa/projetos/main/installTV.sh | bash

#!/bin/bash

# Parar o serviço do TeamViewer
sudo systemctl stop teamviewerd

# Remover e reconfigurar o machine-id
sudo rm -rf /etc/machine-id
sudo systemd-machine-id-setup

# Aceitar automaticamente os termos do TeamViewer
sudo teamviewer --daemon stop
sudo teamviewer --accept-license

# Configurar o TeamViewer para iniciar junto com o sistema operacional
sudo systemctl enable teamviewerd

# Iniciar o serviço do TeamViewer
sudo systemctl start teamviewerd
