*** Settings ***
Library           Browser                                                               #Chamada da bliblioteca Browser
Library           Collections                                                           #Chamada da biblioteca para listas e arrays


*** Variables ***
${PAGE_TITLE}          css=[data-test="title"]
${PRODUCT_NAME}        Sauce Labs Backpack                                              #Nome do produto
${PRODUCT_DESC}        carry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection.
${PRODUCT_PRICE}       $29.99                                                           #Preco do produto
${PRODUCT_QUANTITY}    1                                                                #Quantidade de produto comprado
${ITEM_QUANTITY}       css=[data-test="item-quantity"]                                  #Elemento referente a quantidade de itens no carrinho
${ITEM_NAME}           css=[data-test="inventory-item-name"]                            #Elemento referente ao nome dos itens no carrinho
${ITEM_DESC}           css=[data-test="inventory-item-desc"]                            #Elemento referente a descrição dos itens no carrinho 
${ITEM_PRICE}          css=[data-test="inventory-item-price"]                           #Elemento referente ao preço dos itens no carrinho

${FIRST_NAME}            Rafael                                                         #Primeiro nome para o teste
${LAST_NAME}             Torres                                                         #Segundo nome para o teste
${ZIP_CODE}              8819305                                                        #Zip code para o teste
${FIRST_NAME_ELEMENT}    css=[data-test="firstName"]                                    #Elemento input para primeiro nome
${LAST_NAME_ELEMENT}     css=[data-test="lastName"]                                     #Elemento input para sobrenome
${ZIP_CODE_ELEMENT}      css=[data-test="postalCode"]                                   #Elemento input para o zip code

${CHECK_IMAGE}            css=[data-test="pony-express"]                                #Elemento da imagem de conclusão do pedido
${CHECK_HEADER}           Thank you for your order!                                     #Header do texto de conclusão do pedido
${CHECK_TEXT}             Your order has been dispatched, and will arrive just as fast as the pony can get there!                               #Texto da conclusão do pedido
${CHECK_HEADER_EL}        css=[data-test="complete-header"]                             #Elemento do Header do texto de conclusão do pedido
${CHECK_TEXT_EL}          css=[data-test="complete-text"]                               #Elemento do Texto da conclusão do pedido
${BACK_HOME_BUTTON}       css=[data-test="back-to-products"]                            #Botão para retornar ao home

${ERROR_MESSAGE_EL}       css=[data-test="error"]                                       #Elemento da mensagem de erro


*** Keywords ***
Ir para o checkout
    Click    id=checkout                                                                #Clica no botão de checkout
    Wait For Elements State               ${FIRST_NAME_ELEMENT}    visible              #Valida se o elemento do input do first name

Preencher dados corretos de entrega
    Fill Text    ${FIRST_NAME_ELEMENT}    ${FIRST_NAME}                                 #Insere o primeiro nome no campo correto
    Fill Text    ${LAST_NAME_ELEMENT}     ${LAST_NAME}                                  #Insere o sobrenome no campo correto
    Fill Text    ${ZIP_CODE_ELEMENT}      ${ZIP_CODE}                                   #Insere o zip code no campo correto


Validar elementos do checkout
    Click    id=continue                                                                #Clica no botão para continuar

    ${TITLE}                      Get Text       ${PAGE_TITLE}                          #Pega o texto do titulo da pagina e armazena em uma variavel
    Should Be Equal As Strings    ${TITLE}       Checkout: Overview                     #Verifica se o titulo da página atual é o correto
    
    ${QUANTITY}                   Get Text       ${ITEM_QUANTITY}                       #Pega o texto do titulo da pagina e armazena em uma variavel
    Should Be Equal As Strings    ${QUANTITY}    ${PRODUCT_QUANTITY}                    #Verifica se o titulo da página atual é o correto
    
    ${NAME}                       Get Text       ${ITEM_NAME}                           #Pega o texto do titulo da pagina e armazena em uma variavel
    Should Be Equal As Strings    ${NAME}        ${PRODUCT_NAME}                        #Verifica se o titulo da página atual é o correto
    
    ${DESC}                       Get Text       ${ITEM_DESC}                           #Pega o texto do titulo da pagina e armazena em uma variavel
    Should Be Equal As Strings    ${DESC}        ${PRODUCT_DESC}                        #Verifica se o titulo da página atual é o correto
    
    ${PRICE}                      Get Text       ${ITEM_PRICE}                          #Pega o texto do titulo da pagina e armazena em uma variavel
    Should Be Equal As Strings    ${PRICE}       ${PRODUCT_PRICE}                       #Verifica se o titulo da página atual é o correto
    

Validar informaçãos da página de sucesso de compra
    Click    id=finish
    Wait For Elements State       ${CHECK_IMAGE}    visible                             #Valida se a imagem aparece
    ${TITLE}                      Get Text          ${PAGE_TITLE}                       #Pega o texto do titulo da pagina e armazena em uma variavel
    Should Be Equal As Strings    ${TITLE}          Checkout: Complete!                 #Verifica se o titulo da página atual é o correto

    ${HEADER}                     Get Text          ${CHECK_HEADER_EL}                  #Pega o header da mensagem de conclusão e armazena em uma variavel
    Should Be Equal As Strings    ${HEADER}         ${CHECK_HEADER}                     #Verifica se o header da mensagem é o correto

    ${TEXT}                       Get Text          ${CHECK_TEXT_EL}                    #Pega o texto da mensagem de conclusão e armazena em uma variavel
    Should Be Equal As Strings    ${TEXT}           ${CHECK_TEXT}                       #Verifica se o texto da mensagem é o correto


Tentar enviar com o primeiro nome vazio
    Browser.Reload                                                                      #Da um reload na pagina para limpar os inputs
    Wait For Elements State               ${FIRST_NAME_ELEMENT}   visible               #Aguarda o input do primeiro nome aparecer
    Fill Text    ${LAST_NAME_ELEMENT}     ${LAST_NAME}                                  #Insere o sobrenome no campo correto
    Fill Text    ${ZIP_CODE_ELEMENT}      ${ZIP_CODE}                                   #Insere o zip code no campo correto
    Click        id=continue                                                            #Clica no botao para continuar
    Wait For Elements State       ${ERROR_MESSAGE_EL}     visible                       #Aguarda a mensagem de erro aparecer
    ${ERROR}                      Get Text        ${ERROR_MESSAGE_EL}                   #Pega o texto da mensagem de erro
    Should Be Equal As Strings    ${ERROR}        Error: First Name is required         #Verifica se o texto da mensagem de erro é o correto


Tentar enviar com o sobrenome vazio
    Browser.Reload                                                                      #Da um reload na pagina para limpar os inputs
    Wait For Elements State               ${FIRST_NAME_ELEMENT}   visible               #Aguarda o input do primeiro nome aparecer
    Fill Text    ${FIRST_NAME_ELEMENT}    ${FIRST_NAME}                                 #Insere o primeiro nome no campo correto
    Fill Text    ${ZIP_CODE_ELEMENT}      ${ZIP_CODE}                                   #Insere o zip code no campo correto    
    Click        id=continue                                                            #Clica no botao para continuar
    Wait For Elements State       ${ERROR_MESSAGE_EL}   visible                         #Aguarda a mensagem de erro aparecer
    ${ERROR}                      Get Text        ${ERROR_MESSAGE_EL}                   #Pega o texto da mensagem de erro
    Should Be Equal As Strings    ${ERROR}        Error: Last Name is required          #Verifica se o texto da mensagem de erro é o correto


Tentar enviar com o zip code vazio
    Browser.Reload                                                                      #Da um reload na pagina para limpar os inputs
    Wait For Elements State               ${FIRST_NAME_ELEMENT}   visible               #Aguarda o input do primeiro nome aparecer
    Fill Text    ${FIRST_NAME_ELEMENT}    ${FIRST_NAME}                                 #Insere o primeiro nome no campo correto
    Fill Text    ${LAST_NAME_ELEMENT}     ${LAST_NAME}                                  #Insere o sobrenome no campo correto
    Click        id=continue                                                            #Clica no botao para continuar
    Wait For Elements State       ${ERROR_MESSAGE_EL}   visible                         #Aguarda a mensagem de erro aparecer
    ${ERROR}                      Get Text        ${ERROR_MESSAGE_EL}                   #Pega o texto da mensagem de erro
    Should Be Equal As Strings    ${ERROR}        Error: Postal Code is required        #Verifica se o texto da mensagem de erro é o correto


Tentar enviar com todos os campos vazios
    Browser.Reload                                                                      #Da um reload na pagina para limpar os inputs
    Wait For Elements State               ${FIRST_NAME_ELEMENT}   visible               #Aguarda o input do primeiro nome aparecer
    Click        id=continue                                                            #Clica no botao para continuar
    Wait For Elements State       ${ERROR_MESSAGE_EL}   visible                         #Aguarda a mensagem de erro aparecer
    ${ERROR}                      Get Text        ${ERROR_MESSAGE_EL}                   #Pega o texto da mensagem de erro
    Should Be Equal As Strings    ${ERROR}        Error: First Name is required         #Verifica se o texto da mensagem de erro é o correto