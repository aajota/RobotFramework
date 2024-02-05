*** Settings ***
Documentation    Suite de testes de cadastro de dog walker

Resource        ../resources/base.resource

*** Test Cases ***

Deve poder cadastrar um novo dog walker

    ${dog_walker}        Create Dictionary        
    ...    name=Ajota        
    ...    email=ajteste@gmail.com        
    ...    cpf=00000014141        
    ...    cep=04534011        
    ...    street=Rua Joaquim Floriano        
    ...    number=2000        
    ...    details=Apto34        
    ...    district=Itaim Bibi        
    ...    cityUf=São Paulo/SP        
    ...    cnh=toretto.jpg                         

    Go to signup page
    Fill signup form        ${dog_walker}
    Submit signup form
    Popup should be        Recebemos o seu cadastro e em breve retornaremos o contato.        

