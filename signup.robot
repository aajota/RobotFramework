*** Settings ***
Documentation    Suite de testes de cadastro de dog walker

Library    Browser

*** Test Cases ***

Deve poder cadastrar um novo dog walker

    ${name}             Set Variable        Junior Lima
    ${email}            Set Variable        ajota45568@gmail.com
    ${cpf}              Set Variable        00000014141
    ${cep}              Set Variable        04534011
    ${addressStreet}    Set Variable        Rua Joaquim Floriano
    ${addressNumber}    Set Variable        2000
    ${addressDetails}   Set Variable        Apto34
    ${addressDistrict}  Set Variable        Itaim Bibi
    ${addressCityUf}    Set Variable        São Paulo/SP
    
    New Browser    browser=chromium    headless=False
    New Page    https://walkdog.vercel.app/signup

    Wait For Elements State        form h1    visible    5000    
    Get Text        form h1    equal    Faça seu cadastro

    Fill Text        css=input[name=name]                 ${name}
    Fill Text        css=input[name=email]                ${email}      
    Fill Text        css=input[name=cpf]                  ${cpf}   
    Fill Text        css=input[name=cep]                  ${cep} 

    click            css=input[value="Buscar CEP"][type="button"]
    
    Get Property     css=input[name="addressStreet"]                  value        equal        ${addressStreet}
    Get Property     css=input[name="addressDistrict"]                value        equal        ${addressDistrict}
    Get Property     css=input[name="addressCityUf"]                  value        equal        ${addressCityUf}

    Fill Text        css=input[name=addressNumber]        ${addressNumber}
    Fill Text        css=input[name=addressDetails]       ${addressDetails}   

    Upload File By Selector        css=input[type=file]        ${EXECDIR}/toretto.jpg        

    Sleep    60
