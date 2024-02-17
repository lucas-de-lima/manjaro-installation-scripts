#!/bin/bash

if yay -Q google-chrome >/dev/null 2>&1; then
  echo "Google Chrome já está instalado. Ignorando a instalação."
else

  echo "Instalando o Google Chrome..."
  yay -S --noconfirm google-chrome

fi
