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
    ${Get_Response}=     GET On Session    API_Testing    api/vehicles/GetMakeForManufacturer/988             # robotcode: ignore
    ${StatusCode}=        Convert To String        ${Get_Response.status_code}
    Should Be Equal       ${StatusCode}        200
    ${Get_Response_Content}=  Set Variable  ${Get_Response.content} 
    ${json_response}=     Evaluate    json.loads('''${Get_Response_Content}''')

    Log To Console  ${json_response}
