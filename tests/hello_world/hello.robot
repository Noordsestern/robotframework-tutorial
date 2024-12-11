*** Settings ***
Documentation       Documentation goes here

Library             Collections
Resource            hello-keywords.resource


*** Variables ***
${STRING 1}          Hello
${STRING 2}          World


*** Test Cases ***
2 Strings Should Be Identical
    [Documentation]    This is my first test case from the RF training
    # This is my first keyword
    Should Be Equal    ${STRING 1}    ${STRING 1}    msg=The two words are not the same.

Demo Failing Test Case
    Should Be Equal    ${STRING 1}    ${STRING 2}    msg=The two words are not the same.

Keyword Demo
    Tell "Björn" Hello    my_loglevel=WARN


*** Keywords ***
Tell "${person}" Hello
    [Arguments]    ${my_loglevel}=INFO
    Log    Hello ${person}    level=${my_loglevel}
