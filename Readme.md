
# Testes_NDD

Resolvi escrever os testes de duas formas, utilizando Robot Framework e Cypress.


## Como rodar os testes escritos em Cypress
Para executar os testes escrutos em Cypress, siga os comandos:

npm install -g npm@11.3.0

npm install cypress --save-dev

npx cypress open



## Como rodar os testes escritos em Robot

Para executar os testes escritos em Robot siga os seguintes passos:

Instale o pyenv (https://github.com/pyenv/pyenv)

Instale o Python: pyenv install 3.11.2

Instale o poetry (https://python-poetry.org/)

Instale o node.js (https://nodejs.org/en/download)

Acesse a pasta onde estão os arquivos de teste e execute:

pyenv local 3.11.2

poetry config virtualenvs.in-project true

poetry install

poetry shepoetry shell

rfbrowser init

Para rodar os testes:

Vá para o diretório onde estão os testes do robot

Ative o "python virtual environment" com o comando: 

poetry shell

Para rodar todos os testes, execute o comando: 

robot -d reports/ -vGLOBAL_DEBUG_BROWSER:true .

## Minhas considerações
Mesmo tendo mais familiaridade com o Robot, achei muito mais fácil e rápido escrever testes em Cypress, além de ser mais simples de preparar o ambiente.

Porém, me pareceu que o Cypress tem uma certa limitação com o que pode ser feito em relação a testes avançados, coisas que no Robot seria mais simples de criar.