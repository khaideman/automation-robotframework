*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser  ${LOGIN URL}  ${BROWSER}
Suite Teardown    Close Browser
Variables         ../resources/login_locators.yaml

*** Variables ***
${LOGIN URL}      https://www.saucedemo.com/
${BROWSER}        chrome

*** Keywords ***
Input username
    Input Text    ${txtUsername}    standard_user

Input password
    Input Text    ${txtPassword}    secret_sauce

Input invalid username
    Input Text    ${txtUsername}    123

Click button login
    Click Element    ${btnLogin}
    Sleep    1s

Verify on login page
    Page Should Contain    Products

*** Test Cases ***
User login with valid data
    Input username
    Input password
    Click button login
    Verify on login page