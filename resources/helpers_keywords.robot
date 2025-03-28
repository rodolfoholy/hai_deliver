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