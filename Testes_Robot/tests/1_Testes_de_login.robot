*** Settings ***
Resource            ../resources/1_Testes_de_login.resource                    #Importação do arquivo de recursos referente ao teste

Test Teardown       Close Browser                                              #Configuração para fechar o navegador no fim de cada caso de teste

*** Test Cases ***
Fazer Login correto na Página
    Acessar Página do SauceDemo
    Fazer login com usuario e senha corretos

Fazer Login com usuario incorreto
    Acessar Página do SauceDemo
    Fazer login com usuario incorreto

Fazer Login com senha incorreta
    Acessar Página do SauceDemo
    Fazer login com senha incorreta

Fazer Login com usuario bloqueado
    Acessar Página do SauceDemo
    Fazer login com usuario bloqueado