*** Settings ***
Resource            keywords/login_business.resource

Test Setup          New Browser    headless=${BROWSER_HEADLESS}
Test Teardown       Close Browser

Test Tags           login    webui    smoke


*** Variables ***
${BROWSER_HEADLESS}     ${False}


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

