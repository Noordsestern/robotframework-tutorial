*** Settings ***
Library     my_first_lib.py


*** Test Cases ***
My Lib Demo
    ${summe}    Addiere Zwei Zahlen    1    1
    Should Be Equal As Integers    ${summe}    2
