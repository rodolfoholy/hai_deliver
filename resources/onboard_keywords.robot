***Settings***
Resource        ../resources/base.robot


***Variables***
${edit_text}                           //android.widget.EditText
${seek_bar}                            (//android.widget.SeekBar[@content-desc="Bottom Sheet"])[2]/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.widget.TextView[1]

***Keywords***
Given the user start the application and attempt to sign up
    Given the user start the application
    And executes the login for a onboard user

And executes the sign up
    And executes the login for a onboard user
    And goes to the dashboard

And do the sign up
    @{signup}    Get Webelements                     xpath=${edit_text}
    Input Text                          ${signup}[0]        Francisco QA
    Input Text                          ${signup}[1]        QA
    Input Text                          ${signup}[2]        rodolfo_rodrigo@hotmail.com
    Input Text                          ${signup}[3]        5184861895
    Click Element                       accessibility_id=Get Started Free
    Wait Until Page Contains            Please verify your account      8
    Press Keycode       8
    Sleep    1
    Press Keycode       8
    Sleep    1
    # Press Keycode       145
    Press Keycode       9
    Sleep    1
    # Press Keycode       145
    Press Keycode       9
    Sleep    1
    # Press Keycode       145
    Press Keycode       10
    Sleep    1
    Press Keycode       10
    Wait Until Page Contains            Got it    20
    Click Element                       accessibility_id=Got it
    Wait Until Page Contains            Remodels
    Click Text                          Remodels
    Swipe    528    1829    525    388
    Wait Until Page Contains            Continue
    Click Element                       accessibility_id=Continue
    Wait Until Page Contains            Low
    Click Element                       accessibility_id=Low
    Swipe    528    1829    525    388
    Wait Until Page Contains            Choose manually
    Click Element                       accessibility_id=Choose manually
    Wait Until Page Contains            Price Location
    @{price_location}    Get Webelements                     xpath=${edit_text}
    Input Text                          ${price_location}[0]        Irvine
    Click Text                          Irvine, CA, USA
    Wait Until Page Contains            Markup
    Click Element                       accessibility_id=Continue
    Wait Until Page Contains            Bathroom Remodel
    Click Text                          Bathroom Remodel
    Wait Until Element Is Visible       accessibility_id=mic
    Click Element                       accessibility_id=arrow_upward    
    Wait Until Page Contains            Ask Handoff AI to change whatever you need on your estimate.        30
    Wait Until Element Is Visible       accessibility_id=Review estimate
    Click Element                       accessibility_id=arrow_back
    Wait Until Page Contains            Demolition
    Click Element                       accessibility_id=arrow_back
    Wait Until Page Contains            Leave onboarding?
    Click Element                       accessibility_id=Go to dashboard

And executes the login for a onboard user
    Click Text                          Log in
    Click Text                          Log in
    Wait Until Page Contains            Login methods:      8
    @{phone_num}    Get Webelements                     xpath=${edit_text}
    Log     ${phone_num}
    Click Element                       ${phone_num}[0]
    Input Text                          ${phone_num}[0]        5184861895
    Hide Keyboard
    Click Element                       accessibility_id=Continue
    Wait Until Page Contains            Please verify your account      8
    @{otp_code}                         Get Webelements              xpath=//android.widget.TextView
    Log     ${otp_code}
    Click Element                       ${otp_code}[3]
    @{otp_num}    Get Webelements                     xpath=${edit_text}
    Input Text                          ${otp_num}[0]        112233
    Click Text                          Verify
    Wait Until Page Contains            Estimates
    Wait Until Element Is Visible       accessibility_id=Clients

When the user was logged in and go to complete the onboarding
    Wait Until Element Is Visible       accessibility_id=Clients
    # Click Text                          Complete your onboarding
    ${sub_menu}                         Run Keyword And Return Status    Wait Until Page Contains    Your free trial has expired! Subscribe to unlock all features    5
    # ${sub_menu}                         Run Keyword And Return Status    Click Text    Send an invoice    7
    Run Keyword If                      '${sub_menu}'=='True'           Go Back
    # Run Keyword If                      '${sub_menu}'=='False'          Click Text                          Complete your onboarding
    And the user click on Send a proposal
    And the user click on Send an invoice
    And the user click on Create an AI preset
    And the user click on Create an estimate
    And the user creates new estimates
    And the user creates new estimates

And the user click on Send a proposal
    Click Text                          Complete your onboarding
    Wait Until Page Contains            Next steps    
    Click Text                          Send a proposal
    Wait Until Page Contains            rodolfo_rodrigo@hotmail.com      8
    Click Text                          Preview & Send
    Wait Until Page Contains            Edit Company      8
    Click Text                          Save
    Wait Until Page Contains            Proposal preview      8
    Click Text                          Send proposal
    Wait Until Page Contains            Share      8
    Click Element                       xpath=${seek_bar}
    Wait Until Page Contains            Unlock and Edit      8
    Click Text                          Estimates
    Wait Until Page Contains            Complete your onboarding

And the user click on Send an invoice
    Send a invoice to a existing client

Send a invoice to a existing client
    Click Text                          Complete your onboarding
    Wait Until Page Contains            Next steps    
    Click Text                          Send an invoice
    Wait Until Page Contains            Due Date      8
    @{invoice_btm_sheet}    Get Webelements                     xpath=${edit_text}
    Input Text                          ${invoice_btm_sheet}[0]        Robot Framework Test Invoice
    Input Text                          ${invoice_btm_sheet}[1]        100.00
    Input Text                          ${invoice_btm_sheet}[2]        10
    Click Element                       accessibility_id=Next
    
    Wait Until Page Contains            Pick a client you're issuing this invoice to.
    
    @{invoice_btm_sheet}    Get Webelements                     xpath=${edit_text}
    Input Text                          ${invoice_btm_sheet}[0]        Fran
    Click Text                          Francisco
    Wait Until Page Contains            Invoice    
    Click Element                       accessibility_id=Next
    Wait Until Page Contains            Share
    Click Element                       xpath=${seek_bar}
    Wait Until Page Contains            Unopened 
    Click Element                       accessibility_id=Estimates
    Wait Until Page Contains            Complete your onboarding

And the user click on Create an AI preset
    Click Text                          Complete your onboarding
    Wait Until Page Contains            Next steps    
    Click Text                          Create an AI preset
    Wait Until Page Contains            Get Started
    Click Text                          Get Started
    Wait Until Page Contains            AI presets
    Click Element    accessibility id=My rates, Save your own rates for estimates, chevron_right
    Wait Until Page Contains            My rates
    Click Element                       accessibility_id=Create rates
    Wait Until Page Contains            Add rate
    @{ai_preset_btm_sheet}    Get Webelements                     xpath=${edit_text}
    Input Text                          ${ai_preset_btm_sheet}[0]        Robot Framework Test Preset
    Input Text                          ${ai_preset_btm_sheet}[1]        200.00
    Click Text                          Select
    Wait Until Page Contains            LBS (Pounds)
    Click Text                          LBS (Pounds)
    Wait Until Page Contains            Add rate
    Click Element                       accessibility_id=Save
    Wait Until Page Contains            / LBS (Pounds)
    Click Element                       accessibility_id=arrow_back
    Wait Until Page Contains            AI presets

    Wait Until Page Contains            My rates
    Click Element                       accessibility id=Estimate instructions, Customize your AI estimator, chevron_right
    Wait Until Page Contains            Instructions
    Click Element                       accessibility_id=Create instructions
    Wait Until Page Contains            Add instruction
    @{ai_preset_btm_sheet}    Get Webelements                     xpath=${edit_text}
    Input Text                          ${ai_preset_btm_sheet}[0]        Robot Framework Test Instruction
    Click Element                       accessibility_id=Save
    Wait Until Page Contains            Add instruction
    Wait Until Page Contains            Robot Framework Test Instruction
    Click Element                       accessibility_id=arrow_back
    Wait Until Page Contains            AI presets
    Click Element                       accessibility_id=arrow_back
    Wait Until Page Contains            Complete your onboarding

And the user click on Create an estimate
    Click Text                          Complete your onboarding
    Wait Until Page Contains            Next steps
    Click Text                          Create an estimate
    Wait Until Page Contains            Start manually        
    @{estimate_btm_sheet}    Get Webelements                     xpath=${edit_text}
    Input Text                          ${estimate_btm_sheet}[0]        This bathroom remodel is 7'x10' with 8' ceilings. We'll be removing and replacing: shower pan, shower wall tile, floor tile, shower doors, toilet, vanity, sink, lights, and fan. No layout changes. Repaint with 2 coats. Use high end finishes.
    Click Element                       accessibility_id=arrow_upward
    Wait Until Page Contains            Price location
    @{estimate_btm_sheet}    Get Webelements                     xpath=${edit_text}
    Input Text                          ${estimate_btm_sheet}[0]        Irvine
    Click Text                          Irvine, CA, USA
    Wait Until Page Contains            Creating estimate...
    Wait Until Page Contains            Bathroom Remodel
    Click Element                       accessibility_id=Review estimate
    Wait Until Page Contains            Create a proposal
    Click Element                       accessibility_id=0, Create proposal
    Wait Until Page Contains            Add Client
    Click Element                       accessibility_id=Preview & Send
    Wait Until Page Contains            Edit Company
    Click Element                       accessibility_id=Save
    Wait Until Page Contains            Add Client
    Click Element                       accessibility_id=Preview & Send
    Wait Until Page Contains            Proposal preview
    Click Text                          Send proposal
    Wait Until Page Contains            Send
    @{estimate_btm_sheet}    Get Webelements                     xpath=${edit_text}
    Input Text                          ${estimate_btm_sheet}[0]        Fran
    Click Text                          Francisco
    Wait Until Page Contains            Share
    Click Element                       xpath=${seek_bar}    
    Click Element                       accessibility_id=Send

    ${avaliation}    Run Keyword And Return Status    Wait Until Page Contains    Enjoying Handoff?
    Run Keyword If                      '${avaliation}'=='True'    Click Element    accessibility_id=close

    ${estimation}    Run Keyword And Return Status    Wait Until Page Contains    Estimate Unavailable
    Run Keyword If                      '${estimation}'=='True'    Click Element    accessibility_id=close

    Wait Until Page Contains            Estimates
    Wait Until Page Contains            Complete your onboarding

And the user creates new estimates
    Click Text                          Complete your onboarding
    Wait Until Page Contains            Next steps
    Click Text                          Create an estimate
    Wait Until Page Contains            Start manually        
    @{estimate_btm_sheet}    Get Webelements                     xpath=${edit_text}
    Input Text                          ${estimate_btm_sheet}[0]        This bathroom remodel is 7'x10' with 8' ceilings. We'll be removing and replacing: shower pan, shower wall tile, floor tile, shower doors, toilet, vanity, sink, lights, and fan. No layout changes. Repaint with 2 coats. Use high end finishes.
    Click Element                       accessibility_id=arrow_upward
    Wait Until Page Contains            Price location
    @{estimate_btm_sheet}    Get Webelements                     xpath=${edit_text}
    Input Text                          ${estimate_btm_sheet}[0]        Irvine
    Click Text                          Irvine, CA, USA
    Wait Until Page Contains            Creating estimate...
    Wait Until Page Contains            Bathroom Remodel
    Click Element                       accessibility_id=Review estimate
    Wait Until Page Contains            Create a proposal
    Click Element                       accessibility_id=0, Create proposal
    Wait Until Page Contains            Add Client
    Click Element                       accessibility_id=Preview & Send

    Wait Until Page Contains            Proposal preview
    Click Text                          Send proposal
    Wait Until Page Contains            Send
    @{estimate_btm_sheet}    Get Webelements                     xpath=${edit_text}
    Input Text                          ${estimate_btm_sheet}[0]        Fran
    Click Text                          Francisco
    Wait Until Page Contains            Share
    Click Element                       xpath=${seek_bar}    
    Click Element                       accessibility_id=Send

    ${avaliation}    Run Keyword And Return Status    Wait Until Page Contains    Enjoying Handoff?
    Run Keyword If                      '${avaliation}'=='True'    Click Element    accessibility_id=close

    ${estimation}    Run Keyword And Return Status    Wait Until Page Contains    Estimate Unavailable
    Run Keyword If                      '${estimation}'=='True'    Click Element    accessibility_id=close

    Wait Until Page Contains            Estimates

Then the user completes the onboarding
    Wait Until Page Contains            Upgrade to keep using AI.    
    AppiumLibraryHelper.Capture Page Screenshot
