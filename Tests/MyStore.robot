*** Settings ***
Documentation  Esta suite representa os testes do DEMOCENTER para a aplicação web MyStore

Resource  ../Resources/Common.robot
Resource  ../Resources/MyStoreApp.robot

Suite Setup  Common.Begin Web Test
Suite Teardown  Common.End Web Test

# robot -d Results Tests/MyStore.robot
# export PATH=$PATH:~/drivers

*** Variables ***
${BROWSER} =  firefox
${START_URL} =  http://automationpractice.com/index.php/
${SEARCH_TERM} =  T-shirts
${LOGIN_USER} =  admin
${LOGIN_PASSWORD} =  admin

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

#Usuário não logado pode incluir produtos no carrinho
#
#Usuário não logado deve ser solicitado login para fazer check out
#
#Usuário logado deve poder fazer check out

