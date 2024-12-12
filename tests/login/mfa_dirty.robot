*** Settings ***
Library    Browser

Test Teardown       Close Browser

Test Tags           login    webui    smoke


*** Variables ***
${BASE_URL}     https://seleniumbase.io/realworld
${BROWSER_HEADLESS}     ${False}


*** Test Cases ***
Test Successful Login
    New Browser    headless=no
    New Page    ${BASE_URL}/signup
    VAR    ${username}    demo_user
    VAR    ${password}    secret_pass
    ${totpcode}    Get Text    id=totp
    ${login_data}    Create Dictionary    username=${username}    password=${password}    totpcode=${totpcode}
    New Page    ${BASE_URL}
    Fill Text    id=username    ${username}
    Fill Text    id=password    ${password}
    Fill Text    id=totpcode    ${totpcode}
    Click    id=log-in
    Get Element States    id=image1    *=    visible
    Take Screenshot

