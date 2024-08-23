#!/bin/bash

# Verifica se o Visual Studio Code (bin) já está instalado
if pacman -Qs visual-studio-code-bin >/dev/null 2>&1; then
    echo "Visual Studio Code já está instalado. Ignorando a instalação."
else
    echo "Instalando o Visual Studio Code..."
    yay -S --noconfirm visual-studio-code-bin
fi
