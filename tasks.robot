*** Settings ***
Library    SeleniumLibrary
Library    RPA.Desktop

*** Variables ***
${url}    https://proba-5f04e.web.app/
${nev}    Nagyház
${datum}    2023.01.03
${leiras}    Nagyon jó ház
${fenykep}    none

*** Test Cases ***
Open Website
    Open Site
    Click kínálatunkat
    Click Hirdessen
    Hírdetés feladás
    Hírdetés létezés
    CloseWebsite


*** Keywords ***
Open Site
    Open Browser    ${url}     Chrome    options=add_experimental_option("detach", True)
    Maximize Browser Window
    Page Should Contain    Á.L.B. Ingatlanügynökség
    Page Should Contain    Nézze meg kínálatunkat
    Page Should Contain    Hirdessen nálunk

    Capture Page Screenshot    home.png

Click kínálatunkat
    Click Element    //*[@id="offers"]
    Sleep    3s
    Capture Page Screenshot    kínálat.png
    Sleep    3s
    Go Back
Click Hirdessen
    Click Element    //*[@id="newad"]

Hírdetés feladás
    Sleep    3s
    Page Should Contain    Kategóriák
    Click Element    //*[@id="ujkategoria"]
    Sleep    3s
    Select From List By Label    //*[@id="ujkategoria"]    Ház
    Page Should Contain    Ház
    Click Element    //*[@id="ujcim"]
    Input Text    id:ujcim    ${nev}
    Click Element    //*[@id="ujdatum"]
    Input Text    id:ujdatum    ${datum}
    Click Element    //*[@id="ujleiras"]
    Input Text    id:ujleiras    ${leiras}
    Click Element    //*[@id="ujfenykep"]
    Input Text    id:ujfenykep    ${fenykep}
     Capture Page Screenshot    hirdetes.png
    Sleep    1s
    Click Button    //*[@id="kuldes"]

Hírdetés létezés
    Page Should Contain ${nev}
    Page Should Contain ${leiras}
CloseWebsite
    Close Browser






