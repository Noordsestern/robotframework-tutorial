*** Settings ***
Library             Browser
Resource            keywords/login_business.resource

Suite Setup         New Browser    headless=${BROWSER_HEADLESS}
Suite Teardown      Close Browser
Test Template       Login With Invalid Data Should Fail

Test Tags           negative-test    login    webui


*** Variables ***
${BROWSER_HEADLESS}     ${False}

${TOTP}                 irrelevant


*** Test Cases ***
Login with Invalid Username Should Fail    markus    12345    ${TOTP}    Invalid Username!
Login with Invalid Password Should Fail    demo_user    12345    ${TOTP}    Invalid Password!
Login with Invalid MFA Code Should Fail    demo_user    secret_pass    ${TOTP}    Invalid MFA Code!
Login with Missing Username Should Fail    ${EMPTY}    12345    ${TOTP}    The Username is Required!
Login with Missing Password Should Fail    demo_user    ${EMPTY}    ${TOTP}    The Password is Required!
Login with Missing MFA Code Should Fail    demo_user    secret_pass    ${EMPTY}    The MFA Code is Required!


*** Keywords ***
Login With Invalid Data Should Fail
    [Arguments]    ${username}    ${password}    ${totpcode}    ${error_message}
    Open Login Page
    Log In User    ${username}    ${password}    ${totpcode}
    Verify Error Message    ${error_message}
