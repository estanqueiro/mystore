*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${SIGN_IN_EMAIL} =     id=email
${SIGN_IN_PASSWORD} =  id=passwd
${LOGIN_BUTTON} =      name : SubmitLogin
${ALERT_BOX} =         class : alert-danger

*** Keywords ***
Verificar "Sign In Page" Carregada
    Wait Until Page Contains  Authentication

Tentativa De Login
    [Arguments]  ${Credentials}
    Run Keyword If  '${USER_DATA}' == 'builtin'  Entrar Credenciais  ${Credentials}  ELSE  Entrar Credenciais DataDriven  ${Credentials}

Entrar Credenciais
    [Arguments]  ${Credentials}
    Run Keyword Unless  '${Credentials.Email}' == '#BLANK'      Input Text      ${SIGN_IN_EMAIL}     ${Credentials.Email}
    Run Keyword Unless  '${Credentials.Password}' == '#BLANK'   Input Text      ${SIGN_IN_PASSWORD}  ${Credentials.Password}
    Click Button    ${LOGIN_BUTTON}

Entrar Credenciais DataDriven
    [Arguments]  ${Credentials}
    Run Keyword Unless  '${Credentials[0]}' == '#BLANK'      Input Text      ${SIGN_IN_EMAIL}     ${Credentials[0]}
    Run Keyword Unless  '${Credentials[1]}' == '#BLANK'   Input Text      ${SIGN_IN_PASSWORD}  ${Credentials[1]}
    Click Button    ${LOGIN_BUTTON}

Verificar Mensagem De Erro Do Login
    [Arguments]  ${ExpectedErrorMessage}
    Wait Until Page Contains Element  ${ALERT_BOX}
    Run Keyword If  'USER_DATA' == 'builtin'  Page Should Contain  ${ExpectedErrorMessage}  ELSE  Page Should Contain  ${ExpectedErrorMessage[2]}

Limpar Campos De Entrada
    Clear Element Text  ${SIGN_IN_EMAIL}
    Clear Element Text  ${SIGN_IN_PASSWORD}