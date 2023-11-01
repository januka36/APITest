*** Settings ***
Library     RequestsLibrary

*** Variables ***
${Website}  http://www.googl.com/
${Search_word}  Robot Framework

*** Test Cases ***

##Task to browse and search for a keyword
Open_Browser_and_Search
    ${headers}=    Create Dictionary    User-Agent=Mozilla/5.0
    ${query_params}=    Create Dictionary    q=${Search_word}
    ${response}=    GET    ${Website}    headers=${headers}    params=${query_params}
    Should Be Equal As Strings    ${response.status_code}    200
    Log    Response content: ${response.text}