*** Settings ***
Test Tags       variables
Default Tags    variables fun


*** Variables ***
@{ANIMALS}          dog    cat    mouse
&{NEW_COLLEAGUES}   person1=timo    person2=achim    person3=markus


*** Test Cases ***
Output Animals as Scalar (Don't do it this way!)
    FOR    ${animal}    IN    ${ANIMALS}
        Log To Console    ${animal}
    END

Output Animals as a List
    Log Many To Console    björn    achim    timo    jürgen    niklas    elias    noaman    training_day=Wednesday

Output Colleagues
    Log To Console    ${NEW_COLLEAGUES}
    Log To Console    ${NEW_COLLEAGUES}[person1]
    VAR    @{NUMBERS}    1    2    3
    Log    ${NUMBERS}

Demonstrate IF Condition
    VAR    ${number}    ${1}
    IF    ${number}<2    Log To Console    Markus is new


*** Keywords ***
Log Many To Console
    [Arguments]    @{log_elements}    ${training_day}
    Log To Console    ${log_elements}
    FOR    ${el}    IN    @{log_elements}
        Log To Console    ${el}
    END
