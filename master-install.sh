#!/bin/bash

echo "Executando script master..."
echo "Verificando se o sistema está atualizado..."
if ! sudo pacman -Syup &>/dev/null; then
  echo "O sistema não está atualizado, atualizando agora..."
  sudo pacman -Syyu --noconfirm -y
fi

# Função para instalar o Yay
function install_yay() {
  # Instalação do Yay
  if ! command -v yay &>/dev/null; then
    echo "Instalando o Yay..."
    sudo pacman -S yay --noconfirm
  else
    echo "Yay já está instalado. Ignorando a instalação."
  fi
}

install_yay

echo "Instalando pacote jq..."
sudo yay -S jq --noconfirm

# Script para instalar todos os programas do repositório
echo "Instalando todos os programas do repositório..."

# criando o diretório para os scripts baixados
mkdir -p scripts_temp

# fazendo a requisição à API do GitHub para obter os nomes dos scripts
raw_data=$(curl "https://api.github.com/repos/lucas-de-lima/manjaro-installation-scripts/contents/programs?ref=main")

# extraindo os nomes dos scripts do objeto retornado pela API e salvando em uma lista
scripts=($(echo "$raw_data" | grep -oE '"name": "[^"]+"' | cut -d'"' -f4))

# fazendo o download e a execução de cada script
for script in "${scripts[@]}"; do
  echo "Baixando e executando $script..."
  curl -sS "https://raw.githubusercontent.com/lucas-de-lima/manjaro-installation-scripts/main/programs/$script" -o "scripts_temp/$script"
  chmod +x "scripts_temp/$script"
  ./scripts_temp/$script
  rm "scripts_temp/$script"
done

# excluindo o diretório que foi criado
rm -r scripts_temp
echo "Removendo pacote jq..."
yay -R jq --noconfirm
echo "Reinicie o computador após a execução do script para garantir que todos os programa funcionaram corretamente"
