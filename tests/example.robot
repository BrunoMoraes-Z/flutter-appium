*** Settings ***
Resource  ../resources/main.robot

Test Setup  Open App
Test Teardown  Close Application

*** Test Cases ***
Cenário 01: Abrir Calculadora

    Dado que esteja com o aplicativo aberto
    Quando clico em "Seguir"
    Então deve ser possivel visualizar a calculadora

Cenário 02: Realizar uma operação
    
    Dado que esteja na calculadora
    E clico no botão "1"
    E clico no botão "2"
    E clico no botão "*"
    E clico no botão "3"
    Quando clico no botão "="
    Entao o resultado deve ser "36.0"