#!/bin/bash

if yay -Q google-chrome-stable >/dev/null 2>&1; then
  echo "Google Chrome já está instalado. Ignorando a instalação."
else
  echo "Baixando chave de autenticação do repositório do Google Chrome..."
  curl -sSL https://dl.google.com/linux/linux_signing_key.pub | sudo yay-key --add -

  echo "Adicionando o repositório do Google Chrome ao yay..."
  echo -e "\n[google-chrome]\nSigLevel = Optional TrustAll\nServer = https://dl.google.com/linux/chrome/rpm/stable/x86_64\n" | sudo tee -a /etc/yay.conf

  echo "Atualizando a lista de pacotes do yay..."
  sudo yay -Sy

  echo "Instalando o Google Chrome..."
  sudo yay -S --noconfirm google-chrome-stable

fi
