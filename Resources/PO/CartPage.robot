*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${CART_INCLUSION_BOX} =  id=layer_cart
${PROCEED_TO_CHECKOUT_FIRST_BUTTON} =  //a[@title='Proceed to checkout']/span
${PROCEED_TO_CHECKOUT_SECOND_BUTTON} =  class : standard-checkout

*** Keywords ***
Verificar Produto Adicionado
    Wait Until Element Is Visible   ${CART_INCLUSION_BOX}
    Wait Until Page Contains    Product successfully added to your shopping cart

Iniciar Checkout
    Click Link  ${PROCEED_TO_CHECKOUT_FIRST_BUTTON}
    Wait Until Page Contains  Shopping-cart summary

Proceder ao Checkout
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Link  ${PROCEED_TO_CHECKOUT_SECOND_BUTTON}
    SignInPage.Verificar "Sign In Page" Carregada