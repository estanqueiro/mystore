*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${SEARCH_BAR} =     id=search_query_top
${SEARCH_BUTTON} =  name=submit_search

*** Keywords ***
Procurar Produtos
    Informar Termo de Busca
    Submeter Busca

Informar Termo de Busca
    Input Text  ${SEARCH_BAR}  ${SEARCH_TERM}

Submeter Busca
    Click Button  ${SEARCH_BUTTON}