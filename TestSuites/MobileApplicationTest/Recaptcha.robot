*** Settings ***
Suite Setup       #Launch App
Suite Teardown    Close Application
Test Teardown
Resource          ../../~DEPENDENCIES.txt

*** Test Cases ***
InvalidUsernameAndPassword
    [Tags]    SanityTest
    [Setup]
    Log    Test
    Login    ${InvalidEmail}    ${InvalidPassword}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Element should contain text    ${LoginErrorContainer}    ${LoginErrorMsg}    Message=Validation failed

Validate Invalid Username valid Password
    [Tags]    SanityTest
    #Go To    ${url}
    Login    ${InvalidEmail}    ${Password}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Element should contain text    ${LoginErrorContainer}    ${LoginErrorMsg}    Message=Validation failed

Validate Valid username invalid Password
    [Tags]    SanityTest
    #Go To    ${url}
    Login    ${Email}    ${InvalidPassword}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Element should contain    ${LoginErrorContainer}    ${LoginErrorMsg}    Message=Validation failed

Validate invalid OTP
    [Tags]    SanityTest
    #Go To    ${url}
    Login    ${Email}    ${Password}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    input text    xpath=//input[@type="tel"]    ${invalidOTP}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    xpath=//p[contains(text(),"Authenticate")]
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    Element should contain    ${Login['OTPError']}    ${OTPErrorMsg}    Message=Validation failed

Validate Contest Navigation
    [Tags]    SanityTest
    Go To    ${url}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    xpath=//a[@href='/exchange']    #css=ul li:nth-of-type(1)
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    xpath=//a[@href='/wrx-mining']    #css=ul li:nth-of-type(2)

Validate WRXMining Navigation
    [Tags]    SanityTest
    Go To    ${url}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    xpath=//a[@href='/exchange']    #css=ul li:nth-of-type(1)
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    xpath=//a[@href='/contest']    #css=ul li:nth-of-type(1)


