*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Begin Web Test
    Open Browser  about:blank  ${BROWSER}
    Maximize Browser Window
    Go To  ${START_URL}
    HomePage.Verificar "Home Page" Carregada

End Web Test
    Close Browser