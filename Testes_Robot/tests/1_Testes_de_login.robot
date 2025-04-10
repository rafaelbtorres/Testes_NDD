*** Settings ***
Resource            ../resources/1_Testes_de_login.resource                    #Importação do arquivo de recursos referente ao teste

Test Teardown       Close Browser                                              #Configuração para fechar o navegador no fim de cada caso de teste

*** Test Cases ***
Fazer Login correto na Página
    Acessar Página do SauceDemo                                                #Chama a keyword que acessa a página do teste
    Fazer login com usuario e senha corretos                                   #Chama a keyword que faz o login correto na página e para na página de produtos

Fazer Login com usuario incorreto
    Acessar Página do SauceDemo                                                #Chama a keyword que acessa a página do teste
    Fazer login com usuario incorreto                                          #Chama a keyword que tenta fazer o login com o usuário incorreto, esperando uma mensagem de erro correta

Fazer Login com senha incorreta
    Acessar Página do SauceDemo                                                #Chama a keyword que acessa a página do teste
    Fazer login com senha incorreta                                            #Chama a keyword que tenta fazer o login com a senha incorreta, esperando uma mensagem de erro correta

Fazer Login com usuario bloqueado
    Acessar Página do SauceDemo                                                #Chama a keyword que acessa a página do teste
    Fazer login com usuario bloqueado                                          #Chama a keyword que tenta fazer o login com um usuário bloqueado, esperando uma mensagem de erro correta