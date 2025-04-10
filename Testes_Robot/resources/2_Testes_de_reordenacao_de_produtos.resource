*** Settings ***
Library           Browser                                                                 #Chamada da bliblioteca Browser
Library           Collections                                                             #Chamada da biblioteca para listas e arrays


*** Variables ***
${PAGE_HEADER}            css=[data-test="title"]                                         #Variavel com o titulo da página                   
${PRODUCT}                css=[data-test="inventory-item-name"]                           #Variavel com o elemento referente ao nome dos produtos
${DROPDOWN}               css=[data-test="product-sort-container"]                        #Variavel com o elemento do menu dropdown
${AZ_VALUE}               css=[value="az"]                                                #Variavel com o valor do elemento organizados de A a Z
${ZA_VALUE}               css=[value="za"]                                                #Variavel com o valor do elemento organizados de Z a A

*** Keywords ***
Validar se os produtos estao sendo listados corretamente
    Wait For Elements State       ${PAGE_HEADER}     visible                              #Aguarda aparecer o titulo da página
    ${TITLE}                      Get Text    ${PAGE_HEADER}                              #Pega o texto do titulo da pagina e armazena em uma variavel
    Should Be Equal As Strings    ${TITLE}    Products                                    #Verifica se o titulo da página é o correto
    ${PRODUCTS_NAME}    Coletar Todos Os Nomes Dos Produtos                               #Armazena o retorno da keword em um array
    ${TOTAL}            Get Length    ${PRODUCTS_NAME}                                    #Armazena o tamanho da array em uma variavel                               
    Should Be True      ${TOTAL} > 0                                                      #Verifica se existe pelo menos um produto sendo listado


Coletar Todos Os Nomes Dos Produtos
    ${PRODUCTS}         Get Elements       ${PRODUCT}                                     #Pega todos os produtos e coloca em um array
    ${PRODUCTS_NAME}    Create List                                                       #Cria lista vazia para armazenar os nomes
    FOR    ${PRODUCT}    IN    @{PRODUCTS}                                                #Percorre a lista e vai pegando os produtos
        ${NAME}    Get Text    ${PRODUCT}                                                 #Pega o texto do produto (nome)
        Append To List    ${PRODUCTS_NAME}    ${NAME}                                     #Cria uma nova lista com os nomes que vão sendo encontrados
    END
    [Return]    ${PRODUCTS_NAME}                                                          #Retorna lista com os nomes dos produtos


Reoganizar os produtos de A a Z
    Click                ${DROPDOWN}                                                      #Clica no menu dropdown
    Select Options By    ${DROPDOWN}   value    az                                        #Seleciona a opção com o valor az
    ${PRODUCTS_NAME}     Coletar Todos Os Nomes Dos Produtos                              #Armazena o retorno da keword em um array
    ${ORDER_AZ}          Copy List    ${PRODUCTS_NAME}                                    #Faz uma copia do array                                            
    Sort List            ${ORDER_AZ}                                                      #Faz a ordenação em ordem alfabetica da lista copiada
    Lists Should Be Equal    ${PRODUCTS_NAME}    ${ORDER_AZ}                              #Compara se a lista original esta na mesma ordem da lista ordenada


Reoganizar os produtos de Z a A
    Click                ${DROPDOWN}                                                      #Clica no menu dropdown
    Select Options By    ${DROPDOWN}   value    za                                        #Seleciona a opção com valor za
    ${PRODUCTS_NAME}     Coletar Todos Os Nomes Dos Produtos                              #Armazena o retorno da keword em um array
    ${ORDER_ZA}          Copy List    ${PRODUCTS_NAME}                                    #Faz uma copia da array retornada    
    Sort List            ${ORDER_ZA}                                                      #Faz a ordenação em ordem alfabetica da lista copiada
    Reverse List         ${ORDER_ZA}                                                      #Inverte a lista ordenada
    Lists Should Be Equal    ${PRODUCTS_NAME}    ${ORDER_ZA}                              #Compara se a lista ordenada invertida está igual a lista original