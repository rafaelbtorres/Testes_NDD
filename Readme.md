Resolvi escrever os testes de duas formas, utilizando Robot Framework e Cypress.

############################################################################

Para executar os testes escritos em Robot siga os seguintes passos:

Instale o pyenv (https://github.com/pyenv/pyenv)
Install python version 3.11.2: pyenv install 3.11.2

Instale o poetry (https://python-poetry.org/)
install robotframework-browser dependencies:


Instale o node.js (https://nodejs.org/en/download)
Acesse a pasta onde estão os arquivos de teste e execute:
pyenv local 3.11.2
poetry config virtualenvs.in-project true
poetry install
poetry shepoetry shellll
rfbrowser init

Para rodar os testes:

adjust resources/common.resource (DUT username, passwords, IPv4 address)
Vá para o diretório onde estão os testes do robot
Ative python virtual environment com o comando: poetry shell

Para rodar todos os testes, execute o comando: robot -d reports/ -vGLOBAL_DEBUG_BROWSER:true .

##########################################################################

Para executar os testes escrutos em Cypress, siga os comandos:

npm install -g npm@11.3.0
npm install cypress --save-dev
npx cypress open