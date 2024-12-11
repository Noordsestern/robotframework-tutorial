*** Settings ***
Library             Browser
Library             DataDriver    file=fehlerhafte_logins.csv    reader_class=generic_csv_reader
Resource            keywords/login_business.resource

Suite Setup         New Browser    headless=${BROWSER_HEADLESS}
Suite Teardown      Browser Schließen
Test Template       Login Mit Falschen Daten Soll Fehlschlagen

Test Tags           negativ-test    login    webui


*** Variables ***
${BROWSER_HEADLESS}     ${False}

${TOTP}                 egal


*** Test Cases ***
Fehlerhafter login: ${username} ${fehlermeldung}    dummy    dummy    dummy    dummy


*** Keywords ***
Login Mit Falschen Daten Soll Fehlschlagen
    [Arguments]    ${username}    ${password}    ${totpcode}    ${fehlermeldung}
    Loginseite Öffnen
    Benutzer Anmelden    ${username}    ${password}    ${totpcode}
    Fehlermeldung Verifizieren    ${fehlermeldung}
