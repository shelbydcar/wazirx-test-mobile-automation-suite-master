*** Settings ***
Resource          ../../~DEPENDENCIES.txt
Library           Process
Library           ${CURDIR}/CustomLibrary.py
Library           CustomLibrary.CustomLib
Library             AppiumLibrary
Library                OTP



*** Variables ***
${BROWSER OPEN}    'CLOSED'


*** Keywords ***
Login
    [Arguments]    ${Email}    ${Password}
    [Documentation]    This keyword will Login to Account
    Run Keyword If    '${Settings}'=='id=com.wrx.wazirx.stage:id/toolbar_button_settings'       Goto SettingsLogin      ELSE    Goto ProcessLogin
#    Run Keyword If    '${LoginO}'=='xpath=//android.widget.TextView[@text="LOGIN"]'       Goto ProcessLogin
#    wait until keyword succeeds    ${RetryMinCount}    ${RetryIntervalMin}    click element    ${back}    #Click on submit

Login Wazirx Application
    Login    ${Email}    ${Password}
    Sleep   2s
    Authenticator OTP
    Sleep   3s
    Goto HomePage
    Initialized Base and Quote    ${Market}
Logout
    Goto Settings
    Sleep   2s
    FOR        ${i}    IN RANGE     0      10
        ${result}    Run Keyword And Return Status    wait until keyword succeeds    ${RetryMinCount}    ${RetryIntervalMin}    wait until element is visible     ${Logout}    #Click on settings back button
        Run Keyword If    '${result}' == 'True'     click element    ${Logout}      ELSE      VerticleDownSwipe
        Exit For Loop If    '${result}' == 'True'
    END
    wait until keyword succeeds    ${RetryMinCount}    ${RetryIntervalMin}    click element    ${Confirm_Logout}

Goto Settings
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    wait until element is visible     ${Settings}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${Settings}

Goto SettingsLogin
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    wait until element is visible     ${Settings}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${Settings}
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    wait until element is visible     ${Login}
    wait until keyword succeeds    ${RetryMinCount}    ${RetryIntervalMin}    click element    ${Login}    #Click on Login
    wait until keyword succeeds    ${RetryMinCount}    ${RetryIntervalMin}    input text    ${UserName}    ${Email}    #enter username
    wait until keyword succeeds    ${RetryMinCount}    ${RetryIntervalMin}    input password    ${PasswordKey}    ${Password}    #enter password
    wait until keyword succeeds    ${RetryMinCount}    ${RetryIntervalMin}    click element    ${Submit}    #Click on submit



Goto ProcessLogin
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    wait until element is visible     ${Submit}
    wait until keyword succeeds    ${RetryMinCount}    ${RetryIntervalMin}    click element    ${Submit}    #Click on Login
#    wait until keyword succeeds    ${RetryMinCount}    ${RetryIntervalMin}    click element    ${Login}    #Click on Login
    wait until keyword succeeds    ${RetryMinCount}    ${RetryIntervalMin}    input text    ${UserName}    ${Email}    #enter username
    wait until keyword succeeds    ${RetryMinCount}    ${RetryIntervalMin}    input password    ${PasswordKey}    ${Password}    #enter password
    wait until keyword succeeds    ${RetryMinCount}    ${RetryIntervalMin}    click element    ${Submit}    #Click on submit



Goto HomePage
    ${Status}    Run Keyword And Return Status    wait until keyword succeeds    ${RetryMinCount}    ${RetryIntervalMin}    page should contain element    ${SettingsBackButton}    #Click on settings back button
    Run keyword if    '${Status}'=='True'    click element    ${SettingsBackButton}    #Click on settings back button

Launch WazirX Application
    Open Application    ${Host}    platformName=${PlatformName}    platformVersion=${PlatformVersion}    deviceName=${DeviceName}    app=${App}    automationName=appium    appPackage=${appPackage}    noreset=true


Launch App In BrowserStack
    Open application    http://trupti45:9fNqHzpy9EooAfU5wqDW@hub-cloud.browserstack.com/wd/hub    realMobile=true    device=${BrowserStackDeviceName}    app=bs://b2e1a6e233cabdab7bff0f503c1c5a5e62905d04    platformName=${PlatformName}    platformVersion=${PlatformVersion}    project=WazirX    build=${buildversion}    browserstack.maskCommands=setValues,getValues,setCookies,getCookies

Launch App
    Run Keyword If    '${Login_Type}'=='LOCAL'    Launch WazirX Application
    Run Keyword If    '${Login_Type}'=='BROWSERSTACK'    Launch App In BrowserStack





App upload
#    [Arguments]    ${buildNo}
#    ${auth}    Create List    trupti45    9fNqHzpy9EooAfU5wqDW
#    create session    alias=browserStack    url=https://api-cloud.browserstack.com/app-automate    auth=${auth}
#    ${headers}=    Create Dictionary    Content-Type    multipart/form-data
#    ${file}    Get File For Streaming Upload    /Users/sumods/Desktop/wazirx-test-automation-suite-master/Common/Keywords/WazirX-stage480.apk
#    ${req_body}    Get File    /Users/sumods/Desktop/wazirx-test-automation-suite-master/Common/Keywords/WazirX-stage480.apk
#    ${response}    POST     alias=browserStack    uri=/upload    headers=${headers}    files=${file}    #json={"file":"./WazirXStage.apk"}
#    ${response}    POST    alias=browserStack    uri=/upload    ${req_body}    headers=${headers}
#    log    ${response.json()
    ${response}    RUN PROCESS    curl    -u    "trupti45:9fNqHzpy9EooAfU5wqDW"    -X    POST    "https://api-cloud.browserstack.com/app-automate/upload"    -F    "file\=@/Users/sumods/Desktop/wazirx-test-automation-suite-master/Common/Keywords/WazirX-stage495.apk"

    Log to console         ${response}
#    ${result}=    Convert String to JSON    ${response.stdout}
#    ${oldAppid}    Get Value From Json    ${response.stdout}    /app_url    #id
#    log    ${oldAppid}


#    Return From Keyword    ${Appid}


Create Multi Part
    [Arguments]    ${addTo}    ${partName}    ${filePath}
    ${contentType}    ${content}=${None}
    ${fileData}=    Run Keyword If    '''${content}''' != '''${None}'''    Set
    Variable    ${content}
    ...    ELSE    Get Binary File    ${filePath}
    ${fileDir}    ${fileName}=    Split Path    ${filePath}
    ${partData}=    Create List    ${fileName}    ${fileData}    ${contentType}
    Set To Dictionary    ${addTo}    ${partName}=${partData}

Get OTP
    Open Mailbox    host=imap.gmail.com    user=${Email}    password=${Password}
    log    mail opened
    #Open Mailbox    server=imap.yahoo.com    user=truptisalvi@yahoo.com    password=Crowdfire@123
    ${LATEST}    Wait For Email    sender=noreply@wazirx.com    subject=WazirX - OTP for Two Factor Authentication (2FA)    timeout=300
    ${emailBody}    Get email body    ${LATEST}
    log    ${emailBody}
    ${temp}    Convert To Bytes    ${emailBody}    input_type=text
    ${code}    Get Regexp Matches    ${emailBody}    <b>(......)</b>    1
    log many    ${code}    @{code}[0]
    Delete email    ${LATEST}
    Delete All emails
    Close Mailbox
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    input text    ${OTP}    @{code}[0]
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${Authenticate}

Authenticator OTP
#    [Arguments]    ${SectCode}
    ${AuthOTP}    CustomLibrary.CustomLib.Authenticator Otp      ${Authcode}
    Sleep    3s
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    input text     ${OTP}    ${AuthOTP}
    Sleep   2s
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${Authenticate}



Get Email Approval
    Open Mailbox    host=imap.gmail.com    user=${Email}    password=${GPassword}
    log    mail opened
    #Open Mailbox    server=imap.gmail.com    user=truptisalvi@yahoo.com    password=Crowdfire@123
    ${LATEST}    Wait For Email    sender=noreply@wazirx.com    subject=Confirm Your Withdrawal Request    timeout=300
    ${emailBody}    Get email body    ${LATEST}
    log    ${emailBody}
    ${temp}    Convert To Bytes    ${emailBody}    input_type=text
    ${code}    Get Regexp Matches    ${emailBody}    <b>(......)</b>    1
    log many    ${code}    @{code}[0]
    Delete email    ${LATEST}
    Delete All emails
    Close Mailbox
    #wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    input text    ${OTP}    @{code}[0]
    #wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element    ${Authenticate}






Close App
#    Logout
    Close Application

Begin With BrowserStack
    Launch App
    Login Wazirx Application



ScrolldowntillCoin
    [Arguments]         ${Coin}
    Sleep   2s
    FOR        ${i}    IN RANGE     0      10
        ${result}    Run Keyword And Return Status    wait until keyword succeeds    ${RetryMinCount}    ${RetryIntervalMin}    wait until element is visible     ${Coin}
        Run Keyword If    '${result}' == 'True'     click element    ${Coin}      ELSE      VerticleDownSwipe
        Exit For Loop If    '${result}' == 'True'
    END

Initialized Base and Quote
    [Arguments]       ${Market}
    Run keyword If      "${Market}" == 'INR'      select INR tab
    Run keyword If      "${Market}" == 'USDT'     select USDT tab
    Run keyword If      "${Market}" == 'WRX'      select WRX tab
    Run keyword If      "${Market}" == 'BTC'      select BTC tab


select INR tab
    ${Market}=      Set Variable        ${EXINR}
    ${Market_type}=      Set Variable        INR
    ${min_Buy_value}=       Set Variable        Minimum buy amount must be worth 50.0 INR
    ${min_sell_value}=      Set Variable        Minimum sell amount must be worth 50.0 INR
    Set Global Variable     ${Market}
    Set Global Variable     ${Market_type}
    Set Global Variable     ${min_Buy_value}
    Set Global Variable     ${min_sell_value}
    Goto INRTab
    ScrolldowntillCoin      ${Coin}
#    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}     Wait Until Element Is Visible    ${Coin}
#    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element     ${Coin}


select USDT tab
    ${Market}=      Set Variable        ${EXUSDT}
    ${Market_type}=      Set Variable        USDT
    ${min_Buy_value}=       Set Variable        Minimum buy amount must be worth 2.0 USDT
    ${min_sell_value}=      Set Variable        Minimum sell amount must be worth 2.0 USDT
    Set Global Variable     ${Market}
    Set Global Variable     ${Market_type}
    Set Global Variable     ${min_Buy_value}
    Set Global Variable     ${min_sell_value}
    Goto USDTTab
    ScrolldowntillCoin      ${Coin}


select WRX tab
    ${Market}=      Set Variable        ${EXWRX}
    ${Market_type}=      Set Variable        WRX
    ${min_Buy_value}=       Set Variable        Minimum buy amount must be worth 1.0 WRX
    ${min_sell_value}=      Set Variable        Minimum sell amount must be worth 1.0 WRX
    Set Global Variable     ${Market}
    Set Global Variable     ${Market_type}
    Set Global Variable     ${min_Buy_value}
    Set Global Variable     ${min_sell_value}
    Goto WRXTab
    ScrolldowntillCoin      ${Coin}


select BTC tab
    ${Market}=      Set Variable        ${EXBTC}
    ${Market_type}=      Set Variable        BTC
    Set Global Variable     ${Market}
    Set Global Variable     ${Market_type}
    Goto BTCTab
    ScrolldowntillCoin      ${Coin}
#    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}     Wait Until Element Is Visible    ${Coin}
#    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    click element     ${Coin}

Toast_message_capture
    #${message}      wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}      Get text    ${pop_up_message}
    ${message}       wait until keyword succeeds    2x    strict: 1000 ms      Get text    ${pop_up_message}
    Run keyword If      "${message.strip()}" == '${EMPTY}'   RetryCaptureText
    log to console    Text msg recd @1= ${message}
    [Return]        ${message}


CloseKeyboard
    Hide Keyboard       None


Get OTP from secret
    ${otp}=    Get OTP    ${SECRET}
    Should Match Regexp       ${otp}


Signin with non kyc accnt
    wait until keyword succeeds    ${RetryMaxCount}    ${RetryIntervalMax}    wait until element is visible     ${Login}
    wait until keyword succeeds    ${RetryMinCount}    ${RetryIntervalMin}    click element    ${Login}    #Click on Login
    wait until keyword succeeds    ${RetryMinCount}    ${RetryIntervalMin}    input text    ${UserName}    ${NonKYCEmail}    #enter username
    wait until keyword succeeds    ${RetryMinCount}    ${RetryIntervalMin}    input password    ${PasswordKey}    ${NonKYCPassword}    #enter password
    wait until keyword succeeds    ${RetryMinCount}    ${RetryIntervalMin}    click element    ${Submit}