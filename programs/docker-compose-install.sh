#!/bin/bash

if yay -Q docker-compose >/dev/null 2>&1; then
    echo "Docker Compose já está instalado. Ignorando a instalação."
else
    echo "Instalando o Docker Compose..."
    yay -S --noconfirm docker-compose
fi
