*** Settings ***
Library  SeleniumLibrary

*** Variables ***

*** Keywords ***
Verificar "Sign In Page" Carregada
    Wait Until Page Contains  Authentication
