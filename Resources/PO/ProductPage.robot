*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${ADD_TO_CART_BUTTON} =  name=Submit

*** Keywords ***
Verificar "Página do Produto" Carregada
    Wait Until Page Contains    Data sheet

Adicionar Ao Carrinho
    Click Button    ${ADD_TO_CART_BUTTON}