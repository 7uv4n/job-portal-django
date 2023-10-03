*** Settings ***

Documentation  Company Login Update Details

Library  SeleniumLibrary

*** Variables ***

${URL}  http://127.0.0.1:8000/company_login/
${Browser}  chrome

*** Test Cases ***

Open Website
    [Documentation]  This test case verifies that the user is able to open the URL
    Open Browser  ${URL}  ${Browser}

Login to your account
    [Documentation]  This test case verifies a successful login
  Input Text  username  company@company.com
  Input Text  password  company
  Click Button  Submit


Update Text and Submit
    [Documentation]  This test case updates text and submits the form
    Input Text  first_name  company1  # Update first name
    Input Text  last_name   comapny1   # Update last name
    Input Text  email       company@company.com  # Update email
    Input Text  phone       1234567890    # Update phone number
    Click Element  css:input[type="submit"]  # Click the submit button    
    Alert Should Be Present  Profile Updated Successfully    # Verify the alert message

Logout
    [Documentation]  This test case verifies that the user can successfully logout
    Click Element  //a[@href='/logout/']
