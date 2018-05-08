*** Settings ***
Documentation  Esta suite representa os testes de login com DataDriven do DEMOCENTER para a aplicação web MyStore

Resource  ../Data/InputData.robot
Resource  ../Resources/Common.robot
Resource  ../Resources/MyStoreApp.robot
Resource  ../Resources/DataManager.robot

Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

# robot -d Results Tests/DataDrivenLogin.robot
# robot -d Results -i DataDriven Tests/DataDrivenLogin.robot
# export PATH=$PATH:~/drivers

*** Variables ***
${USER_DATA} =  datadriven

*** Test Cases ***
Tentativa de login deve apresentar mensagem de erro correta
    [Tags]  DataDriven
    ${InvalidLoginScenarios} =  DataManager.Get CSV Data   ${INVALID_CREDENTIALS_PATH_CSV}
    MyStoreApp.Tentativa De Login Com Múltiplos Cenários Inválidos  ${InvalidLoginScenarios}
