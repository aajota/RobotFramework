*** Settings ***
Documentation    Suite de testes de cadastro de dog walker

Resource        ../resources/base.resource

Teste Setup        Start session
Test Teardown        Finish session
*** Test Cases ***

Deve poder cadastrar um novo dog walker
    [Tags]    smoke

    ${dog_walker}        Create Dictionary        
    ...    name=Junior Lima       
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
 

    Não deve cadastrar se os campos obrigatórios não forem preenchidos
    [tags]    required

  
    Go to signup page
    Submit signup form

    Alert should be    Informe o seu nome completo
    Alert should be    Informe o seu melhor email
    Alert should be    Informe o seu CPF
    Alert should be    Informe o seu CEP
    Alert should be    Informe um número maior que zero
    Alert should be    Adcione um documento com foto (RG ou CNH)

   

    Não deve poder cadastrar se o cpf for inválido
        [Tags]    cpf_inv

    ${dog_walker}        Create Dictionary        
    ...    name=Junior Lima       
    ...    email=ajteste@gmail.com        
    ...    cpf=000000141ii        
    ...    cep=04534011        
    ...    street=Rua Joaquim Floriano        
    ...    number=2000        
    ...    details=Apto31        
    ...    district=Itaim Bibi        
    ...    cityUf=São Paulo/SP        
    ...    cnh=toretto.jpg                         

  
    Go to signup page
    Fill signup form        ${dog_walker}
    Submit signup form
    Alert should be    CPF inválido      

    Deve poder cadastrar um novo dog walker que sabe cuidade de pets
    [Tags]    aservice

    ${dog_walker}        Create Dictionary        
    ...    name=Dominic Toreto       
    ...    email=toretoo@gmail.com        
    ...    cpf=00000014141        
    ...    cep=04534011        
    ...    street=Rua Joaquim Floriano        
    ...    number=2000        
    ...    details=Apto34        
    ...    district=Itaim Bibi        
    ...    cityUf=São Paulo/SP        
    ...    cnh=toretto.jpg 
    ...    additionl_service=Cuidar   
                            
    Go to signup page
    Fill signup form        ${dog_walker}
    Submit signup form
    Popup should be        Recebemos o seu cadastro e em breve retornaremos o contato.        

       Deve poder cadastrar um novo dog walker que sabe adestrar de pets
    [Tags]    aservice

    ${dog_walker}        Create Dictionary        
    ...    name=Toreto 123       
    ...    email=123toretoo@gmail.com        
    ...    cpf=00000014141        
    ...    cep=04534011        
    ...    street=Rua Joaquim Floriano        
    ...    number=2000        
    ...    details=Apto34        
    ...    district=Itaim Bibi        
    ...    cityUf=São Paulo/SP        
    ...    cnh=toretto.jpg 
    ...    additionl_service=Adestrar   
                            
    Go to signup page
    Fill signup form        ${dog_walker}
    Submit signup form
    Popup should be        Recebemos o seu cadastro e em breve retornaremos o contato.       

    
 
    

   
