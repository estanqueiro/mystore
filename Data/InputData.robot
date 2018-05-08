*** Variables ***
${BROWSER} =  firefox
${START_URL} =  http://automationpractice.com/index.php/
${SEARCH_TERM} =  summer dresses

# Input Data
#&{VALID_USER_AND_PASSWORD}  Email=paulo@test.com.br  Password=teste
&{UNREGISTERED_USER}        Email=paulo@test.com     Password=teste    ExpectedErrorMessage=Authentication failed.
&{INVALID_PASSWORD_USER}    Email=paulo@test.com.br  Password=abc      ExpectedErrorMessage=Invalid password.
&{BLANK_CREDENTIALS_USER}   Email=#BLANK             Password=#BLANK   ExpectedErrorMessage=An email address required.
&{BLANK_PASSWORD}           Email=paulo@test.com.br  Password=#BLANK   ExpectedErrorMessage=Password is required.
