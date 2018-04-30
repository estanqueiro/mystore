*** Variables ***
${PROCEED_TO_CHECKOUT_THIRD_BUTTON} =  name : processAddress

*** Keywords ***
Confirmar "Endereço"
    Wait Until Page Contains  Addresses
    Click Element  ${PROCEED_TO_CHECKOUT_THIRD_BUTTON}