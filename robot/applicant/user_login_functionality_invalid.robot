*** Settings ***

Documentation  Login Functionality

Library  SeleniumLibrary

 

*** Variables ***

${URL}  http://127.0.0.1:8000/user_login/

${Browser}  chrome
 

*** Test Cases ***

Open Website

    [Documentation]  This test case verify user is able to open the URL

    Open Browser  ${URL}  ${Browser}  


Login with Invalid Credentials
    [Documentation]  This test case verifies that invalid credentials result in an error message

    Input Text  username  invalid_user@abc.com

    Input Text  password  invalid_password

    Click Button  Submit

    Alert Should Be Present  Invalid Credentials. Please try again.
