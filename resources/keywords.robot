*** Settings ***
Resource  ./main.robot

*** Keywords ***
Open App
    Open Application  http://localhost:4723/wd/hub
    ...  platformName=Android
    ...  automationName=Flutter
    ...  deviceName=AutomationDevice
    ...  udid=${DEVICE}
    ...  app=${APK}

Dado que esteja com o aplicativo aberto
    Wait For Element    ${elements.next}
    Capture Page Screenshot

Quando clico em "Seguir"
    Click Element    ${elements.next}

Então deve ser possivel visualizar a calculadora
    Wait For Element    ${elements.memory}
    Capture Page Screenshot

Dado que esteja na calculadora
    Dado que esteja com o aplicativo aberto
    Quando clico em "Seguir"
    Então deve ser possivel visualizar a calculadora

E clico no botão "${KEY}"
    
    IF  $KEY == '*'
        ${loc}  Set Variable  ${elements.multiply}
    ELSE IF  $KEY == '/'
        ${loc}  Set Variable  ${elements.divide}
    ELSE IF  $KEY == '+'
        ${loc}  Set Variable  ${elements.plus}
    ELSE IF  $KEY == '-'
        ${loc}  Set Variable  ${elements.minus}
    ELSE IF  $KEY == '='
        ${loc}  Set Variable  ${elements.equals}
    ELSE
        ${loc}  Set Variable  btn_${KEY}
    END

    Wait For Element    ${loc}
    Click Element    ${loc}
    Capture Page Screenshot

Quando clico no botão "${KEY}"
    E clico no botão "${KEY}"

Entao o resultado deve ser "${EXPECTED}"
    ${TEXT}  Get Text    ${elements.screen}
    Capture Page Screenshot
    Should Be True    $EXPECTED == $TEXT