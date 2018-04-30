*** Settings ***
Documentation  Esta suite representa os testes do DEMOCENTER para a aplicação web MyStore

Resource  ../Resources/Common.robot
Resource  ../Resources/MyStoreApp.robot

Suite Setup  Common.Begin Web Test
Suite Teardown  Common.End Web Test

# robot -d Results Tests/MyStore.robot
# robot -d Results -i Regression Tests/MyStore.robot
# export PATH=$PATH:~/drivers

*** Variables ***
${BROWSER} =  chrome
${START_URL} =  http://automationpractice.com/index.php/
${SEARCH_TERM} =  summer dresses
${USERNAME} =  paulo@test.com.br
${PASSWORD} =  teste

*** Test Cases ***
#Cadastrar usuário
#
#Usuário cadastrado deve conseguir fazer login
#    MyStoreApp.Login

Usuário não logado pode procurar produtos
    MyStoreApp.Procurar Produtos

Usuário não logado pode visualizar produtos
    MyStoreApp.Procurar Produtos
    MyStoreApp.Selecionar Produto no Resultado da Busca

Usuário não logado pode incluir produtos no carrinho
    MyStoreApp.Procurar Produtos
    MyStoreApp.Selecionar Produto no Resultado da Busca
    MyStoreApp.Adicionar Produto ao Carrinho

Usuário não logado não pode finalizar check out
    [Tags]  Debug
    MyStoreApp.Procurar Produtos
    MyStoreApp.Selecionar Produto no Resultado da Busca
    MyStoreApp.Adicionar Produto ao Carrinho
    MyStoreApp.Fazer Checkout Não Logado

Usuário logado pode fazer check out
    [Tags]  Regression
    MyStoreApp.Procurar Produtos
    MyStoreApp.Selecionar Produto no Resultado da Busca
    MyStoreApp.Adicionar Produto ao Carrinho
    MyStoreApp.Fazer Checkout Logado
