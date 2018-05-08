*** Settings ***
Documentation  Esta suite representa os testes de login do DEMOCENTER para a aplicação web MyStore

Resource  ../Data/InputData.robot
Resource  ../Resources/Common.robot
Resource  ../Resources/MyStoreApp.robot

Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

# robot -d Results Tests/Carrinho.robot
# robot -d Results -i Regression Tests/Carrinho.robot
# export PATH=$PATH:~/drivers

*** Variables ***
${USER_DATA} =  builtin

*** Test Cases ***
Login
    MyStoreApp.Fazer "Login"    ${VALID_USER_AND_PASSWORD}

Tentativa de login deve apresentar mensagem de erro correta
    [Tags]  Login
    [Template]  Testar Múltiplos Cenários de Login
    ${UNREGISTERED_USER}
    ${INVALID_PASSWORD_USER}
    ${BLANK_CREDENTIALS_USER}
    ${BLANK_PASSWORD}
