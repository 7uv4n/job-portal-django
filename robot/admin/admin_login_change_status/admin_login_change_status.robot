*** Settings ***

Documentation  Test case to do Admin Login and change status of a company

Library  SeleniumLibrary

 

*** Variables ***

${URL}  http://127.0.0.1:8000/admin_login/

${Browser}  chrome
 

*** Test Cases ***

Open Website
    [Documentation]  This test case verify user is able to open the URL
    Open Browser  ${URL}  ${Browser}  


Login to your account
  Input Text  username  yuvan
  Input Text  password  yuvan
  Click Button  Submit

Change status of a company
    [Documentation]  This test case verify user is able to change the status of a company
    Click Link    /change_status/5/
    Input Text  company_name  Microsoft Corporation
    Select From List by Value    id=status    Accepted
    Click Button  Submit
    Alert Should Be Present  Status changed successfully.
    Click Link    /change_status/5/
    Input Text  company_name  Microsoft Corporation
    Select From List by Value    id=status    Rejected
    Click Button  Submit
    Alert Should Be Present  Status changed successfully.
