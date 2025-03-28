***Settings***
Resource        ../resources/base.robot

***Keywords***
TypeOnKeyboard
    [Arguments]    ${number}=.
    Run Keyword If   ${number}==0     Press Keycode       7
    Run Keyword If   ${number}==1     Press Keycode       8
    Run Keyword If   ${number}==2     Press Keycode       9
    Run Keyword If   ${number}==3     Press Keycode       10
    Run Keyword If   ${number}==4     Press Keycode       11
    Run Keyword If   ${number}==5     Press Keycode       12
    Run Keyword If   ${number}==6     Press Keycode       13
    Run Keyword If   ${number}==7     Press Keycode       14
    Run Keyword If   ${number}==8     Press Keycode       15
    Run Keyword If   ${number}==9     Press Keycode       16
    Run Keyword If   ${number}=="HOME"     Press Keycode      82

Handle Element Based On Locator
    [Arguments]    ${locator}
    ${has_accessibility}=    Run Keyword And Return Status    Should Contain    ${locator}    accessibility_id=
    ${has_id}=    Run Keyword And Return Status    Should Contain    ${locator}    id=

    Run Keyword If    ${has_accessibility} or ${has_id}    Flow With ID Or Accessibility ID    ${locator}
    ...               ELSE    Flow Without ID Or Accessibility ID    ${locator}

Flow With ID Or Accessibility ID
    [Arguments]    ${locator}
    Element Should Be Visible    ${locator}
    Log    Starting click with retry logic for: ${locator}

    ${still_visible}=    Set Variable    ${True}
    FOR    ${index}    IN RANGE    3
        Log    Attempt ${index + 1} to click element: ${locator}
        Click Element    ${locator}
        Sleep    1s
        ${still_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${locator}
        Run Keyword If    not ${still_visible}    Exit For Loop
    END

    Run Keyword If    ${still_visible}    Log    Element still visible after 3 attempts.

Flow Without ID Or Accessibility ID
    [Arguments]    ${locator}
    Wait Until Page Contains    ${locator}
    Log    Starting click with retry logic for: ${locator}

    ${still_visible}=    Set Variable    ${True}
    FOR    ${index}    IN RANGE    3
        Log    Attempt ${index + 1} to click text: ${locator}
        Click Text    ${locator}
        Sleep    1s
        ${still_visible}=    Run Keyword And Return Status    Wait Until Page Contains    ${locator}
        Run Keyword If    not ${still_visible}    Exit For Loop
    END

    Run Keyword If    ${still_visible}    Log    Text still visible after 3 attempts.