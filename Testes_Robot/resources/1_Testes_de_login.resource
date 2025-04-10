*** Settings ***
Library           Browser                                     #Chamada da bliblioteca Browser


*** Variables ***
${URL}                    https://www.saucedemo.com/          #Variavel com a URL
${CORRECT_USERNAME}       standard_user                       #Variavel com o usuername correto
${CORRECT_PASSWORD}       secret_sauce                        #Variavel com a senha correta
${INCORRECT_USERNAME}     rafael                              #Variavel com o username incorreto
${INCORRECT_PASSWORD}     rafael_senha                        #Variavel com a senha incorreta
${LOCKED_USERNAME}        locked_out_user                     #Variavel com o username bloqueado


*** Keywords ***
Acessar Página do SauceDemo
    New Browser    chromium       headless=${False}           #Abre um novo browser
    New Context                                               #Inicia uma nova sessão de navegação
    New Page       ${URL}                                     #Acessa a URL
    Wait For Elements State       id=user-name    visible     #Valida se o elemento do input do user-name está visivel
    ${TITLE}   Get Title                                      #Recupera o titulo da pagina
    Should Be Equal As Strings    ${TITLE}    Swag Labs       #Valida se o titulo da página está correto
                        

Fazer login com usuario e senha corretos
    Type Text      id=user-name      ${CORRECT_USERNAME}      #Insere o user-name no campo correto
    Type Text      id=password       ${CORRECT_PASSWORD}      #Insere a senha no campo correto
    Click          id=login-button                            #Clica no botao de login
    Get Text       css=.title        ==    Products           #Valida se o titulo da página inicial está correto

Fazer login com usuario incorreto
    Type Text      id=user-name      ${INCORRECT_USERNAME}    #Insere o user-name no campo correto
    Type Text      id=password       ${CORRECT_PASSWORD}      #Insere a senha no input correto
    Click          id=login-button                            #Clica no botão de login
    ${ERROR_MESSAGE}    Get Text    [data-test="error"]       #Recupera o texto do elemento data-test="error"
    Should Contain      ${ERROR_MESSAGE}    Epic sadface: Username and password do not match any user in this service    #Valida se a mensagem de erro é a correta

Fazer login com senha incorreta
    Type Text      id=user-name      ${CORRECT_USERNAME}      #Insere o user-name no campo correto
    Type Text      id=password       ${INCORRECT_PASSWORD}    #Insere a senha no input correto
    Click          id=login-button                            #Clica no botão de login
    ${ERROR_MESSAGE}    Get Text    [data-test="error"]       #Recupera o texto do elemento data-test="error"      
    Should Contain      ${ERROR_MESSAGE}    Epic sadface: Username and password do not match any user in this service     #Valida se a mensagem de erro é a correta


Fazer login com usuario bloqueado
    Type Text      id=user-name      ${LOCKED_USERNAME}        #Insere o user-name no campo correto
    Type Text      id=password       ${CORRECT_PASSWORD}       #Insere a senha no input correto
    Click          id=login-button                             #Clica no botão de login
    ${ERROR_MESSAGE}    Get Text    [data-test="error"]        #Recupera o texto do elemento data-test="error"   
    Should Contain      ${ERROR_MESSAGE}    Epic sadface: Sorry, this user has been locked out.                            #Valida se a mensagem de erro é a correta