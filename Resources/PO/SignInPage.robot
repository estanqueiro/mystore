*** Variables ***
${USERNAME_FIELD} =  id=email
${PASSWORD_FIELD} =  id=passwd
${LOGIN_BUTTON} =  name : SubmitLogin

*** Keywords ***
Verificar "Sign In Page" Carregada
    Wait Until Page Contains  Authentication

Fazer Login
    [Arguments]     ${Username}      ${Password}
    Input Text      ${USERNAME_FIELD}  ${USERNAME}
    Input Password  ${PASSWORD_FIELD}  ${PASSWORD}
    Click Button    ${LOGIN_BUTTON}