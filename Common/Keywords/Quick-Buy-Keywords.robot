
*** Variable ***
${QuickBuyCoin}        BTC



*** Keywords ***

Validate SearchCoin
    [Arguments]        ${ClickQuickBuyCoin}
    ClickSearchIcon
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    input text     ${SearchField}       ${QuickBuyCoin}
    CloseKeyboard
    Sleep   1s
    FOR        ${i}    IN RANGE     0      10
        ${result}    Run Keyword And Return Status    wait until keyword succeeds    ${RetryMinCount}    ${RetryIntervalMin}    wait until element is visible     ${ClickQuickBuyCoin}      #Click on settings back button
        Run Keyword If    '${result}' == 'True'     click element    ${ClickQuickBuyCoin}        ELSE      VerticleDownSwipe
        Exit For Loop If    '${result}' == 'True'
    END

GoTo QuickBuy Tab
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${QuickBuyTab}
    Run Keyword If    '${Status}' == 'True'      click element       ${QuickBuyTab}


Goto FilterDrpDown
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${FilterDrpDn}
    Run Keyword If    '${Status}' == 'True'      click element       ${FilterDrpDn}

Select MostTraded Filter
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${FiterMostTraded}
    Run Keyword If    '${Status}' == 'True'      click element       ${FiterMostTraded}
    ${Filtered}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${FilterDrpDn}
    Should Be Equal         '${Filtered}'      'Most Traded'
    Sleep  2s

Select LeastTraded Filter
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${FiterLeastTraded}
    Run Keyword If    '${Status}' == 'True'      click element       ${FiterLeastTraded}
    ${Filtered}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${FilterDrpDn}
    Should Be Equal         '${Filtered}'      'Least Traded'
    Sleep  2s

Select TopGainers Filter
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${FiterTopGainers}
    Run Keyword If    '${Status}' == 'True'      click element       ${FiterTopGainers}
    ${Filtered}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${FilterDrpDn}
    Should Be Equal         '${Filtered}'      'Top Gainers'
    Sleep  2s

Select TopLoosers Filter
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${FiterTopLosers}
    Run Keyword If    '${Status}' == 'True'      click element       ${FiterTopLosers}
    ${Filtered}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${FilterDrpDn}
    Should Be Equal         '${Filtered}'      'Top Losers'
    Sleep  2s

Select HighestPrice Filter
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${FilterHighestPrice}
    Run Keyword If    '${Status}' == 'True'      click element       ${FilterHighestPrice}
    ${Filtered}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${FilterDrpDn}
    Should Be Equal         '${Filtered}'      'Highest Price'
    Sleep  2s

Select LowestPrice Filter
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${FilterLowestPrice}
    Run Keyword If    '${Status}' == 'True'      click element       ${FilterLowestPrice}
    ${Filtered}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${FilterDrpDn}
    Should Be Equal         '${Filtered}'      'Lowest Price'
    Sleep  2s

Select SetToDefault Filter
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${SetToDefault}
    Run Keyword If    '${Status}' == 'True'      click element       ${SetToDefault}


GoTo BuyTab
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${TabBuy}
    Run Keyword If    '${Status}' == 'True'      click element       ${TabBuy}

GoTo SellTab
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${TabSell}
    Run Keyword If    '${Status}' == 'True'      click element       ${TabSell}

Tap on CurrentBalance
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${CurrentBalance}
    Run Keyword If    '${Status}' == 'True'      click element       ${CurrentBalance}


Validate INR Wallet
    ${Wallet}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${FundsWalletTitle}
    Should Be Equal         '${Wallet}'      'INR Wallet'

Validate QuoteMartket Wallet
    ${Wallet}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${FundsWalletTitle}
    Should Be Equal         '${Wallet}'      '${QuickBuyCoin} Wallet'



Buy Preview
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    input text     ${Amnt}       1050
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${PreviewBuySell}
    Run Keyword If    '${Status}' == 'True'      click element       ${PreviewBuySell}
    Sleep  2s
    FundsSwipe to Confirm       ${ConfirmSlider}
    Sleep   2s
    ${Status}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${OrderStatus}
    Should Be Equal         '${Status}'      'Successfully Bought'

    ${Status}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${AmountStatus}
    Should Be Equal         '${Status}'      'You spent 1,050 INR and bought 10 BTC'
    Sleep   2s
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${CloseBtn}
    Run Keyword If    '${Status}' == 'True'      click element       ${CloseBtn}


Sell Preview

    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    input text     ${Amnt}       10
    Sleep   5s
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${PreviewBuySell}
    Run Keyword If    '${Status}' == 'True'      click element       ${PreviewBuySell}
    Sleep  2s

    FundsSwipe to Confirm       ${ConfirmSlider}

    ${Status}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${OrderStatus}
    Should Be Equal         '${Status}'      'Successfully Sold'

    ${Status}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${AmountStatus}
    Should Be Equal         '${Status}'      'You sold 10 BTC and got back 250 INR'
    Sleep   3s
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${CloseBtn}
    Run Keyword If    '${Status}' == 'True'      click element       ${CloseBtn}


Tap BuyBtn
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${TapBuy}
    Run Keyword If    '${Status}' == 'True'      click element       ${TapBuy}
