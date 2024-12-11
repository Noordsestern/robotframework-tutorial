*** Settings ***
Library     MyFirstLib.py


*** Test Cases ***
My Lib Demo
    ${summe}    Sum Two Numbers   1    1
    Should Be Equal As Integers    ${summe}    2
