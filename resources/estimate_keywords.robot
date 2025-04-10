***Settings***
Resource        ../resources/base.robot

***Variables***
${edit_text}                           //android.widget.EditText
${seek_bar}                            (//android.widget.SeekBar[@content-desc="Bottom Sheet"])[2]/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.widget.TextView[1]
${initial_value}                       value

***Keywords***
Given the user start the application and attempt to log in with a user who already did the onboarding
    Given the user start the application
    And executes the login

And executes the login
    And he went to the log in screen
    When he insert the phone number to log in
    And he insert the OTP code

And he went to the sign up screen
    Given the user start the application

And goes to the dashboard
    Wait Until Page Contains            Complete your onboarding

Given the user start the application
    Wait Until Page Contains            Create your account      8
    Wait Until Page Contains            By signing up you consent to receive marketing communications such as email and SMS from Handoff as well as to its Terms of Use and Privacy Policy.

And he went to the log in screen
    Handle Element Based On Locator     Log in
    Wait Until Page Contains            Login methods:      8

When he insert the phone number to log in
    @{phone_num}    Get Webelements                     xpath=${edit_text}
    Log     ${phone_num}
    Click Element                       ${phone_num}[0]
    Input Text                          ${phone_num}[0]        5184862436
    Hide Keyboard
    Handle Element Based On Locator     accessibility_id=Continue

And he insert the OTP code
    Wait Until Page Contains            Please verify your account      8
    @{otp_code}                         Get Webelements              xpath=//android.widget.TextView
    Log     ${otp_code}
    Click Element                       ${otp_code}[3]
    @{otp_num}    Get Webelements       xpath=${edit_text}
    Input Text                          ${otp_num}[0]        112233
    Click Text                          Verify
    Wait Until Page Contains            Estimates
    Wait Until Element Is Visible       accessibility_id=Clients

When the user was logged in and do a new estimate
    Wait Until Page Contains            Estimates
    Tap With Positions                  923    1508
    Handle Element Based On Locator     accessibility_id=add, New
    Wait Until Page Contains            Start manually        
    @{estimate_btm_sheet}    Get Webelements                     xpath=${edit_text}
    Input Text                          ${estimate_btm_sheet}[0]        This kitchen remodel is 15'x10' with 9' ceilings. Scope includes: complete demo, drywall, 12x12 tile floor, base and upper cabinets, quartz countertops, 12" mosaic backsplash, new sink, outlets, recessed lights, appliances, baseboard, and painting. No layout changes. Use mid grade finishes.
    Handle Element Based On Locator     accessibility_id=arrow_upward
    Wait Until Page Contains            Creating estimate...
    Wait Until Page Contains            Review estimate
    Input Text                          ${estimate_btm_sheet}[0]        Try to upgrade that with a 70's style
    Wait Until Page Contains            Updating estimate...
    Wait Until Page Contains            Kitchen Remodel
    Handle Element Based On Locator     accessibility_id=Review estimate
    Wait Until Page Contains            Create a proposal
    Handle Element Based On Locator     accessibility_id=0, Create proposal
    Wait Until Page Contains            Add Client
    Handle Element Based On Locator     accessibility_id=Preview & Send

    Wait Until Page Contains            Proposal preview
    Handle Element Based On Locator     Send proposal
    Wait Until Page Contains            Send
    @{estimate_btm_sheet}    Get Webelements                     xpath=${edit_text}
    Input Text                          ${estimate_btm_sheet}[0]        Rod
    Handle Element Based On Locator     Rodolfo
    Wait Until Page Contains            Share
    Handle Element Based On Locator     xpath=${seek_bar}    
    Handle Element Based On Locator     accessibility_id=Send

    ${avaliation}    Run Keyword And Return Status    Wait Until Page Contains    Enjoying Handoff?
    Run Keyword If                      '${avaliation}'=='True'    Handle Element Based On Locator     id=close

    ${estimation}    Run Keyword And Return Status    Wait Until Page Contains    Estimate Unavailable
    Run Keyword If                      '${estimation}'=='True'    Handle Element Based On Locator     id=close

    Wait Until Page Contains            Kitchen Remodel
    Wait Until Page Contains            Creating estimate...
    Wait Until Page Contains            Estimates

And edit this estimate using AI
    Handle Element Based On Locator     Sent
    Wait Until Page Contains            Kitchen Remodel
    ${initial_value}    Get Text        xpath=//android.widget.TextView[@text='Kitchen Remodel']
    Set Suite Variable                  ${initial_value}
    Log                                 Initial value: ${initial_value}
    Handle Element Based On Locator     Unopened
    Wait Until Page Contains            Kitchen Remodel
    Handle Element Based On Locator     accessibility_id=Unlock and Edit
    Wait Until Page Contains            Edit Estimate
    Handle Element Based On Locator     accessibility_id=Continue
    Wait Until Page Contains            Edit Estimate
    Handle Element Based On Locator     Use Handoff AI
    @{estimate_btm_sheet}    Get Webelements                     xpath=${edit_text}
    Input Text                          ${estimate_btm_sheet}[0]        Change the estimate to a 80's style
    Wait Until Page Contains            Kitchen Remodel
    Handle Element Based On Locator     accessibility_id=Review estimate
    Wait Until Page Contains            Preview & Send
    Handle Element Based On Locator     accessibility_id=Preview & Send
    Wait Until Page Contains            Proposal preview
    Handle Element Based On Locator     Send proposal
    Wait Until Page Contains            Share
    Handle Element Based On Locator     xpath=${seek_bar}    
    Handle Element Based On Locator     accessibility_id=Send
    Wait Until Page Contains            accessibility_id=Unlock and Edit
    Handle Element Based On Locator     accessibility_id=arrow_back
    Wait Until Page Contains            Estimates

Then the user verifies if the proposal was edited
    ${updated_value}    Get Text                            xpath=//android.widget.TextView[@text='Kitchen Remodel']
    Should Not Be Equal As Strings                          ${initial_value}    ${updated_value}

When the user was logged in and go to create a new client and do a estimate for this client
    Handle Element Based On Locator     accessibility_id=Clients
    Wait Until Page Contains            Clients
    Handle Element Based On Locator     accessibility_id=add, New    
    @{client_btm_sheet}    Get Webelements                     xpath=${edit_text}
    Input Text                          ${client_btm_sheet}[0]        Cintia
    Input Text                          ${client_btm_sheet}[1]        cinokado@gmail.com
    Input Text                          ${client_btm_sheet}[2]        5184232588
    Input Text                          ${client_btm_sheet}[3]        Irvine, CA, USA
    Wait Until Page Contains            Cintia
    Click Element                       accessibility_id=Save
    Wait Until Page Contains            Cintia

Then the user creates a new client and do a estimate for this client
    Handle Element Based On Locator     Cintia
    Wait Until Page Contains            Cintia
    Handle Element Based On Locator     accessibility_id=add, New
    Wait Until Page Contains            Start manually
    Handle Element Based On Locator     Enter a title
    @{client_btm_sheet}    Get Webelements                     xpath=${edit_text}
    Input Text                          ${client_btm_sheet}[0]        New Client Estimate
    Handle Element Based On Locator     Use Handoff AI
    @{estimate_btm_sheet}    Get Webelements                     xpath=${edit_text}
    Input Text                          ${estimate_btm_sheet}[0]        This is an interior paint job. It's a 2,000 SF home with 9' ceilings. We're painting 4 bedrooms, 2 baths, great room, 2 halls, kitchen, and kitchen cabinets. Include walls, ceilings, and trim with 3 coats of mid-grade paint.
    Wait Until Page Contains            Creating estimate...
    Wait Until Page Contains            Interior Painting
    Handle Element Based On Locator     accessibility_id=Review estimate
    Wait Until Page Contains            Create proposal
    Handle Element Based On Locator     accessibility_id=0, Create proposal
    Wait Until Page Contains            Preview & Send
    Handle Element Based On Locator     accessibility_id=Preview & Send
    Wait Until Page Contains            Proposal preview
    Handle Element Based On Locator     Send proposal
    Wait Until Page Contains            Share
    Handle Element Based On Locator     xpath=${seek_bar}    
    Handle Element Based On Locator     accessibility_id=Send
    Wait Until Page Contains            accessibility_id=Unlock and Edit
    Handle Element Based On Locator     accessibility_id=arrow_back
    Wait Until Page Contains            Cintia
    Handle Element Based On Locator     accessibility_id=arrow_back
    Wait Until Page Contains            Clients
    Handle Element Based On Locator     accessibility_id=Estimates
    Wait Until Page Contains            Unopened
    Wait Until Page Contains            Estimates