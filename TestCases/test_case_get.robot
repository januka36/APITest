*** Settings ***

Library       RequestsLibrary

*** Variables ***

${API_Base_Endpoint}     https://vpic.nhtsa.dot.gov/

*** Test Cases ***

TC_001_Get_Request_Fethch_Status_Code
    Create Session    API_Testing    ${API_Base_Endpoint}
    GET On Session    API_Testing    api/vehicles/GetManufacturerDetails/500                            # robotcode: ignore