*** Settings ***
Library     Browser
Resource    login_technical.resource

*** Variables ***
${BROWSER_HEADLESS}     ${False}

*** Keywords ***
Log In User
    [Arguments]    ${username}    ${password}    ${totpcode}
    Enter Username    ${username}
    Enter Password    ${password}
    Enter MFA Code    ${totpcode}
    Click Login Button

Open a new Browser
    New Browser    headless=${BROWSER_HEADLESS}
