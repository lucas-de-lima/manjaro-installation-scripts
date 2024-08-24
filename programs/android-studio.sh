#!/bin/bash

# Diretório de destino para a instalação do Android Studio
INSTALL_DIR="/opt/android-studio-2024.1.1.13"

# Verifica se o Android Studio já está instalado
if [ -d "$INSTALL_DIR" ]; then
    echo "Android Studio já está instalado em $INSTALL_DIR. Ignorando a instalação."
else
    echo "Baixando o Android Studio..."
    wget -q https://dl.google.com/dl/android/studio/ide-zips/2024.1.1.13/android-studio-2024.1.1.13-linux.tar.gz -O /tmp/android-studio-2024.1.1.13-linux.tar.gz

    echo "Extraindo o Android Studio..."
    sudo tar -xzf /tmp/android-studio-2024.1.1.13-linux.tar.gz -C /opt/

    echo "Removendo o arquivo .tar.gz..."
    rm /tmp/android-studio-2024.1.1.13-linux.tar.gz

    echo "Criando link simbólico para facilitar o acesso..."
    sudo ln -sf "$INSTALL_DIR/bin/studio.sh" /usr/local/bin/android-studio

    echo "Android Studio instalado com sucesso!"
    echo "Você pode iniciar o Android Studio usando o comando 'android-studio'."
fi
