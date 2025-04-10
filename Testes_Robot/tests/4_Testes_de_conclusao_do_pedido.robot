*** Settings ***
Resource            ../resources/1_Testes_de_login.resource                                    #Importação do arquivo de recursos referente a keyword de login
Resource            ../resources/3_Testes_de_adicao_de_produtos_no_carrinho.resource           #Importação do arquivo de recursos referente ao teste
Resource            ../resources/4_Testes_de_conclusao_do_pedido.resource                      #Importação do arquivo de recursos referente ao teste


Test Teardown       Close Browser                                                              #Configuração para fechar o navegador no fim de cada caso de teste


*** Test Cases ***
Validar se o processo de finalização da compra funciona como esperado
    Acessar Página do SauceDemo
    Fazer login com usuario e senha corretos
    Adicionar um produto ao carrinho
    Validar elementos do carrinho
    Ir para o checkout
    Preencher dados corretos de entrega
    Validar elementos do checkout
    Validar informaçãos da página de sucesso de compra
    

Validar se os campos do checkout são validados corretamente
    Acessar Página do SauceDemo
    Fazer login com usuario e senha corretos
    Adicionar um produto ao carrinho
    Validar elementos do carrinho
    Ir para o checkout
    Tentar enviar com o primeiro nome vazio
    Tentar enviar com o sobrenome vazio
    Tentar enviar com o zip code vazio