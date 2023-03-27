#!/bin/bash

if yay -Q zoom >/dev/null 2>&1; then
    echo "Zoom já está instalado. Ignorando a instalação."
else
    echo "Instalando o Zoom..."
    yay -S --noconfirm zoom
fi
