
*** Variable ***
${FundsCoin}        AAVE

*** Keywords ***
Validate DepositFields
    # Get Address from address field

    ${GetAddress}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${DepositAddress}
    Run Keyword If    '${GetAddress}' != 'None'      Log    Pass

    # Validate Copy icon and Functionality
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${addresscopy}
    Run Keyword If    '${Status}' == 'True'      click element       ${addresscopy}

    # Validate Qr is availbale
    ${Status}   Run Keyword And Return Status     wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${Depositeqr}
    Run Keyword If    '${Status}' == 'True'      Log    Pass

Validate Withdraw fields
    CloseKeyboard
    # Validate Paste icon and Functionality
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${addresspaste}
    Run Keyword If    '${Status}' == 'True'      click element       ${addresspaste}

    # Validate After Paste Address is available in addreess Field
    ${GetAddress}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${DestinationAdd}
    Run Keyword If    '${GetAddress}' != 'None'      Log    Pass

    # Validate QR Scanner Icon
    ${Status}   Run Keyword And Return Status     wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${Depositeqr}
    Run Keyword If    '${Status}' == 'True'      Log    Pass

    # Validate WithdrawAll Button and Functionality
    ${Status}   Run Keyword And Return Status     wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${WithdrawAll}
    Run Keyword If    '${Status}' == 'True'      click element       ${WithdrawAll}

    ${withdrawval}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${Volume}
    Run Keyword If    '${withdrawval}' != 'None'      Log    Pass

    # Validate Final Withdraw Amount
    ${finalval}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${FinalWithdrawAmnt}
    Run Keyword If    '${finalval}' != 'None'      Log    Pass

    Go backk
    Go backk



GoTo FundsTab
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${Funds}
    Run Keyword If    '${Status}' == 'True'      click element       ${Funds}

hidelowbal
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${Hidelowbal}
    Run Keyword If    '${Status}' == 'True'      click element      ${Hidelowbal}

Select BTC
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${EXBTC}
    Run Keyword If    '${Status}' == 'True'      click element      ${EXBTC}

Select XRP
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${XRPFunds}
    Run Keyword If    '${Status}' == 'True'      click element      ${XRPFunds}


Tap DepositBtn
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${DepositButton}
    Run Keyword If    '${Status}' == 'True'      click element      ${DepositButton}


Tap WithdrawBtn
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${WithdrawButton}
    Run Keyword If    '${Status}' == 'True'      click element      ${WithdrawButton}


Validate XRP DepositFields
    Tap on Show Address and Destination tag

    ${getaddress}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${DepositAddress}
    Run Keyword If    '${getaddress}' != 'None'      Log    Pass

    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${DestinationTag}
    Run Keyword If    '${Status}' == 'True'      Log    Pass

    ${gettag}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${DestinationTag}
    Set Global Variable     ${gettag}
    Run Keyword If    '${gettag}' != 'None'      Log    Pass

    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${addresscopy}
    Run Keyword If    '${Status}' == 'True'      click element       ${addresscopy}

    ${Status}   Run Keyword And Return Status     wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${xrpqr}
    Run Keyword If    '${Status}' == 'True'      Log    Pass


    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${back}
    Sleep     1s


Validate XRP WithdrawFields
    CloseKeyboard

    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${addresspaste}
    Run Keyword If    '${Status}' == 'True'      click element       ${addresspaste}
    ${GetAddress}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${DestinationAdd}
    Run Keyword If    '${GetAddress}' != 'None'      Log    Pass


    ${Status}   Run Keyword And Return Status     wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${Depositeqr}
    Run Keyword If    '${Status}' == 'True'      Log    Pass

    ${Status}   Run Keyword And Return Status     wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${memotag}
    Run Keyword If    '${Status}' == 'True'      Log    Pass
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    input text    ${memotag}    ${gettag}

    ${Status}   Run Keyword And Return Status     wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${WithdrawAll}
    Run Keyword If    '${Status}' == 'True'      click element       ${WithdrawAll}
    ${withdrawval}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${Volume}
    Run Keyword If    '${withdrawval}' != 'None'      Log    Pass

    ${finalval}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${FinalWithdrawAmnt}
    Run Keyword If    '${finalval}' != 'None'      Log    Pass
    CloseKeyboard

#    Validate Withdraw

#Go backk
#    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${back}
#    Sleep     1s


Tap on Show Address and Destination tag
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${ShowDestinationAdd}
    Run Keyword If    '${Status}' == 'True'      click element       ${ShowDestinationAdd}


Validate Fund transfer
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${TransferHistory}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${${TransferTable} }    #click Transaction
    close window



Validate Rapid ListingCoin
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${rapidlistingtag}

    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${drpdrapidlisting}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${drpdrapidlisting}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${rapidlistingmsg}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${whatisrapidlisting}
#    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${whatisrapidlisting}
#    Sleep    4s
#    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${wazirxblogtitle}
#    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${back}
#    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${back}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${closerapidlisting}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${closerapidlisting}

FundsSwipe to Confirm
    [Arguments]       ${ConfirmSlider}
    wait until element is Visible     ${ConfirmSlider}
    ${element_size}=    Get Element Size    ${ConfirmSlider}
    ${element_location}=    Get Element Location    ${ConfirmSlider}
    ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.1)
    ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.1)
#    ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 1)
    ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.1)
    Swipe               ${start_x}    ${start_y}   900   ${end_y}   3500


Click Ok
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${OKBtn}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${OKBtn}


Validate Withdraw
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    input text    ${Volume}    20
    CloseKeyboard
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    input text    ${Remarks}    Withdraw test
    CloseKeyboard
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${Proceed}
    FundsSwipe to Confirm       ${ConfirmSlider}
    Authenticator OTP
    Click Ok
    Get Email Approval


FundSearchCoins
    [Arguments]        ${ClickFundsCoin}
    ClickSearchIcon
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    input text     ${SearchField}       ${FundsCoin}
    CloseKeyboard
    Sleep   1s
    FOR        ${i}    IN RANGE     0      10
        ${result}    Run Keyword And Return Status    wait until keyword succeeds    ${RetryMinCount}    ${RetryIntervalMin}    wait until element is visible     ${ClickFundsCoin}      #Click on settings back button
        Run Keyword If    '${result}' == 'True'     click element    ${ClickFundsCoin}        ELSE      VerticleDownSwipe
        Exit For Loop If    '${result}' == 'True'
    END
#    Go Back