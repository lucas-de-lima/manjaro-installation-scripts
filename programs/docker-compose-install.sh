#!/bin/bash

if pacman -Q docker-compose >/dev/null 2>&1; then
    echo "Docker Compose já está instalado. Ignorando a instalação."
else
    echo "Instalando o Docker Compose..."
    sudo pacman -S --noconfirm docker-compose
fi
