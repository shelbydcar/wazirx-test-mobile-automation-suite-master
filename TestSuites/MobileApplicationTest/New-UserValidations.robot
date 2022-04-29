*** Settings ***
Suite Setup       Begin With BrowserStack
Suite Teardown    Close App
#Test Setup        Login Wazirx Application
#Test Teardown       Logout
Resource          ../../~DEPENDENCIES.txt

*** Test Cases ***
VerifyLoginFromSettingsPage
    [Tags]      Sanity          NewUser
    Go Back
    Logout
    Click Login
    Validate LoginPage Content
    Validate InviteEarnToLogin
    Validate LearnCryptooToLogin
    Go Back

VerifyLoginfromQBSTab
    [Tags]      Sanity          NewUser
#    Go Back
#    Logout
    GoTo QuickBuy Tab
    Tap BuyBtn
    Validate LoginPage Content


VerifyLoginfromExchangeTab
    [Tags]      Sanity          NewUser
#    Go Back
#    Logout
    Goto ExchangeTab
    SearchCurrency      ${Coin}
    Goto BuySellTray
    Validate LoginPage Content
    Go Back
    Go Back

VerifyLoginfromOrdersTab
    [Tags]      Sanity          NewUser
#    Go Back
#    Logout
    Go To Orders Tab
    Click empty Login
    Validate LoginPage Content

VerifyLoginfromFundsTab
    [Tags]      Sanity          NewUser
#    Go Back
#    Logout
    GoTo FundsTab
    Click empty Login
    Validate LoginPage Content








