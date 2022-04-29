*** Variables ***
${Environment}    LOCAL
#${DESIRED_CAPABILITIES_OLD}    name:CrowdfireWebApplication Test, appiumVersion:${appiumVersion} ,deviceName:${DeviceName} ,deviceOrientation: portrait,platformName:${Platform} ,platformVersion:5.1, app:/Users/truptisalvi/AutomationTestSuite/apk/justUnFollow-release.apk, javascriptEnabled:True
#${DESIRED_CAPABILITIES}    name:CrowdfireWebApplication Test,testobject_api_key:${testobject_api_key} ,Platform:${Browser},appiumVersion:${appiumVersion},deviceName:${DeviceName},deviceType:phone, deviceOrientation:portrait, platformName:${PlatformName}, platformVersion:${PlatformVersion},browserName:${Browser},app:${MobileApp},javascriptEnabled:True
#${DESIRED_CAPABILITIES}    testobject_api_key:07DAAE2A96744AA8BA8F0096123D38EB,platformName:${PlatformName},platformVersion:${PlatformVersion},devicename:LG Nexus 5X,phoneOnly:true
#${DESIRED_CAPABILITIES}    devicename:LG Nexus 5X,browserName:DEviceName,platformName:${PlatformName},appPackage:${appPackage},appActivity:${appActivity}
#${DESIRED_CAPABILITIES}    deviceName=${DeviceName},browserName=${P_DeviceID},platformName=${PlatformName},appPackage=${AppPackage},appActivity=${AppActivity},rotatable=false
${REMOTE_URL}     http://localhost:4723/wd/hub
${Login_Type}     BROWSERSTACK    #LOCAL | #BROWSERSTACK
${RetryMinCount}    5
${RetryMaxCount}    8
${RetryIntervalMin}    15
${RetryIntervalMax}    20
#${Email}          qaautomation@wazirx.com
#${Password}       Password@123
#${Authcode}       4OXC5Q2YP3IVO65O
${Email}          qaautomation@wazirx.com  #accounts-group+automation@wazirx.com
${GPassword}      Wazirx@2018            #&qw12@30YUB^7
${Password}       Password@123
${Authcode}       4OXC5Q2YP3IVO65O
#THV74ILDAWAIZPRW3L2A
${InvalidEmail}    wazir@gmail.com
${InvalidPassword}    Password
${InvalidOTP}     123456
${LoginErrorMsg}    Your login credentials are incorrect, let's try again.
${OTPErrorMsg}    Incorrect or expired OTP
${SuccessMsg}     Order placed successfully
${DeviceName}     3001fe6f02824f9    #06e757e10591e5d0    #bce40585    #96c88d2e    #bce40585    #
${Mobile_Capabilities}    platformName:Android,platformVersion:5.0.2,deviceName:96c88d2e,app:/Users/truptisalvi/Automation Test Suite/apk/justUnFollow-release.apk,automationName=appium,appPackage:com.justunfollow.android
${PlatformVersion}    11.0
${PlatformName}    Android
${appPackage}     com.wrx.wazirx.stage
${Host}           http://localhost:4723/wd/hub
${App}            /Users/sumods/Desktop/wazirx-test-automation-suite-master/Common/Keywords/WazirX-stage_478.apk
${appiumVersion}    1.6.1
#${AppActivity}    shared.activity.SplashScreenActivity
${Appium}         https://us1.appium.testobject.com/wd/hub
${AccessKey}      syrcb6b8vr29bskbkg92p8kf
${BrowserStackUserName}    trupti@crowdfireapp.com
&{RealDevices}    Android4.4=Samsung Galaxy S5    Android5.0=Samsung Galaxy S6    Android6.0=Google Nexus 6    Android7.0=Samsung Galaxy S8    Android7.1=Google Pixel    Android8.0=Google Pixel 2
${Quantity}       0.05
${a}              6230
${b}              0.05
${buildversion}    2.6.4
${BrowserStackDeviceName}       OnePlus 9
#${BrowserStackAccessKey}        9fNqHzpy9EooAfU5wqDW
#${BrowserStackUserName}     trupti45
#${Host}           ${EMPTY}
#${SauceConnectCmd}    bin/sc -u SalviTrupti -k 8afe59ef-20f7-43c3-9c3a-a557378fcfe8    # \ pybot -s Compose Compose.txt \
#${testobject_api_key}    ED8253D95EDB4898BF62EFC5AA3E1DD5
${NonKYCEmail}          qaautomationwx@gmail.com
${NonKYCPassword}       Password@12345
