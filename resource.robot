*** Settings ***
Documentation   A resource file with reusable keywords and variables.
Library     SeleniumLibrary
#Test Teardown   Close Browser Session


*** Variable ***
${user_name}            rahulshettyacademy
${invalid_password}     12345
${valid_password}       learning
${Error_Message_Login}  css:.alert-danger
${shop_page_to_load}    css:.nav-link
${home_page_to_load}    //label[text()='Username:']//parent::div[@class='form-group']//input

*** Keywords ***
Open the browser with the mortgage payment url
    Create Webdriver    Chrome  executable_path=D:\chromedriver.exe
    Go To   https://www.rahulshettyacademy.com/loginpagePractise/
    Maximize Browser Window

Close Browser Session
    Close Browser
