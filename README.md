# Script de instalação Manjaro

Este é um script de instalação para o sistema operacional Manjaro. Ele oferece duas opções: instalar todos os programas disponíveis no repositório ou instalar manualmente os programas desejados.

## Como usar

Para usar o script, execute o seguinte comando no terminal:


## Opções

O script oferece duas opções:

- **Instalar todos os programas disponíveis no repositório**: essa opção instalará todos os programas disponíveis no repositório oficial do Manjaro. Após a conclusão da instalação, o computador deve ser reiniciado para garantir que todos os programas funcionem corretamente.

- **Instalar manualmente os programas desejados**: essa opção permitirá que o usuário escolha manualmente quais programas deseja instalar. É possível instalar vários programas de uma só vez, digitando seus nomes separados por espaços. Após a conclusão da instalação, o computador deve ser reiniciado para garantir que todos os programas funcionem corretamente.

## Como funciona

O script começa verificando se o sistema está atualizado. Se não estiver, ele atualiza o sistema antes de continuar.

Em seguida, ele oferece as duas opções mencionadas acima. Se a opção escolhida for a de instalar todos os programas disponíveis no repositório, ele instalará o gerenciador de pacotes yay (se ainda não estiver instalado) e o pacote jq. Em seguida, ele fará o download e a execução de cada script de instalação dos programas disponíveis no repositório.

Se a opção escolhida for a de instalar manualmente os programas desejados, ele instalará o gerenciador de pacotes yay (se ainda não estiver instalado) e perguntará ao usuário quais programas deseja instalar.

Após a conclusão da instalação, o script recomenda que o computador seja reiniciado para garantir que todos os programas funcionem corretamente.

## Pré-requisitos

O script foi desenvolvido e testado no Manjaro Linux e requer o gerenciador de pacotes yay para funcionar corretamente. Se você ainda não tiver o yay instalado em seu sistema, ele será instalado automaticamente pelo script.

## Contribuindo

Se você encontrar algum erro ou tiver sugestões para melhorar o script, sinta-se à vontade para abrir uma issue ou enviar um pull request.

## Licença

Este script é distribuído sob a licença MIT.```
