*** Settings ***
Documentation   To Validate the login form
Library         SeleniumLibrary
Library         Collections
Test Setup      Open the browser with the mortgage payment url
Test Teardown   Close Browser Session
Resource        resource.robot

*** Test Cases ***
#Validate UnSuccessful Login
  #  Wait until element is located in the page   ${home_page_to_load}
 #   Fill the login form     ${user_name}    ${invalid_password}
 #   Wait until it checks and display error message
  #  Wait until element is located in the page   ${Error_Message_Login}
 #   Verify error message is correct

Validate Cards display in the shopping page
    Fill the login form     ${user_name}    ${valid_password}
    Wait until element is located in the page   ${shop_page_to_load}
    Verify card title in shop page


*** Variable ***
#${Error_Message_Login}  css:.alert-danger

*** Keywords ***
Fill the login form
    [arguments]      ${username}    ${password}
    Input Text      //label[text()='Username:']//parent::div[@class='form-group']//input    ${username}
    Input Password  //label[text()='Password:']//parent::div[@class='form-group']//input    ${password}
    Click Button    //input[@name='signin']

Wait until it checks and display error message
    Wait Until Element Is Visible   ${Error_Message_Login}

Wait until element is located in the page
    [arguments]     ${element}
    Wait Until Element Is Visible   ${element}

Verify error message is correct
  #  ${result}=     Get Text    ${Error_Message_Login}
  #  Should Be Equal As Strings  ${result}   Incorrect username/password.
  Element Text Should Be    ${Error_Message_Login}  Incorrect username/password.

Verify card title in shop page
    @{expCardList}=     Create List     iphone X    Samsung Note 8      Nokia Edge      Blackberry
    ${elements}=        Get WebElements     xapth:(//h4[@class='card-title']//a)
    @{actulList}=       Create List
    FOR    ${element}  IN   ${elements}
        LOG     ${element.text}
        #LOG     Get Text    ${element}
        Append To List      @{actulList}    ${element}
    END
    Lists Should Be Equal   ${expCardList}   ${actulList}

#Close Browser Session
    #Close Browser
