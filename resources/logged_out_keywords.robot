***Settings***
Resource        ../resources/base.robot

***Keywords***
Delete the current user
    Wait Until Page Contains            Estimates
    Click Element                       accessibility_id=settings
    Wait Until Page Contains            QA    
    Swipe By Percent        50          57           50       90
    Wait Until Page Contains            Delete account
    Click Element                       accessibility_id=Delete account, chevron_right
    Wait Until Page Contains            All the data associated with your account will automatically be deleted. This action cannot be undone.
    @{delete_btm_sheet}    Get Webelements                     xpath=//android.widget.EditText
    Input Text                          ${delete_btm_sheet}[0]        delete my account
    Element Should Be Enabled           accessibility_id=Delete
    Wait Until Page Contains            Welcome back!
    AppiumLibraryHelper.Capture Page Screenshot

Logout and validate session termination
    Wait Until Page Contains            Estimates
    Click Element                       accessibility_id=settings
    Swipe By Percent        50          57           50       90
    Click Text                          Log out
    Click Element                       accessibility_id=logout, Sign out
    Wait Until Page Contains            Create your account
    AppiumLibraryHelper.Capture Page Screenshot