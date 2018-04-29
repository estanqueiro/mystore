*** Settings ***
Resource  ../Resources/PO/HomePage.robot



*** Variables ***
${SEARCH_BAR} =     id=search_query_top
${SEARCH_BUTTON} =  name=submit_search

*** Keywords ***
Login
    HomePage.Fazer "Login"

Procurar Produtos
    Informar Termo de Busca
    Submeter Busca
    Verificar "Busca Completa"

Selecionar Produto No Resultado Da Busca
    Procurar Produtos
    Selecionar Produto


Informar Termo de Busca
    Input Text  ${SEARCH_BAR}  ${SEARCH_TERM}

Submeter Busca
    Click Button  ${SEARCH_BUTTON}

Selecionar Produto
    Click Link   class=product_img_link

Verificar "Busca Completa"
    Wait Until Page Contains  Showing