#!/bin/bash

if pacman -Q google-chrome-stable >/dev/null 2>&1; then
  echo "Google Chrome já está instalado. Ignorando a instalação."
else
  echo "Baixando chave de autenticação do repositório do Google Chrome..."
  curl -sSL https://dl.google.com/linux/linux_signing_key.pub | sudo pacman-key --add -

  echo "Adicionando o repositório do Google Chrome ao Pacman..."
  echo -e "\n[google-chrome]\nSigLevel = Optional TrustAll\nServer = https://dl.google.com/linux/chrome/rpm/stable/x86_64\n" | sudo tee -a /etc/pacman.conf

  echo "Atualizando a lista de pacotes do Pacman..."
  sudo pacman -Sy

  echo "Instalando o Google Chrome..."
  sudo pacman -S --noconfirm google-chrome-stable

fi
