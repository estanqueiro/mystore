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
    Entrar Credenciais  ${Credentials}

Entrar Credenciais
    [Arguments]  ${Credentials}
    Run Keyword Unless  '${Credentials.Email}' == '#BLANK'      Input Text      ${SIGN_IN_EMAIL}     ${Credentials.Email}
    Run Keyword Unless  '${Credentials.Password}' == '#BLANK'   Input Text      ${SIGN_IN_PASSWORD}  ${Credentials.Password}
    Click Button    ${LOGIN_BUTTON}

Verificar Mensagem De Erro Do Login
    [Arguments]  ${ExpectedErrorMessage}
    Wait Until Page Contains Element  ${ALERT_BOX}
    Page Should Contain  ${ExpectedErrorMessage}

Limpar Campos De Entrada
    Clear Element Text  ${SIGN_IN_EMAIL}
    Clear Element Text  ${SIGN_IN_PASSWORD}