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


*** Keywords ***
Login
    HomePage.Fazer "Login"

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
    CartPage.Iniciar Checkout
    CartPage.Proceder ao Checkout
    SignInPage.Verificar "Sign In Page" Carregada
    SignInPage.Fazer Login  ${USERNAME}  ${PASSWORD}
    AddressPage.Confirmar "Endereço"
    ShippingPage.Aceite Aos "Termos De Serviço"
    ShippingPage.Continuar Checkout
    PaymentPage.Select "Payment" Method
    OrderSummaryPage.Confirmar "Ordem"