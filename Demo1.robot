*** Settings ***
Documentation   To Validate the login form
Library     SeleniumLibrary
Test Teardown   Close Browser Session


*** Test Cases ***
Validate Successful Login
    Open the browser with the mortgage payment url
    Fill the login form
    Wait until it checks and display error message
    Verify error message is correct

*** Variable ***
${Error_Message_Login}  css:.alert-danger

*** Keywords ***
Open the browser with the mortgage payment url
    Create Webdriver    Chrome  executable_path=D:\chromedriver.exe
    Go To   https://www.rahulshettyacademy.com/loginpagePractise/
    Maximize Browser Window

Fill the login form
    Input Text      //label[text()='Username:']//parent::div[@class='form-group']//input    rahulshettyacademy
    Input Password  //label[text()='Password:']//parent::div[@class='form-group']//input    12345678
    Click Button    //input[@name='signin']

Wait until it checks and display error message
    Wait Until Element Is Visible   ${Error_Message_Login}

Verify error message is correct
  #  ${result}=     Get Text    ${Error_Message_Login}
  #  Should Be Equal As Strings  ${result}   Incorrect username/password.
  Element Text Should Be    ${Error_Message_Login}  Incorrect username/password.

Close Browser Session
    Close Browser
