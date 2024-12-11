*** Settings ***
Documentation       Hallo dies ist docu

Library             Collections
Resource            hello-keywords.resource


*** Variables ***
${ZEICHENKETTE 1}       Hallo
${ZEICHENKETTE 2}       Welt


*** Test Cases ***
2 Zeichenketten sollen identisch sein
    [Documentation]    Das ist mein erster Testfall aus dem RF Training
    # Dies ist mein erstes Keyword
    Should Be Equal    ${zeichenkette 1}    ${zeichenkette 1}    msg=Die beiden Wörter sind nicht gleich.

Demo Failing Testfall
    Should Be Equal    ${zeichenkette 1}    ${zeichenkette 2}    msg=Die beiden Wörter sind nicht gleich.

Keyword Demo
    Sag "Björn" Hallo    mein_loglevel=WARN


*** Keywords ***
Sag "${person}" Hallo
    [Arguments]    ${mein_loglevel}=INFO
    Log    Hallo ${person}    level=${mein_loglevel}
