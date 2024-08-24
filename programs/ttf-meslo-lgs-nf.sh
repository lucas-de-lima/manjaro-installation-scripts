#!/bin/bash

# Verifica se a fonte MesloLGS NF já está instalada
if fc-list | grep -qi "MesloLGS NF"; then
    echo "A fonte MesloLGS NF já está instalada. Ignorando a instalação."
else
    echo "Instalando a fonte MesloLGS NF (ttf-meslo-nerd-font-powerlevel10k)..."
    sudo pacman -S --noconfirm ttf-meslo-nerd-font-powerlevel10k
fi

# Instruções para configurar o VS Code
echo "Configuração do VS Code:"
echo "1. Abra o VS Code."
echo "2. Vá para: File > Preferences > Settings."
echo "3. Pesquise por 'Font Family' e configure o valor para 'MesloLGS NF'."
echo "4. Reinicie o terminal integrado no VS Code para aplicar a nova fonte."

echo "Instalação concluída!"