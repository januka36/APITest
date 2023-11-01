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
    ${json_response}     Set Variable   ${Get_Response.json()}
    #${json_response}=     Evaluate    json.loads('''${Get_Response_Content}''')
    @{res1}     Get Value From Json     ${json_response}    Results
    ${get_from_list_1}    Get From List     ${res1}    0
    ${get_from_list_2}    Get From List     ${get_from_list_1}    0
    @{get_from_list_3}     Get Value From Json     ${get_from_list_2}   City
    ${res}    Get From List     ${get_from_list_3}    0
    #Log To Console     ${res}
    #Log To Console     ${get_from_list_3}
    #${StatusCode}=        Convert To String        ${Get_Response.status_code}

    Should Be Equal    ${res}    Tokyo
