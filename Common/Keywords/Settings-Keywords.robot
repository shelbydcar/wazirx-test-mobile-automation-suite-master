*** Keywords ***
Security
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${Security}    #Click on Security buttton
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${Security}    #Click on Security buttton
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${AppPasscode}    #Click on AppPasscodebuttton
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${PasscodeOn}    #Click on PasscodeOn buttton
#GoTo Settings
#    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element     ${Settings}
#    Run Keyword If    '${Status}' == 'True'      click element       ${Settings}

Validate Phone Number
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element     ${AddPhoneNumber}
    Run Keyword If    '${Status}' == 'True'      click element       ${AddPhoneNumber}


Validate Invite and Earn
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element     ${Invite&Earn}
    Run Keyword If    '${Status}' == 'True'      click element       ${Invite&Earn}
    Sleep  2s
    # Validate Page Title
    ${Status}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${Title}
    Should Be Equal         '${Status}'      'Invite & Earn'

Validate Learn Crypto
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element     ${LearnCrypto}
    Run Keyword If    '${Status}' == 'True'      click element       ${LearnCrypto}
    Sleep  2s
    ${Status}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${Title}
    Should Be Equal         '${Status}'      'Learn Crypto'


Validate Coupons And Contests
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element     ${CouponsAndContests}
    Run Keyword If    '${Status}' == 'True'      click element       ${CouponsAndContests}
    Sleep  2s
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element     ${ClaimCoupons}
    Run Keyword If    '${Status}' == 'True'      click element       ${ClaimCoupons}
    Sleep  2s
    ${Status}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${Title}
    Should Be Equal         '${Status}'      'Claim Coupons'
    Go Back
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element     ${SeeContests}
    Run Keyword If    '${Status}' == 'True'      click element       ${SeeContests}
    Go Back


Validate Price Tracking Widget
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element     ${PriceTrackingWidget}
    Run Keyword If    '${Status}' == 'True'      click element       ${PriceTrackingWidget}
    Sleep  2s
    ${Status}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${Title}
    Should Be Equal         '${Status}'      'Price Tracking Widget'


Validate Notifications
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element     ${Notifications}
    Run Keyword If    '${Status}' == 'True'      click element      ${Notifications}
    Sleep  2s
    ${Status}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${Title}
    Should Be Equal         '${Status}'      'Notifications'


Validate Preferences
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element     ${Preferences}
    Run Keyword If    '${Status}' == 'True'      click element       ${Preferences}


Validate Banking And Payment
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element     ${Banking&Payment}
    Run Keyword If    '${Status}' == 'True'      click element       ${Banking&Payment}
    Sleep  2s
    ${Status}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${Title}
    Should Be Equal         '${Status}'      'Banking & Payment'



Validate AccountSecurity
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element     ${AccountSecurity}
    Run Keyword If    '${Status}' == 'True'      click element       ${AccountSecurity}
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element     ${RequiredPasscode}
    Run Keyword If    '${Status}' == 'True'      click element       ${RequiredPasscode}
    Go Back
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${TwoFactor}
    Run Keyword If    '${Status}' == 'True'      click element       ${TwoFactor}
    Go Back
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element     ${ActivityLogs}
    Run Keyword If    '${Status}' == 'True'      click element       ${ActivityLogs}
    Sleep  2s
    ${Status}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${Title}
    Should Be Equal         '${Status}'      'Activity Logs'
    Go Back

Validate Fees And Trade
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element     ${Fees&Trade}
    Run Keyword If    '${Status}' == 'True'      click element       ${Fees&Trade}

    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element     ${DownloadTradingReport}
    Run Keyword If    '${Status}' == 'True'      click element       ${DownloadTradingReport}
    Sleep  2s
    ${Status}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${Title}
    Should Be Equal         '${Status}'      'Download trading report'
    Go Back
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element     ${FeeSettings}
    Run Keyword If    '${Status}' == 'True'      click element       ${FeeSettings}
    Sleep  2s
    ${Status}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${Title}
    Should Be Equal         '${Status}'      'Fee settings'
    Go Back
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element     ${FeesInfo}
    Run Keyword If    '${Status}' == 'True'      click element       ${FeesInfo}
    Go Back
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element     ${ConvertCryptoDust}
    Run Keyword If    '${Status}' == 'True'      click element       ${ConvertCryptoDust}
    Sleep  2s
    ${Status}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${Title}
    Should Be Equal         '${Status}'      'Convert Crypto Dust'
    Go Back


Validate Help And Support
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element      ${Help&Support}
    Run Keyword If    '${Status}' == 'True'      click element      ${Help&Support}


Validate Legal
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element      ${Legal}
    Run Keyword If    '${Status}' == 'True'      click element       ${Legal}

Validate Rate Us
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element      ${RateUs}
    Run Keyword If    '${Status}' == 'True'      click element       ${RateUs}

Validate Follow Us
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element      ${Followus}
    Run Keyword If    '${Status}' == 'True'      click element       ${Followus}
