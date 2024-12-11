*** Settings ***
Library     Browser
Resource    login_technical.resource


*** Keywords ***
Log In User
    [Arguments]    ${username}    ${password}    ${totpcode}
    Enter Username    ${username}
    Enter Password    ${password}
    Enter MFA Code    ${totpcode}
    Click Login Button
