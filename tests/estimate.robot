***Settings***
Resource        ../resources/base.robot

Test Teardown   Logout and validate session termination

***Test Cases***
Login with valid user and do a Estimate and Proposal flow
    [tags]              estimate_proposal
    [Setup]             Start Session

    Given the user start the application and attempt to log in with a user who already did the onboarding
    When the user was logged in and do a new estimate
    And edit this estimate using AI
    Then the user verifies if the proposal was edited

Login with valid user and create a new client and do a estimate for this client
    [tags]              new_client_estimate
    [Setup]             Start Session

    Given the user start the application and attempt to log in with a user who already did the onboarding
    When the user was logged in and go to create a new client and do a estimate for this client
    Then the user creates a new client and do a estimate for this client