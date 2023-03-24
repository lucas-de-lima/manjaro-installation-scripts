#!/bin/bash

if pacman -Q nvm >/dev/null 2>&1; then
    echo "NVM já está instalado. Ignorando a instalação."
else
    echo "Instalando o NVM..."
    sudo pacman -S --noconfirm nvm

    echo "Configurando o NVM..."
    echo 'source /usr/share/nvm/init-nvm.sh' >>~/.zshrc
    echo 'source /usr/share/nvm/init-nvm.sh' >>~/.bashrc
    source ~/.zshrc
    source ~/.bashrc

    echo "Definindo a versão 16 como padrão..."
    nvm install 16
    nvm use 16 --default
fi
