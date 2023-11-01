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
    ${Get_Response}=     GET On Session    API_Testing    url=api//vehicles/GetVehicleVariableList?format=json           # robotcode: ignore
    ${Get_Response_Content}=      Set Variable   ${Get_Response.content} 
    ${json_response}     Set Variable   ${Get_Response.json()}

    @{res1}     Get Value From Json     ${json_response}    Results
    ${get_from_list_1}    Get From List     ${res1}    0
    ${get_from_list_2}    Get From List     ${get_from_list_1}    0
    @{res_1}     Get Value From Json     ${get_from_list_2}   GroupName
    #${res_2}    Get From List     ${res_1}    0
    ${res}    Get From List     ${res_1}    0
    #${res}=        Convert To String        ${res}

    Should Be Equal    ${res}    Mechanical / Battery