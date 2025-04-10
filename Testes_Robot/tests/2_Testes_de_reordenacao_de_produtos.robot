*** Settings ***
Resource            ../resources/1_Testes_de_login.resource                                    #Importação do arquivo de recursos referente a keyword de login
Resource            ../resources/2_Testes_de_reordenacao_de_produtos.resource                  #Importação do arquivo de recursos referente ao teste


Test Teardown       Close Browser                                                              #Configuração para fechar o navegador no fim de cada caso de teste

*** Test Cases ***
Acessar pagina de produtos
    Acessar Página do SauceDemo
    Validar se os produtos estao sendo listados corretamente
