*** Settings ***

Library       RequestsLibrary

*** Variables ***

${API_Base_Endpoint}     https://vpic.nhtsa.dot.gov/

*** Test Cases ***

TC_001_Get_Request_Fethch_Status_Code
    Create Session    API_Testing    ${API_Base_Endpoint}
    ${Get_Response}=     GET On Session    API_Testing    api/vehicles/GetManufacturerDetails/878                     # robotcode: ignore
    Log To Console        ${Get_Response.status_code}
    Log To Console        ${Get_Response.content}
    ${StatusCode}=        Convert To String        ${Get_Response.status_code}
    Should Be Equal       ${StatusCode}        200
    
