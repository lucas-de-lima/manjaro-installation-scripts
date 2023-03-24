#!/bin/bash
echo "Executando script master..."
echo "Verificando se o sistema está atualizado..."
if ! sudo pacman -Syup &>/dev/null; then
  echo "O sistema não está atualizado, atualizando agora..."
  sudo pacman -Syu --noconfirm -y
fi

# Função para instalar programas manualmente
function install_manual() {
  echo "Digite o nome dos programas que deseja instalar separados por espaço:"
  read programs
  for program in $programs; do
    echo "Instalando $program..."
    sudo pacman -S --noconfirm $program
  done
}

# Instalação do Yay
if ! command -v yay &>/dev/null; then
  echo "Instalando o Yay..."
  sudo pacman -Syu --noconfirm git base-devel
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
  cd ..
  rm -rf yay
else
  echo "Yay já está instalado. Ignorando a instalação."
fi

# Função para instalar todos os programas do repositório
function install_all() {
  # Mensagem para informar que todos os programas do repositório serão instalados
  echo "Instalando todos os programas do repositório..."

  # URL do repositório onde os arquivos .sh estão hospedados
  repo_url="https://raw.githubusercontent.com/lucas-de-lima/manjaro-installation-scripts/main/programs/"

  # Loop para percorrer todos os arquivos .sh no repositório
  for file in $(curl -sSL $repo_url); do
    # Mensagem para informar qual programa está sendo instalado
    echo "Instalando $file..."

    # Comando para baixar e executar o arquivo .sh correspondente ao programa
    curl -sSL $repo_url$file | bash
  done
}

# Verifica se o usuário deseja instalar programas manualmente ou todos do repositório
if [[ $1 == "manual" ]]; then
  install_manual
else
  # Prompt para o usuário escolher entre instalar tudo ou escolher manualmente
  echo "Bem-vindo ao script de instalação do Manjaro! Escolha uma das opções abaixo:"
  echo "1 - Instalar todos os programas disponíveis no repositório"
  echo "2 - Instalar manualmente os programas desejados"

  read -p "Opção desejada: " && case $REPLY in
  1)
    # Script para instalar todos os programas do repositório
    install_all
    ;;
  2)
    # Script para instalar manualmente os programas desejados
    install_manual
    ;;
  *)
    echo "Opção inválida"
    exit 1
    ;;
  esac

fi
