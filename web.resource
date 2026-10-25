*** Settings ***
Documentation    Basic web keywords
Library          SeleniumLibrary


*** Keywords ***
Precondition: Open Browser And Maximize
    [Documentation]    Open browser in full screen mode
    [Arguments]    ${site_url}    ${browser}

    Open Browser    url=${site_url}    browser=${browser}
    Maximize Browser Window

Postcondition: Close Browser
    [Documentation]    Close browser
    
    Close Browser
