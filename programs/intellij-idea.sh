#!/bin/bash

# Diretório de destino para a instalação do IntelliJ IDEA
INSTALL_DIR="/opt/ideaIC-2024.2.0.2"

# Verifica se o IntelliJ IDEA já está instalado
if [ -d "$INSTALL_DIR" ]; then
    echo "IntelliJ IDEA já está instalado em $INSTALL_DIR. Ignorando a instalação."
else
    echo "Baixando o IntelliJ IDEA..."
    wget -q https://download.jetbrains.com/idea/ideaIC-2024.2.0.2.tar.gz -O /tmp/ideaIC-2024.2.0.2.tar.gz

    echo "Extraindo o IntelliJ IDEA..."
    sudo tar -xzf /tmp/ideaIC-2024.2.0.2.tar.gz -C /opt/

    echo "Removendo o arquivo .tar.gz..."
    rm /tmp/ideaIC-2024.2.0.2.tar.gz

    echo "Criando link simbólico para facilitar o acesso..."
    sudo ln -sf "$INSTALL_DIR/bin/idea.sh" /usr/local/bin/intellij

    echo "IntelliJ IDEA instalado com sucesso!"
    echo "Você pode iniciar o IntelliJ IDEA usando o comando 'intellij'."
fi
