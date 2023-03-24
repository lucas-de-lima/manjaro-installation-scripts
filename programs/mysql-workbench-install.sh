#!/bin/bash

if pacman -Q mysql-workbench >/dev/null 2>&1; then
    echo "MySQL já está instalado. Ignorando a instalação."
else
    echo "Instalando o MySQL Workbench..."
    sudo pacman -S --noconfirm mysql-workbench
fi
