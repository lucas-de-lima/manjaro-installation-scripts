#!/bin/bash
echo "Adicionando o repositório do Zoom ao Pacman..."
echo -e "\n[zoom]\nSigLevel = Optional TrustAll\nServer = https://zoom.us/client/latest/arch\n" | sudo tee -a /etc/pacman.conf

echo "Atualizando a lista de pacotes do Pacman..."
sudo pacman -Sy

echo "Instalando o Zoom..."
sudo pacman -S --noconfirm zoom
