*** Settings ***
Library           Browser                                                               #Chamada da bliblioteca Browser
Library           Collections                                                           #Chamada da biblioteca para listas e arrays


*** Variables ***
${PAGE_TITLE}          css=[data-test="title"]
${PRODUCT_NAME}        Sauce Labs Backpack                                              #Nome do produto
${PRODUCT_DESC}        carry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection.
${PRODUCT_PRICE}       $29.99                                                           #Preco do produto
${PRODUCT_QUANTITY}    1                                                                #Quantidade de produto comprado
${ADD_CART_BUTTON}     css=[data-test="add-to-cart-sauce-labs-backpack"]                #Elemento do botão para adicionar ao carrinho
${CART_BUTTON}         css=[data-test="shopping-cart-link"]                             #Elemento do botão do carrinho
${CART_ICON}           css=[data-test="shopping-cart-badge"]                            #Elemento referente ao icone do carrinho
${ITEM_QUANTITY}       css=[data-test="item-quantity"]                                  #Elemento referente a quantidade de itens no carrinho
${ITEM_NAME}           css=[data-test="inventory-item-name"]                            #Elemento referente ao nome dos itens no carrinho
${ITEM_DESC}           css=[data-test="inventory-item-desc"]                            #Elemento referente a descrição dos itens no carrinho 
${ITEM_PRICE}          css=[data-test="inventory-item-price"]                           #Elemento referente ao preço dos itens no carrinho


*** Keywords ***
Validar se o produto é adicionado ao carrinho
    Click                         ${ADD_CART_BUTTON}                                    #Clica no botão para adicionar ao carrinho
    ${COUNT}    Get Text          ${CART_ICON}                                          #Pega o texto do icone do carrinho e armazena em uma variavel
    Should Be Equal As Strings    ${COUNT}    1                                         #Verifica se a string mostrada no icone do carrinho é 1
 


Adicionar um produto ao carrinho
    Click                         ${ADD_CART_BUTTON}                                    #Clica no botão para adicionar ao carrinho


Validar elementos do carrinho
    Click                         ${CART_BUTTON}                                        #Clica no botão do carrinho
    Wait For Elements State       ${PAGE_TITLE}     visible                             #Aguarda aparecer o titulo da página    
    
    ${TITLE}                      Get Text       ${PAGE_TITLE}                          #Pega o texto do titulo da pagina e armazena em uma variavel
    Should Be Equal As Strings    ${TITLE}       Your Cart                              #Verifica se o titulo da página atual é o correto
    
    ${QUANTITY}                   Get Text       ${ITEM_QUANTITY}                       #Pega o texto do titulo da pagina e armazena em uma variavel
    Should Be Equal As Strings    ${QUANTITY}    ${PRODUCT_QUANTITY}                    #Verifica se o titulo da página atual é o correto
    
    ${NAME}                       Get Text       ${ITEM_NAME}                           #Pega o texto do titulo da pagina e armazena em uma variavel
    Should Be Equal As Strings    ${NAME}        ${PRODUCT_NAME}                        #Verifica se o titulo da página atual é o correto
    
    ${DESC}                       Get Text       ${ITEM_DESC}                           #Pega o texto do titulo da pagina e armazena em uma variavel
    Should Be Equal As Strings    ${DESC}        ${PRODUCT_DESC}                        #Verifica se o titulo da página atual é o correto
    
    ${PRICE}                      Get Text       ${ITEM_PRICE}                          #Pega o texto do titulo da pagina e armazena em uma variavel
    Should Be Equal As Strings    ${PRICE}       ${PRODUCT_PRICE}                       #Verifica se o titulo da página atual é o correto


Relogar no sistema
    Click    id=react-burger-menu-btn                                                   #Clica no menu princiapl
    Click    css=[data-test="logout-sidebar-link"]                                      #Clica no botao para deslogar do sistema
    Fazer login com usuario e senha corretos                                            #Faz o login novamente no sistema