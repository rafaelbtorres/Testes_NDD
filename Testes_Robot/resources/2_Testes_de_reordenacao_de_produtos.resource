*** Settings ***
Library           Browser                                     #Chamada da bliblioteca Browser


*** Variables ***
${URL}                    https://www.saucedemo.com/          #Variavel com a URL



*** Keywords ***
Validar se os produtos estao sendo listados corretamente
    Wait For Elements State            [data-test="inventory-item-name"]    visible
    ${PRODUCTS}        Get Elements    [data-test="inventory-item-name"]
    Should Be True     ${PRODUCTS} > 0