*** Settings ***
Suite Setup       Begin With BrowserStack
Suite Teardown    Close App
#Test Setup        Login Wazirx Application
#Test Teardown       Logout
Resource          ../../~DEPENDENCIES.txt


*** Test Cases ***
HideLowBalance
    [Tags]      Sanity          Funds
    Go Back
    GoTo FundsTab
    hidelowbal

VerifyBTCFundsDeposite
    [Tags]      Sanity          Funds
#    Go Back
#    GoTo FundsTab
    Select BTC
    Tap DepositBtn
    Validate DepositFields
    Go Back

VerifyBTCFundsWithdraw
    Tap WithdrawBtn
    Validate Withdraw fields

#Validate End To End BTC Withdraw

ValidateXRPFundsDeposite
    [Tags]      Sanity          Funds
    Go Back
    GoTo FundsTab
    Select XRP
    Tap DepositBtn
    Validate XRP DepositFields

#ValidateXRPFundsWithdraw
    Tap WithdrawBtn
    Validate XRP WithdrawFields
    Validate Withdraw


#Validate End To End XRP Withdraw

ValidateRapidListing
    [Tags]      Sanity          Funds
#    Go Back
#    GoTo FundsTab
    FundSearchCoins     ${ClickFundsCoin}
    Sleep   2s
    Validate Rapid ListingCoin
    Go Back


FundSearchCoin
    [Tags]      Sanity          Funds
#    Go Back
#    GoTo FundsTab
    FundSearchCoins     ${ClickFundsCoin}
    Sleep   2s
    Go Back


