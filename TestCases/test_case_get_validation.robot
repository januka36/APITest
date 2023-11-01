*** Settings ***

Library       RequestsLibrary
Library        JSONLibrary
Library         Collections
Library         os

*** Variables ***

${API_Base_Endpoint}     https://vpic.nhtsa.dot.gov/   

*** Test Cases ***

TC_001_Get_Request_Fethch_And_Validate_Content
    Create Session    API_Testing    ${API_Base_Endpoint}
    ${Get_Response}=     GET On Session    API_Testing    url=api/vehicles/GetManufacturerDetails/honda?format=json           # robotcode: ignore
    ${Get_Response_Content}=      Set Variable   ${Get_Response.content} 
    #${json_response}     Set Variable   ${Get_Response.json()}
    ${json_response}=     Evaluate    json.loads('''${Get_Response_Content}''')

    Log To Console  ${json_response}
