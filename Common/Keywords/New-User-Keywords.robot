*** Keywords ***
Click Login
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element     ${Login}
    Run Keyword If    '${Status}' == 'True'      click element       ${Login}

Validate LoginPage Content

    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element     ${UserName}
    Run Keyword If    '${Status}' == 'True'      Log       Pass

    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element     ${PasswordKey}
    Run Keyword If    '${Status}' == 'True'      Log       Pass

    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element     ${Submit}
    Run Keyword If    '${Status}' == 'True'      Log       Pass

    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element      ${Signup}
    Run Keyword If    '${Status}' == 'True'      Log       Pass

    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element      ${ForgotPass}
    Run Keyword If    '${Status}' == 'True'      Log       Pass

    Go Back


Validate Signup Button
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element     ${Signup}
    Run Keyword If    '${Status}' == 'True'        Log         Pass #click element       ${Signup}

Validate InviteEarnToLogin
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element     ${Invite&Earn}
    Run Keyword If    '${Status}' == 'True'      click element       ${Invite&Earn}
    Validate LoginPage Content


Validate LearnCryptooToLogin
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element     ${LearnCrypto}
    Run Keyword If    '${Status}' == 'True'      click element       ${LearnCrypto}
    Validate LoginPage Content



Go To Orders Tab
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${OrdersTab}
    Run Keyword If    '${Status}' == 'True'      click element       ${OrdersTab}

Click empty Login
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${EmptyLogin}
    Run Keyword If    '${Status}' == 'True'      click element       ${EmptyLogin}
