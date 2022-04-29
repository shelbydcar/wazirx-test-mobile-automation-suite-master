*** Settings ***
Suite Setup       Begin With BrowserStack
Suite Teardown    Close App
#Test Setup        Login Wazirx Application
#Test Teardown       Logout
Resource          ../../~DEPENDENCIES.txt


*** Test Cases ***
VerifyMobileNumber
    [Tags]    Sanity
    Go Back
    Goto Settings
    Validate Phone Number
    Go Back

VerifyInviteAndEarn
    [Tags]    Sanity
    Validate Invite and Earn
    Go Back

VerifyLearnCrypto
    [Tags]    Sanity
    Validate Learn Crypto
    Sleep   2s
    Go Back

VerifyCouponsAndContests
    [Tags]    Sanity
    Validate Coupons And Contests
    Go Back

VerifyPriceTrackingWidget
    [Tags]    Sanity
    Validate Price Tracking Widget
    Go Back

VerifyNotifications
    [Tags]    Sanity
    Validate Notifications
    Go Back

VerifyPreferences
    [Tags]    Sanity
    Validate Preferences
    Go Back

VerifyBankingAndPayment
    [Tags]    Sanity
    Validate Banking And Payment
    Go Back

VerifyAccountSecurity
    [Tags]    Sanity
    Validate AccountSecurity
    Go Back

VerifyFeesAndTrade
    [Tags]    Sanity
    VerticleDownSwipe
    Validate Fees And Trade
    Go Back

VerifyHelpAndSupport
    [Tags]    Sanity
    Validate Help And Support
    Go Back

VerifyLegal
    [Tags]    Sanity
    Validate Legal
    Go Back

VerifyLRateUs
    [Tags]    Sanity
    Validate Rate Us
    Go Back

VerifyLFollowUs
    [Tags]    Sanity
    Validate Follow Us
    Go Back
    Sleep  4s

#VarifyLogout



