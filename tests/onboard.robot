***Settings***
Resource        ../resources/base.robot

Test Teardown   Delete the current user

***Test Cases***
Login with valid user and complete the onboarding
    [tags]              login
    [Setup]             Start Session

    Given the user start the application and attempt to sign up
    When the user was logged in and go to complete the onboarding
    Then the user completes the onboarding
