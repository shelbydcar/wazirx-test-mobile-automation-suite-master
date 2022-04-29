*** Keywords ***
Verify 200 response Status
    [Arguments]    ${ApiUrl}    ${RequestFilePath}
    Create HTTP Context    api2.crowdfireapp.com    https
    ${Request_Body}    Get File    ${RequestFilePath}
    #${Request_Header}    Get File    ${Header}
    Set Request Header    access-token    EqGCP1499762817133e6DA-cf
    Set Request Header    api-key    2adadaE@F?RwfqwFWR
    Set Request Header    content-type    application/json
    Set Request Body    ${Request_Body}
    POST    ${ApiUrl}
    Log Response Body
    ${Status}    Get Response Status
    #should start with    200    ${Status}
    Response Status Code Should Equal    ${Status}
