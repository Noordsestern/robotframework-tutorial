*** Settings ***
Library             Browser
Resource            keywords/login_business.resource

Suite Setup         New Browser    headless=${BROWSER_HEADLESS}
Suite Teardown      Browser Schließen
Test Template       Login Mit Falschen Daten Soll Fehlschlagen

Test Tags           negativ-test    login    webui


*** Variables ***
${BROWSER_HEADLESS}     ${False}

${TOTP}                 egal


*** Test Cases ***
Login mit falschen Usernamen soll fehlschlagen    markus    12345    ${TOTP}    Invalid Username!
Login mit falschem Passwort soll fehlschlagen    demo_user    12345    ${TOTP}    Invalid Password!
Login mit falschem MFA Code soll fehlschlagen    demo_user    secret_pass    ${TOTP}    Invalid MFA Code!
Login mit fehlendem Usernamen soll fehlschlagen    ${EMPTY}    12345    ${TOTP}    The Username is Required!
Login mit fehlendem Passwort soll fehlschlagen    demo_user    ${EMPTY}    ${TOTP}    The Password is Required!
Login mit fehlndem MFA Code soll fehlschlagen    demo_user    secret_pass    ${EMPTY}    The MFA Code is Required!


*** Keywords ***
Login Mit Falschen Daten Soll Fehlschlagen
    [Arguments]    ${username}    ${password}    ${totpcode}    ${fehlermeldung}
    Loginseite Öffnen
    Benutzer Anmelden    ${username}    ${password}    ${totpcode}
    Fehlermeldung Verifizieren    ${fehlermeldung}
