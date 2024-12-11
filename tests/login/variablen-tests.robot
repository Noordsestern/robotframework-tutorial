*** Settings ***
Test Tags       variablen
Default Tags    variablen spaß


*** Variables ***
@{TIERE}            hund    katze    maus
&{NEUE_KOLLEGEN}    person1=timo    person2=achim    person3=markus


*** Test Cases ***
Tiere ausgeben als Skalar (So nicht machen!)
    FOR    ${tier}    IN    ${TIERE}
        Log To Console    ${tier}
    END

Tiere ausgeben als Liste
    Log Viel Auf Konsole    björn    achim    timo    jürgen    niklas    elias    noaman    schulungstag=Mittwoch

Kollegen ausgeben
    Log To Console    ${NEUE_KOLLEGEN}
    Log To Console    ${NEUE_KOLLEGEN}[person1]
    VAR    @{ZAHLEN}    1    2    3
    Log    ${ZAHLEN}

Demonistriere IF Bedingung
    VAR    ${zahl}    ${1}
    IF    $zahl<2    Log To Console    Markus ist neu


*** Keywords ***
Log Viel Auf Konsole
    [Arguments]    @{log_elemente}    ${schulungstag}
    Log To Console    ${log_elemente}
    FOR    ${el}    IN    @{log_elemente}
        Log To Console    ${el}
    END
