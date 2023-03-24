#!/bin/bash
echo "Instalando o Docker..."
sudo pacman -S --noconfirm docker

echo "Iniciando o serviço do Docker..."
sudo systemctl start docker.service
sudo systemctl enable docker.service
# Adiciona o usuário atual ao grupo docker
echo "Adicionando o usuário atual ao grupo docker"
sudo usermod -aG docker $USER