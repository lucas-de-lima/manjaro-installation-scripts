#!/bin/bash

set -e

# Função para instalar todos os programas disponíveis no repositório
install_all() {
  sudo pacman -Syu --noconfirm
  yay -Syu --noconfirm
  yay -S --noconfirm - < <(yay -Qeq | grep -v "$(pacman -Qmq)" | grep -v "$(pacman -Qgq base)" | sed 's|^.*\/||')
}

# Função para instalar manualmente os programas desejados
install_manual() {
  echo "Digite o nome dos programas que deseja instalar (separados por espaço): "
  read -r -a packages
  yay -S --noconfirm "${packages[@]}"
}

echo "Executando script master..."

# Verifica se o sistema está atualizado
sudo pacman -Syu --noconfirm

# Verifica se o Yay está instalado e, caso não esteja, realiza a instalação
if ! command -v yay &>/dev/null; then
  echo "Instalando o Yay..."
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
  cd ..
  rm -rf yay
else
  echo "Yay já está instalado. Ignorando a instalação."
fi

# Menu de opções
while true; do
  echo "Bem-vindo ao script de instalação do Manjaro! Escolha uma das opções abaixo:"
  echo "1 - Instalar todos os programas disponíveis no repositório"
  echo "2 - Instalar manualmente os programas desejados"
  read -p "Opção desejada: " option

  case $option in
  1)
    # Script para instalar todos os programas do repositório
    install_all
    break
    ;;
  2)
    # Script para instalar manualmente os programas desejados
    install_manual
    break
    ;;
  *)
    echo "Opção inválida"
    ;;
  esac
done

echo "Script de instalação finalizado!"
