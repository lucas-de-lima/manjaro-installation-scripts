#!/bin/bash

if yay -Q mysql-workbench >/dev/null 2>&1; then
    echo "MySQL já está instalado. Ignorando a instalação."
else
    echo "Instalando o MySQL Workbench..."
    yay -S --noconfirm mysql-workbench
fi
