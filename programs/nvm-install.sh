#!/bin/bash

if yay -Q nvm >/dev/null 2>&1; then
    echo "NVM já está instalado. Ignorando a instalação."
else
    echo "Instalando o NVM..."
    yay -S --noconfirm nvm

    echo "Configurando o NVM..."
    echo 'source /usr/share/nvm/init-nvm.sh' >>~/.zshrc
    echo 'source /usr/share/nvm/init-nvm.sh' >>~/.bashrc
    source ~/.zshrc
    source ~/.bashrc

    echo "Definindo a versão 20 como padrão..."
    nvm install 20
    nvm use 20 --default
fi
