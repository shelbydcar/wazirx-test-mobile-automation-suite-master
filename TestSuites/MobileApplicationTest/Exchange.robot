*** Settings ***
Suite Setup       Begin With BrowserStack
Suite Teardown    Close App
#Test Setup        Login Wazirx Application
#Test Teardown       Logout
Resource          ../../~DEPENDENCIES.txt
*** Variable ***
${at_price_value_input}         12
${amount_value_input}           10
#${stoplimit_price_input}        44
#${amount_value_input}           7
${Fav}                  Favourite
#${SearchCoinElement}        xpath=//android.widget.TextView[@text='ATOM']



*** Test Cases ***

CoinNavigationTabs
    [Tags]      Sanity      Exchange
    Goto Charts   #Click on    exchange Charts button
    Goto Trades    #Click on    exchange Trades button
    Goto MyOrders    #Click on    exchange MyOrders button
    Goto Orders    #Click on    exchange Orders button
#    Go Back

LimitBuyOrder
    [Tags]      Sanity      Exchange
    orderplacing LimitBuy       ${Market}      ${Coin}     ${at_price_value_input}       ${amount_value_input}
    CancellAllOpenOrders

LimitSellOrder
    [Tags]      Sanity      Exchange
    orderplacing LimitSell      ${Market}      ${Coin}     ${at_price_value_input}       ${amount_value_input}
    CancellAllOpenOrders
#    Should be equal      ${message}         'Message'

#StopLimitBuyOrder
#    [Tags]      Sanity     Exchange
#    orderplacing StopLimitBuy       ${Market}      ${Coin}      10      20      5
#    CancellAllOpenOrders

#StopLimitSellOrder
#    [Tags]      Sanity         Exchange
#    orderplacing StopLimitSell      ${Market}      ${Coin}      23      22      6
#    CancellAllOpenOrders


cancelLimitBuyOrder
    [Tags]      Sanity      Exchange
    orderplacing LimitBuy       ${Market}      ${Coin}     ${at_price_value_input}       ${amount_value_input}
    CancelSingleOrder


cancelLimitSellOrder
    [Tags]      Sanity      Exchange
    orderplacing LimitSell      ${Market}      ${Coin}     33       ${amount_value_input}
    CancelSingleOrder


CancellallOpenOrders
    [Tags]      Sanity      Exchange
    orderplacing LimitBuy       ${Market}      ${Coin}     10       ${amount_value_input}
    orderplacing LimitSell      ${Market}      ${Coin}     20       ${amount_value_input}
#    orderplacing StopLimitBuy       ${Market}      ${Coin}      10      20      5
#    orderplacing StopLimitSell      ${Market}      ${Coin}      23      22      6
    CancellAllOpenOrders


ValidateLowPrice
    [Tags]      Sanity      Exchange
    orderplacing LimitSell      ${Market}      ${Coin}     34       ${amount_value_input}
    orderplacing LimitSell      ${Market}      ${Coin}     24       ${amount_value_input}
    orderplacing LimitSell      ${Market}      ${Coin}     12        ${amount_value_input}
    Sleep       2s
    Validate Lowest Price
    CancellAllOpenOrders
#    Go Back

ValidateHighPrice
    [Tags]      Sanity      Exchange
    orderplacing LimitBuy      ${Market}      ${Coin}     44       ${amount_value_input}
    orderplacing LimitBuy      ${Market}      ${Coin}     54       ${amount_value_input}
    orderplacing LimitBuy      ${Market}      ${Coin}     98       ${amount_value_input}
    Sleep       2s
    Validate Highest Price
    CancellAllOpenOrders
#    wait until keyword succeeds    ${RetryMinCount}    ${RetryIntervalMin}    click element    ${back}

AddRemoveCoinToFavourite
    [Tags]      Sanity      Favourites
    Add/Remove Favourite Star icon click
    Validate Favourite Badge
    HorizontalSwipeRightToLeft          #GoTo Fav Tab
    Sleep    2s
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${BaseM}
    Add/Remove Favourite Star icon click
    Validate Blank FavTabMessage

OrderTabValidation
    SearchCurrency      ${Coin}
    sleep   1s
    orderplacing LimitBuy       ${Market}      ${Coin}     ${at_price_value_input}       ${amount_value_input}
    Sleep    1s
    OrderplacingLimitSellll      ${Market}      ${Coin}     ${at_price_value_input}       ${amount_value_input}
    Sleep    1s
    wait until keyword succeeds    ${RetryMinCount}    ${RetryIntervalMin}    click element    ${back}
    Sleep    1s

    wait until keyword succeeds    ${RetryMinCount}    ${RetryIntervalMin}    click element    ${back}
    Sleep    1s
    Validate OrderTab


NavigateBaseMarket
    [Tags]      Sanity      Exchange
    Goto ExchangeTab
    Goto BTCTab    #Click on    exchange BTC tab
    Goto INRTab   #Click on    exchange INR tab
    Goto USDTTab    #Click on    exchange USDT tab
    Goto P2PTab     #Click on    exchange P2P tab

#
SearchCoin
    [Tags]      Sanity          Exchange
#    Go Back
    SearchCurrency      ${Coin}
    Go Back
    Go Back

