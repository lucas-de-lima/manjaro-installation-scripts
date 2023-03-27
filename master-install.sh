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
    sudo yay -S --noconfirm $program
  done
}

function install_yay() {
  # Instalação do Yay
  if ! command -v yay &>/dev/null; then
    echo "Instalando o Yay..."
    sudo pacman -S yay --noconfirm
  else
    echo "Yay já está instalado. Ignorando a instalação."
  fi
}

# Prompt para o usuário escolher entre instalar tudo ou escolher manualmente
echo "Bem-vindo ao script de instalação do Manjaro! Escolha uma das opções abaixo:"
echo "1 - Instalar todos os programas disponíveis no repositório"
echo "2 - Instalar manualmente os programas desejados"

read -p "Escolha uma opção: " opcao
case $opcao in
1)
  install_yay
  echo "Instalando pacote jq..."
  sudo yay -S jq
  # Script para instalar todos os programas do repositório
  echo "Instalando todos os programas do repositório..."
  # criando o diretório para os scripts baixados
  mkdir -p scripts_temp

  # fazendo a requisição à API do GitHub para obter os nomes dos scripts
  raw_data=$(curl "https://api.github.com/repos/lucas-de-lima/manjaro-installation-scripts/contents/programs?ref=release")

  # extraindo os nomes dos scripts do objeto retornado pela API e salvando em uma lista
  scripts=($(echo "$raw_data" | grep -oE '"name": "[^"]+"' | cut -d'"' -f4))

  # fazendo o download e a execução de cada script
  for script in "${scripts[@]}"; do
    echo "Baixando e executando $script..."
    curl -sS "https://raw.githubusercontent.com/lucas-de-lima/manjaro-installation-scripts/release/programs/$script" -o "scripts_temp/$script"
    chmod +x "scripts_temp/$script"
    ./scripts_temp/$script
    rm "scripts_temp/$script"
  done

  # excluindo o diretório que foi criado
  rm -r scripts_temp
  echo "Removendo pacote jq..."
  yay -R jq
  echo "Reinicie o computador após a execução do script para garantir que todos os programa funcionaram corretamente"

  ;;
2)
  install_yay
  # Script para instalar manualmente os programas desejados
  install_manual
  echo "Reinicie o computador após a execução do script para garantir que todos os programa funcionaram corretamente"

  ;;
*)
  echo "Opção inválida"
  exit 1
  ;;
esac
