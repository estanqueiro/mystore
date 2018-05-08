*** Settings ***
Resource  ../PO/SignInPage.robot

*** Keywords ***
Verificar "HomePage" Carregada
    Wait Until Page Contains  Automation Practice Website
    Title Should Be  My Store

Navegar à Página de Login
    Click Link  Sign in
    SignInPage.Verificar "Sign In Page" Carregada

