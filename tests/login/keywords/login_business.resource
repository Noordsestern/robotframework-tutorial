*** Settings ***
Library     Browser
Resource    login_functional.resource


*** Variables ***
${BASE_URL}     https://seleniumbase.io/realworld


*** Keywords ***
Open Login Page
    New Page    ${BASE_URL}

Open Signup Page
    New Browser    headless=no
    New Page    ${BASE_URL}/signup

Verify Error Message For Invalid User
    Verify Error Message    Invalid Username!

Attempt Invalid User Login
    Log In User    Markus    12345    123456

Retrieve Login Data
    Open Signup Page
    ${username}    Read Username
    ${password}    Read Password
    ${totpcode}    Read MFA Code
    ${login_data}    Create Dictionary    username=${username}    password=${password}    totpcode=${totpcode}
    RETURN    ${login_data}

Read Username
    RETURN    demo_user

Read Password
    RETURN    secret_pass

Read MFA Code
    ${totpcode}    Get Text    id=totp
    RETURN    ${totpcode}
