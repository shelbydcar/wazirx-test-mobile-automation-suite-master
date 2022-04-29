*** Keyword ***
Validate Verify Account Page
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${verifypage}
    Run Keyword If    '${Status}' == 'True'      Log      Pass
    ${Status}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${verifypage}
    Should Be Equal         '${Status}'      'Verify Account'
    Go Back

Tap on Verify Account
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${VerifyAccount}
    Run Keyword If    '${Status}' == 'True'      click element       ${VerifyAccount}



