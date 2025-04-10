*** Settings ***
Resource            ../resources/1_Testes_de_login.resource                                    #Importação do arquivo de recursos referente a keyword de login
Resource            ../resources/2_Testes_de_reordenacao_de_produtos.resource                  #Importação do arquivo de recursos referente ao teste


Test Teardown       Close Browser                                                              #Configuração para fechar o navegador no fim de cada caso de teste

*** Test Cases ***
Acessar pagina de produtos
    Acessar Página do SauceDemo
    Fazer login com usuario e senha corretos
    Validar se os produtos estao sendo listados corretamente


Reoganizar os produtos de A a Z
    Acessar Página do SauceDemo
    Fazer login com usuario e senha corretos
    Reoganizar os produtos de A a Z


Reorganizar os produtos de Z a A
    Acessar Página do SauceDemo
    Fazer login com usuario e senha corretos
    Reoganizar os produtos de Z a A