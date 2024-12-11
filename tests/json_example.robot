*** Settings ***
Library     MyFirstLib.py
Library     json


*** Test Cases ***
Demo Libs
    ${json_string}    Gimme Json
    ${json}    Loads    ${json_string}
    Should Be Equal    ${json}[name]    markus
