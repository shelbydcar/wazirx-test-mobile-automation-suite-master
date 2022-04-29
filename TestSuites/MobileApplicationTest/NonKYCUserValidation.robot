*** Settings ***
Suite Setup       Begin With BrowserStack
Suite Teardown    Close App
#Test Setup        Login Wazirx Application
#Test Teardown       Logout
Resource          ../../~DEPENDENCIES.txt


*** Test Cases ***
VerifyKYCFromSettingsPage
    [Tags]      Sanity          NewUser
    Go Back
    Logout
    Signin with non kyc accnt
    Validate InviteEarnToK
    Validate LearnCryptooToLogin
    Go Back

VerifyKYCfromQBSTab
    [Tags]      Sanity          NewUser
    Go Back
    Logout
    Signin with non kyc accnt
    Sleep   5s
    Go Back
    GoTo QuickBuy Tab
    Tap BuyBtn
    Validate Verify Account Page


VerifyKYCfromExchangeTab
    [Tags]      Sanity          NewUser
#    Go Back
#    Logout
    Goto ExchangeTab
    SearchCurrency      ${Coin}
    Goto BuySellTray
    Validate LoginPage Content
    Go Back
    Go Back

VerifyKYCfromOrdersTab
    [Tags]      Sanity          NewUser
#    Go Back
#    Logout
    Go To Orders Tab
    Click empty Login
    Validate LoginPage Content

VerifyKYCfromFundsTab
    [Tags]      Sanity          NewUser
#    Go Back
#    Logout
    GoTo FundsTab
    Click empty Login
    Validate LoginPage Content
