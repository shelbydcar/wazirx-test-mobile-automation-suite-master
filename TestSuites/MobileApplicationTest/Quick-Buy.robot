*** Settings ***
Suite Setup       Begin With BrowserStack
Suite Teardown    Close App
#Test Setup        Login Wazirx Application
#Test Teardown       Logout
Resource          ../../~DEPENDENCIES.txt


*** Test Cases ***
NavigateFilters
    [Tags]      Sanity          QuickBuy
    orderplacing LimitBuy      ${Market}      ${Coin}     25       10
#    Sleep  3s
    orderplacing LimitSell      ${Market}      ${Coin}     105       10
    Sleep  3s
    Go Back
    GoTo QuickBuy Tab

    Goto FilterDrpDown
    Select MostTraded Filter
    Goto FilterDrpDown
    Select LeastTraded Filter
    Goto FilterDrpDown
    Select TopGainers Filter
    Goto FilterDrpDown
    Select TopLoosers Filter
    Goto FilterDrpDown
    Select HighestPrice Filter
    Goto FilterDrpDown
    Select LowestPrice Filter
    Goto FilterDrpDown
    Select SetToDefault Filter
    Sleep   3s




ValidateBuyTabToWalletNavigation
    [Tags]      Sanity          QuickBuy
    Validate SearchCoin     ${ClickQuickBuyCoin}
    GoTo BuyTab
    Tap on CurrentBalance
    Validate INR Wallet
    Go Back


ValidateSellTabToWalletNavigation
    [Tags]      Sanity          QuickBuy
    GoTo SellTab
    Tap on CurrentBalance
    Validate QuoteMartket Wallet
    Go Back
    Go Back
    Go Back

ValidatePreviewSell
    [Tags]      Sanity          QuickBuy
    Go Back
    GoTo QuickBuy Tab
    Sleep   7s
    Validate SearchCoin     ${ClickQuickBuyCoin}
    GoTo SellTab
    Sell Preview
    Go Back
    Go Back

ValidatePreviewBuy
    [Tags]      Sanity          QuickBuy
    Go Back
#    GoTo QuickBuy Tab
    Validate SearchCoin     ${ClickQuickBuyCoin}
    GoTo BuyTab
    Buy Preview
    sleep   2s
    Go Back
    Go Back
    Go Back


#ValidateQuickBuySearchCoin
#    [Tags]      Sanity          QuickBuy
#    Go Back
#    GoTo QuickBuy Tab
#    Validate SearchCoin     ${ClickQuickBuyCoin}
#    Sleep    3s

#




