*** Settings ***
Library             AppiumLibrary
*** Variable ***
${end_y}    800
*** Keywords ***

##################### order placing #####################
orderplacing LimitBuy
    [Arguments]     ${Market}      ${Coin}     ${at_price_value_input}       ${amount_value_input}
    Goto BuySellTray
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${Buy}
    Run Keyword If    '${Status}' == 'True'      click element      ${Buy}

    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${Price}
    Run Keyword If    '${Status}' == 'True'      click element       ${Price}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Input Text    ${Price}        ${at_price_value_input}

    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${AmountField}
    Run Keyword If    '${Status}' == 'True'      click element       ${AmountField}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Input Text    ${AmountField}    ${amount_value_input}    #Enter the crypto quantity.


    ${finalAmt}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${TotalINR}
    Run Keyword If    '${finalAmt}' != 'None'      Log    Pass

    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${PlaceOrder}
    Run Keyword If    '${Status}' == 'True'      click element       ${PlaceOrder}

    Swipe to Confirm  ${SwipeElement}

    Goto Orders
    Sleep    4s
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    wait until element is visible     ${BuyOrderPrice}
    ${GetorderedPrice}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text      ${BuyOrderPrice}
    Should be equal as numbers    ${GetorderedPrice}    ${at_price_value_input}    precision=2
    Sleep   2s

    Goto MyOrders
    Goto OpenTab
    ${OrderPrc}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text      ${OpenOrderPrc}
    ${OrdrPrice}=       Remove String       ${OrderPrc}     ₹
    Should be equal as numbers    ${OrdrPrice}    ${at_price_value_input}
    Goto Orders
#    ${message}=     Toast_message_capture
#    [Return]        ${message}

orderplacing LimitSell
    [Arguments]     ${Market}      ${Coin}     ${at_price_value_input}       ${amount_value_input}
    Goto BuySellTray
    Sleep       1s
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${Sell}
    Run Keyword If    '${Status}' == 'True'      click element       ${Sell}

    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${Price}
    Run Keyword If    '${Status}' == 'True'      click element       ${Price}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Input Text    ${Price}        ${at_price_value_input}

    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${AmountField}
    Run Keyword If    '${Status}' == 'True'      click element       ${AmountField}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Input Text    ${AmountField}    ${amount_value_input}    #Enter the crypto quantity.

    ${finalAmt}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${TotalINR}
    Run Keyword If    '${finalAmt}' != 'None'      Log    Pass


    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${PlaceOrder}
    Run Keyword If    '${Status}' == 'True'      click element       ${PlaceOrder}

    Swipe to Confirm  ${SwipeElement}

    Goto Orders
    Sleep    4s
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    wait until element is visible     ${SellOrderPrice}
    ${GetorderedPrice}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text      ${SellOrderPrice}
    ${GetorderPrice}=       Remove String       ${GetorderedPrice}     ₹ 
    Should be equal as numbers    ${GetorderPrice}    ${at_price_value_input}    precision=2
    Sleep   2s

    Goto MyOrders
    Goto OpenTab
    ${OrderPrc}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text      ${OpenOrderPrc}
    ${OrdrPrice}=       Remove String       ${OrderPrc}     ₹
    Should be equal as numbers    ${OrdrPrice}    ${at_price_value_input}
    Goto Orders

#    ${message}=     Toast_message_capture
#    [Return]        ${message}

orderplacing StopLimitBuy
    [Arguments]     ${Market}      ${Coin}     ${stoplimit_price_input}     ${at_price_value_input}       ${amount_value_input}
#    Select MarketandQuote       ${Market}    ${Coin}
    Goto BuySellTray
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${Buy}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    wait until element is visible     ${LimitDropDown}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${LimitDropDown}

    ${Status}    Run Keyword And Return Status    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}     Page Should Contain Text     Stop Limit
    log to console    ${Status}
    Run keyword if    '${Status}'=='True'    click text    Stop


#    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    wait until element is visible     ${StopLimitDD}
#    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${StopLimitDD}
#    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click text    Stop Limit
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    wait until element is visible     ${AtPrice}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${AtPrice}
#    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Clear text    ${Price}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Input Text    ${AtPrice}         ${stoplimit_price_input}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    wait until element is visible     ${Price}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${Price}
#    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Clear text    ${Price}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Input Text    ${Price}        ${at_price_value_input}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    wait until element is visible     ${AmountField}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${AmountField}
#    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Clear text    ${AmountField}    #Enter the crypto quantity.
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Input Text    ${AmountField}    ${amount_value_input}    #Enter the crypto quantity.
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    wait until element is visible     ${PlaceOrder}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${PlaceOrder}    #Click on exchange Sell Tab
    Swipe to Confirm  ${SwipeElement}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    wait until element is visible     ${ConfirmOrd}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${ConfirmOrd}

#    ${message}=     Toast_message_capture
#    [Return]        ${message}

orderplacing StopLimitSell
    [Arguments]     ${Market}      ${Coin}     ${stoplimit_price_input}     ${at_price_value_input}       ${amount_value_input}
#    Select MarketandQuote       ${Market}    ${Coin}
    Goto BuySellTray
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${Sell}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    wait until element is visible     ${LimitDropDown}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${LimitDropDown}

    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    wait until element is visible     ${StopLimitDD}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${StopLimitDD}

    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    wait until element is visible     ${AtPrice}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${AtPrice}
#    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Clear text    ${Price}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Input Text    ${AtPrice}         ${stoplimit_price_input}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    wait until element is visible     ${Price}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${Price}
#    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Clear text    ${Price}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Input Text    ${Price}        ${at_price_value_input}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    wait until element is visible     ${AmountField}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${AmountField}
#    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Clear text    ${AmountField}    #Enter the crypto quantity.
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Input Text    ${AmountField}    ${amount_value_input}    #Enter the crypto quantity.
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    wait until element is visible     ${PlaceOrder}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${PlaceOrder}    #Click on exchange Sell Tab
    Swipe to Confirm  ${SwipeElement}
#    ${message}=     Toast_message_capture
#    [Return]        ${message}



CancellAllOpenOrders
    Sleep    2s
    Goto MyOrders
    Goto OpenTab

    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${Cancellallbtn}
    Run Keyword If    '${Status}' == 'True'      click element       ${Cancellallbtn}
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${CancelallOpen}
    Run Keyword If    '${Status}' == 'True'      click element       ${CancelallOpen}

    Goto MyOrders
    Sleep    4s
    Goto HistoryTab
    #Swipe
    ${Status}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${CancelledLable}
    Should be equal     ${Status}        CANCELLED
    Goto Orders


CancelSingleOrder
    Sleep    2s
    Goto MyOrders
    Goto OpenTab
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${CancelOrderBtn}
    Run Keyword If    '${Status}' == 'True'      click element       ${CancelOrderBtn}

    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${ConfirmCancelorder}
    Run Keyword If    '${Status}' == 'True'      click element       ${ConfirmCancelorder}
    Goto MyOrders
    Sleep    2s
    Goto HistoryTab
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    wait until element is visible      ${CancelledLable}
    ${Status}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${CancelledLable}
    Should Be Equal As Strings     ${Status}       CANCELLED


Get Lowest Price
    Goto BuySellTray
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    wait until element is visible     ${Buy}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${Buy}    #Click on exchange Sell Tab

    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    wait until element is visible     ${Price}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${Price}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Input Text    ${Price}    0
    Sleep       2s
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    wait until element is visible     ${LowestPrice}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${LowestPrice}    #Click on exchange Highest Price Tab
    ${GetLowestPrice}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${Price}    #Get Highest price
    Set Global Variable    ${GetLowestPrice}
    Log To Console      ${GetLowestPrice}    #Click on exchange Lowest Price Tab

Validate Lowest Price
#    Goto Orders
    Get Lowest Price
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    wait until element is visible     ${AmountField}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${AmountField}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Input Text    ${AmountField}    ${amount_value_input}    #Enter the crypto quantity.
    ${CalculatedINR}=    Evaluate    ${GetLowestPrice}*${amount_value_input}
    ${Amount}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${TotalINR}    #Get Total INR price
    ${FinalAmount}=    Remove String    ${Amount}    ,
    Should be equal as numbers    ${CalculatedINR}    ${FinalAmount}    precision=2
    Log    Successfully calculated

#    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${Background}
#    Run Keyword If    '${Status}' == 'True'      click element       ${Background}
    Go Back

Get Highest Price
    Goto BuySellTray
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    wait until element is visible     ${Sell}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${Sell}    #Click on exchange Sell Tab

    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    wait until element is visible     ${Price}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${Price}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Input Text    ${Price}    0
    Sleep   2s
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    wait until element is visible         ${HighestPrice}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${HighestPrice}    #Click on exchange Highest Price Tab
    ${GetHighestPrice}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${Price}    #Get Highest price
    Set Global Variable    ${GetHighestPrice}
    Log To Console      ${GetHighestPrice}
#    Should be equal as numbers    ${GetHighestPrice}    ${at_price_value_input}    precision=2
#    Log    Successfully calculated


Validate Highest Price
#    Goto Orders
    Get Highest Price
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    wait until element is visible     ${AmountField}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${AmountField}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Input Text    ${AmountField}    ${amount_value_input}    #Enter the crypto quantity.
    ${CalculatedINR}=    Evaluate    ${GetHighestPrice}*${amount_value_input}
    ${Amount}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${TotalINR}    #Get Total INR price
    ${FinalAmount}=    Remove String    ${Amount}    ,
    Should be equal as numbers    ${CalculatedINR}    ${FinalAmount}    precision=2
    Log    Successfully calculated
#    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${Background}
#    Run Keyword If    '${Status}' == 'True'      click element       ${Background}
    Go Back

Validate Buy Percent
    Goto BuySellTray
    Get Lowest Price
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${SpendAll}    #Click on exchange Lowest Price Tab
    ${Amount}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${TotalINR}    #Get Total INR price
    ${FinalAmount}=    Remove String    ${Amount}    .
    ${CalculatedCrypto}=    Evaluate    ${FinalAmount}/${GetLowestPrice}
    log    ${CalculatedCrypto}
    ${CryptoQuantity}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${AmountField}    #Get crypto quantity
    Should be equal as numbers    ${CalculatedCrypto}    ${CryptoQuantity}    precision=4
    Log    Successfully calculated


Validate Sell Percent
    Goto BuySellTray
    Get Highest Price
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${SellAll}    #Click on Sell All
    ${Amount}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${TotalINR}    #Get Total INR price
    ${FinalAmount}=    Remove String    ${Amount}    .
    ${CalculatedQuantity}=    Evaluate    ${FinalAmount}/${GetHighestPrice}
    Log    ${CalculatedQuantity}
    ${Quantity}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${QuantityField}    #Get crypto quantity
    Should be equal as numbers    ${CalculatedQuantity}    ${Quantity}    precision=4
    Log    Successfully calculated



SearchCurrency
    [Arguments]     ${Coin}
    ClickSearchIcon
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    input text     ${SearchField}       ${Currency}
    CloseKeyboard
    Sleep   1s
    FOR        ${i}    IN RANGE     0      10
        ${result}    Run Keyword And Return Status    wait until keyword succeeds    ${RetryMinCount}    ${RetryIntervalMin}    wait until element is visible     ${Coin}    #Click on settings back button
        Run Keyword If    '${result}' == 'True'     click element    ${BaseM}      ELSE      VerticleDownSwipe
        Exit For Loop If    '${result}' == 'True'
    END
    Sleep  2s


############# Swipe To Confirm ###############

Swipe to Confirm
    [Arguments]       ${SwipeElement}
    wait until element is Visible     ${SwipeElement}
    ${element_size}=    Get Element Size    ${SwipeElement}
    ${element_location}=    Get Element Location    ${SwipeElement}
    ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.1)
    ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.1)
#    ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 1)
    ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.1)
    Swipe               ${start_x}    ${start_y}   900   ${end_y}   3500


##################### Market Bottom Tabs ##############################
Goto Charts
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${Charts}
    Run Keyword If    '${Status}' == 'True'      click element       ${Charts}

Goto Trades
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${Trades}
    Run Keyword If    '${Status}' == 'True'      click element       ${Trades}

Goto MyOrders
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${MyOrders}
    Run Keyword If    '${Status}' == 'True'      click element       ${MyOrders}


Goto Orders
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${Orders}
    Run Keyword If    '${Status}' == 'True'      click element       ${Orders}


Goto BuySellTray
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${Buy/Sell}
    Run Keyword If    '${Status}' == 'True'      click element       ${Buy/Sell}

Select StopLimit
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    wait until element is visible     ${LimitDropDown}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${LimitDropDown}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${StopLimitDD}



##################### Exchange Top Tabs ##############################

Goto INRTab
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${EXINR}
    Run Keyword If    '${Status}' == 'True'      click element       ${EXINR}

Goto USDTTab
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${EXUSDT}
    Run Keyword If    '${Status}' == 'True'      click element       ${EXUSDT}


Goto BTCTab
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${EXBTC}
    Run Keyword If    '${Status}' == 'True'      click element       ${EXBTC}


Goto P2PTab
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${EXP2P}
    Run Keyword If    '${Status}' == 'True'      click element       ${EXP2P}

Goto WRXTab
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${EXWRX}
    Run Keyword If    '${Status}' == 'True'      click element       ${EXWRX}


Goto FavTab
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    wait until element is visible     ${EXFav}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${EXFav}    #Click on fav  Tab

Goto OpenTab
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${OpenTab}
    Run Keyword If    '${Status}' == 'True'      click element       ${OpenTab}


Goto HistoryTab
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${HistoryTab}
    Run Keyword If    '${Status}' == 'True'      click element       ${HistoryTab}


Goto ExchangeTab
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${ExchangeTab}
    Run Keyword If    '${Status}' == 'True'      click element       ${ExchangeTab}



Validate OrderTab
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${OrdersTab}
    Run Keyword If    '${Status}' == 'True'      click element       ${OrdersTab}
    Goto HistoryTab
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    wait until element is visible      ${CompletedOdrBtn}
    ${Status}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${CompletedOdrBtn}
    Should Be Equal As Strings     ${Status}       COMPLETED

Add/Remove Favourite Star icon click
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${Favbtn}
    Run Keyword If    '${Status}' == 'True'      click element       ${Favbtn}

    wait until keyword succeeds    ${RetryMinCount}    ${RetryIntervalMin}    click element    ${back}
    Sleep    2s
#    Goto FavTab

Validate Favourite Badge
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${FavBadge}
    Run Keyword If    '${Status}' == 'True'      Log    Pass

Validate Blank FavTabMessage
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${BlankFavMessage}
    Run Keyword If    '${Status}' == 'True'      Log    Pass
    ${Msg}    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Get Text    ${BlankFavMessage}
    Log to console    ${Msg}


#ScrolltillCoin
#    [Arguments]         ${locator}
#    Sleep   2s
#    FOR        ${i}    IN RANGE     0      10
#        ${result}    Run Keyword And Return Status    wait until keyword succeeds    ${RetryMinCount}    ${RetryIntervalMin}    wait until element is visible     ${locator}    #Click on settings back button
#        Run Keyword If    '${result}' == 'False'   VerticleSwipe
#        Run Keyword If    '${result}' == 'True'     click element    ${Coin}
##        ${i}=      Set Variable        ${i}+1
#    END

LongPressCoin
    Long Press          ${Coin}         2000

VerticleDownSwipe
    Swipe      470    1500    470    800        1000
    Sleep   1s

HorizontalSwipeRightToLeft
    Swipe      53     485    900     485    1500
    Sleep   2s

ClickSearchIcon
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${SearchIcon}
    Run Keyword If    '${Status}' == 'True'      click element       ${SearchIcon}


OrderplacingLimitSellll
    [Arguments]     ${Market}      ${Coin}     ${at_price_value_input}       ${amount_value_input}
    Goto BuySellTray
    Sleep       1s

    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${Sell}
    Run Keyword If    '${Status}' == 'True'      click element       ${Sell}

    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${Price}
    Run Keyword If    '${Status}' == 'True'      click element       ${Price}
#    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Clear text    ${Price}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Input Text    ${Price}        ${at_price_value_input}

    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${AmountField}
    Run Keyword If    '${Status}' == 'True'      click element       ${AmountField}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Input Text    ${AmountField}    ${amount_value_input}    #Enter the crypto quantity.

    ${Status}    Run Keyword And Return Status    wait until keyword succeeds     ${RetryMaxCount}    ${RetryIntervalMax}    page should contain element    ${PlaceOrder}
    Run Keyword If    '${Status}' == 'True'      click element       ${PlaceOrder}

    Swipe to Confirm  ${SwipeElement}







