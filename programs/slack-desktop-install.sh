#!/bin/bash

if pacman -Q Slack >/dev/null 2>&1; then
    echo "slack-desktop já está instalado. Ignorando a instalação."
else
    echo "Adicionando o repositório do Slack ao Pacman..."
    echo -e "\n[slack]\nSigLevel = Optional TrustAll\nServer = https://pkg.tox.chat/archlinux\n" | sudo tee -a /etc/pacman.conf

    echo "Atualizando a lista de pacotes do Pacman..."
    sudo pacman -Sy

    echo "Instalando o Slack..."
    sudo pacman -S --noconfirm slack-desktop
fi
