if yay -Q docker >/dev/null 2>&1; then
  echo "Docker já está instalado. Ignorando a instalação."
else
  echo "Instalando o Docker..."
  sudo yay -S --noconfirm docker

  echo "Iniciando o serviço do Docker..."
  sudo systemctl start docker.service
  sudo systemctl enable docker.service

  # Adiciona o usuário atual ao grupo docker
  sudo usermod -aG docker $USER
fi
