*** Settings ***
Resource  ../PO/SignInPage.robot

*** Keywords ***
Verificar "HomePage" Carregada
    Wait Until Page Contains  Automation Practice Website
    Title Should Be  My Store

Fazer "Login"
    Click Link  Sign in
    SignInPage.Verificar "Sign In Page" Carregada