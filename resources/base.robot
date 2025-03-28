***Settings***
Library     AllureLibrary
Library     AppiumLibrary
Library     BuiltIn
Library     Collections
Library     DateTime
Library     FakerLibrary         locale=pt_BR
Library     Process
Library     RequestsLibrary
Library     String
Library     ../Library/AppiumLibraryHelper.py

Resource    helpers_keywords.robot
Resource    logged_out_keywords.robot
Resource    login_keywords.robot
Resource    onboard_keywords.robot

***Variables***

${BROWSER_STACK_USERNAME}           rodolfoholytrugi1
${BROWSER_STACK_ACCESS_KEY}         ygspmnogektCsdsqiMPM
${BROWSER_STACK_URL}                http://${BROWSER_STACK_USERNAME}:${BROWSER_STACK_ACCESS_KEY}@hub-cloud.browserstack.com/wd/hub

***Keywords***
Set Browserstack App
    Set Suite Variable              ${APP_URL}          bs://0b6229b498487a2b75a0441518945f287091287e

#Set build name to run on Browserstack
Set Build Name
    ${isEmpty}                      Run Keyword And Return Status          Variable Should Not Exist       ${run_number}
    Run Keyword If                  '${isEmpty}'=='True'                   Set Suite Variable              ${build_machine}           Local Machine
    Run Keyword If                  '${isEmpty}'=='False'                  Set Suite Variable              ${build_machine}           Device Farm
    Run Keyword If                  '${isEmpty}'=='True'                   Set run number

    ${date}=                        Get Current Date    result_format=%d.%m.%Y %H:%M
    ${build}=                       Set Variable        ${build_machine} Android ${date}
    Set Variable                    ${TEST NAME}        Start
    Set Global Variable             ${build}
    ${loop_config_variable}         Set Variable        ok
    Set Global Variable             ${loop_config_variable}

Set run number
    ${run_number}=                  FakerLibrary.Random Number      digits=8      fix_len=True
    Set Global Variable             ${run_number}

Start Application

    Activate Application            app_id=com.onebuild.handoff
    Sleep                           1

    ${allow}=                       Run Keyword And Return Status           Element Should Be Visible        id=com.android.permissioncontroller:id/permission_allow_button
    Run Keyword If                  ${allow}                                Click Element                    id=com.android.permissioncontroller:id/permission_allow_button

    ${allow}=                       Run Keyword And Return Status           Element Should Be Visible        id=com.android.permissioncontroller:id/permission_allow_foreground_only_button
    Run Keyword If                  ${allow}                                Click Element                    id=com.android.permissioncontroller:id/permission_allow_foreground_only_button

    Wait Until Page Contains        Create your account

Quit all
    Sleep                           1
    Run Keyword And Ignore Error    Close Application

# End Session
#     ${logout}=                      Run Keyword And Return Status          Element Text Should Be           id=br.com.enjoei.app.silver:id/tabBarItemUserText           entrar
#     Run Keyword If                  '${logout}'=='False'                   Logout account
#     Wait Until Keyword Succeeds     6x      3 sec       Quit all

Start Session
    ${run_local_machine}            Run Keyword And Return Status          Variable Should Not Exist        ${local_machine}
    Run Keyword If                  '${run_local_machine}'=='True'         Run in Browserstack
    Run Keyword If                  '${run_local_machine}'=='False'        Run in local machine

Run in Browserstack
    ${isEmpty}                      Run Keyword And Return Status          Variable Should Not Exist        ${loop_config_variable}
    Run Keyword If                  ${isEmpty}                             Set Build Name

    ${isEmpty}                      Run Keyword And Return Status          Variable Should Not Exist        ${APP_URL}
    Run Keyword If                  ${isEmpty}                             Set Browserstack App

    Set Appium Timeout              15
    Open Application                ${BROWSER_STACK_URL}
    ...                             platformName=Android
    ...                             build=${build}
    ...                             name=${TEST NAME}
    ...                             automationName=UiAutomator2
    ...                             platformVersion=12.0
    ...                             deviceName=Google Pixel 5
    ...                             app=${APP_URL}
    ...                             browserstack.networkLogs=true
    ...                             autoGrantPermissions=true
    ...                             browserstack.maskCommands=setValues
    ...                             browserstack.idleTimeout=10
    ...                             fullReset=false
    ...                             noReset=true
    Sleep                           1

    #newCommandTimeout=30
    #...                             realMobile=true

    Wait Until Page Contains        Create your account      20

Run in local machine
    Log To Console                  ${SUITE NAME}

    Set Appium Timeout              10
    Open Application                http://localhost:4723/wd/hub
    ...                             automationName=UiAutomator2
    ...                             platformName=Android
    ...                             deviceName=Google Pixel 5
    ...                             appPackage=com.onebuild.handoff
    ...                             appActivity=com.onebuild.handoff.MainActivity
    Sleep                           1

    Wait Until Page Contains        Create your account      20

