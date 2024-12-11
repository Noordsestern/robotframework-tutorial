*** Settings ***
Library             Browser
Library             DataDriver    file=invalid_logins.csv    reader_class=generic_csv_reader
Resource            keywords/login_business.resource

Suite Setup         New Browser    headless=${BROWSER_HEADLESS}
Suite Teardown      Close Browser
Test Template       Login With Invalid Data Should Fail

Test Tags           negative-test    login    webui


*** Variables ***
${BROWSER_HEADLESS}     ${False}

${TOTP}                 irrelevant


*** Test Cases ***
Invalid login: ${username} ${error_message}    dummy    dummy    dummy    dummy


*** Keywords ***
Login With Invalid Data Should Fail
    [Arguments]    ${username}    ${password}    ${totpcode}    ${error_message}
    Open Login Page
    Log In User    ${username}    ${password}    ${totpcode}
    Verify Error Message    ${error_message}
