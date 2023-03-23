#!/bin/bash
echo "Executando script master..."
echo "Verificando se o sistema está atualizado..."
if ! sudo pacman -Syup &> /dev/null; then
echo "O sistema não está atualizado, atualizando agora..."
sudo pacman -Syyu --noconfirm -y
fi

# Instala o dialog se não estiver instalado
sudo pacman -S --needed dialog

# Exibe uma caixa de diálogo com uma lista de opções para o usuário selecionar
choices=$(dialog --title "Programas para instalar" --checklist \
  "Selecione os programas que deseja instalar:" 15 60 4 \
  "firefox" "Navegador da web" on \
  "vlc" "Reprodutor de mídia" off \
  "gimp" "Editor de imagem" off \
  "inkscape" "Editor de vetor" off \
  3>&1 1>&2 2>&3)

# Verifica se o usuário selecionou pelo menos um programa
if [ -n "$choices" ]; then
  # Baixa e executa os scripts de instalação dos programas selecionados
  for choice in $choices; do
    echo "Baixando o arquivo $choice-install.sh..."
    wget https://raw.githubusercontent.com/seu-usuario/seu-repositorio/master/$choice-install.sh
    echo "Executando o arquivo $choice-install.sh..."
    bash $choice-install.sh
  done
else
  echo "Nenhum programa selecionado. Saindo..."
fi
