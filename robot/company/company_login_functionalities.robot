*** Settings ***

Documentation  Login Functionality Validity and Invalidity

Library  SeleniumLibrary

*** Variables ***

${URL}  http://127.0.0.1:8000/company_login/
${Browser}  chrome

*** Test Cases ***

Open Website
    [Documentation]  This test case verifies that the company user is able to open the URL
    Open Browser  ${URL}  ${Browser}

Login to your account
    [Documentation]  This test case verifies a successful login for the company user 
  Input Text  username  company@company.com
  Input Text  password  company
  Click Button  Submit

Logout
    [Documentation]  This test case verifies that the company user can successfully logout
    Click Element  //a[@href='/logout/']

Open Website
    [Documentation]  This test case verifies that the company user is able to open the URL
    Open Browser  ${URL}  ${Browser}

Login with Invalid Credentials
    [Documentation]  This test case verifies that invalid credentials result in an error message
    Input Text  username  invalid_user@abc.com
    Input Text  password  invalid_password
    Click Button  Submit
    Alert Should Be Present  Invalid Credentials. Please try again.
