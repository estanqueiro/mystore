*** Settings ***
Resource  ../Resources/PO/HomePage.robot
Resource  ../Resources/PO/SearchPage.robot
Resource  ../Resources/PO/SearchResultsPage.robot
Resource  ../Resources/PO/ProductPage.robot
Resource  ../Resources/PO/CartPage.robot
Resource  ../Resources/PO/SignInPage.robot
Resource  ../Resources/PO/AddressPage.robot
Resource  ../Resources/PO/ShippingPage.robot
Resource  ../Resources/PO/PaymentPage.robot
Resource  ../Resources/PO/OrderSummaryPage.robot
Resource  ../Resources/PO/MyAccountPage.robot


*** Keywords ***
Fazer "Login"
    [Arguments]  ${Credentials}
    HomePage.Navegar à Página de Login
    SignInPage.Entrar Credenciais   ${Credentials}
    MyAccountPage.Verificar "My Account Page" Carregada

Tentativa De Login Com Múltiplos Cenários Inválidos
    [Arguments]  ${InvalidLoginScenarios}
    :FOR  ${LoginScenario}  IN  @{InvalidLoginScenarios}
    \  HomePage.Navegar à Página de Login
    \  SignInPage.Tentativa De Login  ${LoginScenario}
    \  SignInPage.Verificar Mensagem de Erro do Login  ${LoginScenario}
    \  SignInPage.Limpar Campos De Entrada

Testar Múltiplos Cenários de Login
    [Arguments]  ${Credentials}
    HomePage.Navegar à Página de Login
    SignInPage.Tentativa De Login  ${Credentials}
    SignInPage.Verificar Mensagem de Erro do Login  ${Credentials.ExpectedErrorMessage}
    SignInPage.Limpar Campos De Entrada

Procurar Produtos
    SearchPage.Procurar Produtos
    SearchResultsPage.Verificar "Busca Completa"

Selecionar Produto No Resultado Da Busca
    SearchResultsPage.Selecionar Produto
    ProductPage.Verificar "Página do Produto" Carregada

Adicionar Produto ao Carrinho
    ProductPage.Adicionar ao Carrinho
    CartPage.Verificar Produto Adicionado

Fazer Checkout Não Logado
    CartPage.Iniciar Checkout
    CartPage.Proceder ao Checkout
    SignInPage.Verificar "Sign In Page" Carregada

Fazer Checkout Logado
    [Arguments]  ${Credentials}
    CartPage.Iniciar Checkout
    CartPage.Proceder ao Checkout
    SignInPage.Verificar "Sign In Page" Carregada
    SignInPage.Entrar Credenciais   ${Credentials}
    AddressPage.Confirmar "Endereço"
    ShippingPage.Aceite Aos "Termos De Serviço"
    ShippingPage.Continuar Checkout
    PaymentPage.Select "Payment" Method
    OrderSummaryPage.Confirmar "Ordem"