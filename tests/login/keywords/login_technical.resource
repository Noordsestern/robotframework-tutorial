*** Settings ***
Library     Browser


*** Keywords ***
Verify Error Message
    [Arguments]    ${expected_error_message}
    ${error_message}    Get Text    id=top_message
    Should Be Equal    ${error_message}    ${expected_error_message}

Enter Username
    [Arguments]    ${username}
    Fill Text    id=username    ${username}

Enter Password
    [Arguments]    ${password}
    Fill Text    id=password    ${password}

Enter MFA Code
    [Arguments]    ${totpcode}
    Fill Text    id=totpcode    ${totpcode}

Click Login Button
    Click    id=log-in
