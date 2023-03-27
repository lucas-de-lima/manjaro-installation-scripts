#!/bin/bash

if yay -Q programa >/dev/null 2>&1; then
    echo "Visual Studio Code já está instalado. Ignorando a instalação."
else
    echo "Instalando o Visual Studio Code..."
    yay -S --noconfirm code
fi
