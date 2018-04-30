*** Variables ***
${SUBMIT_BUTTON} =  //button[span='I confirm my order']

*** Keywords ***
Confirmar "Ordem"
    Wait Until Page Contains  Order summary
    Click Button  ${SUBMIT_BUTTON}
    Wait Until Page Contains  Order confirmation
    Page Should Contain  Your order on My Store is complete.


