*** Settings ***
Resource            keywords/login_business.resource

Suite Setup          Open a new Browser
Test Teardown        Close All Contexts
Suite Teardown       Close Browser

Test Tags           login    webui    smoke


*** Test Cases ***
Login With Invalid Data Should Fail
    [Tags]    negative-test
    Open Login Page
    Attempt Invalid User Login
    Verify Error Message For Invalid User

Test Successful Login
    ${login_data}    Retrieve Login Data
    Open Login Page
    Log In User    ${login_data}[username]    ${login_data}[password]    totpcode=${login_data}[totpcode]
    Welcome Page Should Be Visible
    Take Screenshot


*** Keywords ***
Welcome Page Should Be Visible
    Get Element States    id=image1    *=    visible

