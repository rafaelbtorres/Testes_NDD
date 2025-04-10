*** Settings ***
Resource            ../resources/1_Testes_de_login.resource                                    #Importação do arquivo de recursos referente a keyword de login
Resource            ../resources/3_Testes_de_adicao_de_produtos_no_carrinho.resource           #Importação do arquivo de recursos referente ao teste


Test Teardown       Close Browser                                                              #Configuração para fechar o navegador no fim de cada caso de teste


*** Test Cases ***
Validar se o produto é adicionado ao carrinho
    Acessar Página do SauceDemo
    Fazer login com usuario e senha corretos
    Validar se o produto é adicionado ao carrinho


Validar se o produto e a quantidade correta foram adicionados ao carrinho
    Acessar Página do SauceDemo
    Fazer login com usuario e senha corretos
    Adicionar um produto ao carrinho
    Validar elementos do carrinho


APOS RELOGAR NO SISTEMA, confirmar se o produto e a quantidade correta foram adicionados ao carrinho
    Acessar Página do SauceDemo
    Fazer login com usuario e senha corretos
    Adicionar um produto ao carrinho
    Validar elementos do carrinho
    Relogar no sistema
    Validar elementos do carrinho