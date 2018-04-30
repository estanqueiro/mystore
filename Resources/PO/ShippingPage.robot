*** Variables ***
${CHECK_BOX_AGREEMENT} =  id=cgv
${PROCEED_TO_CHECKOUT_FOURTH_BUTTON} =  name : processCarrier

*** Keywords ***
Aceite Aos "Termos De Serviço"
    Wait Until Page Contains  Shipping
    Click Element  ${CHECK_BOX_AGREEMENT}
    Checkbox Should Be Selected  ${CHECK_BOX_AGREEMENT}

Continuar Checkout
    Click Button  ${PROCEED_TO_CHECKOUT_FOURTH_BUTTON}