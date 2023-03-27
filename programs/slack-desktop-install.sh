#!/bin/bash

if yay -Q Slack >/dev/null 2>&1; then
    echo "slack-desktop já está instalado. Ignorando a instalação."
else
    echo "Adicionando o repositório do Slack ao yay..."
    echo -e "\n[slack]\nSigLevel = Optional TrustAll\nServer = https://pkg.tox.chat/archlinux\n" | sudo tee -a /etc/yay.conf

    echo "Atualizando a lista de pacotes do yay..."
    sudo yay -Sy

    echo "Instalando o Slack..."
    yay -S --noconfirm slack-desktop
fi
