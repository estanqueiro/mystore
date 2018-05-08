*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Verificar "My Account Page" Carregada
    Wait Until Page Contains    Welcome to your account.