#!/bin/bash

if yay -Q zoom >/dev/null 2>&1; then
    echo "Zoom já está instalado. Ignorando a instalação."
else
    echo "Adicionando o repositório do Zoom ao yay..."
    echo -e "\n[zoom]\nSigLevel = Optional TrustAll\nServer = https://zoom.us/client/latest/arch\n" | sudo tee -a /etc/yay.conf

    echo "Atualizando a lista de pacotes do yay..."
    sudo yay -Sy

    echo "Instalando o Zoom..."
    sudo yay -S --noconfirm zoom

fi
