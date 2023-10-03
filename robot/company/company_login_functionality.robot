*** Settings ***

Documentation  Login Functionality

Library  SeleniumLibrary

 

*** Variables ***

${URL}  http://127.0.0.1:8000/company_login/

${Browser}  chrome
 

*** Test Cases ***

Open Website

    [Documentation]  This test case verify user is able to open the URL

    Open Browser  ${URL}  ${Browser}  


Login to your account

  Input Text  username  company@company.com

  Input Text  password  company

  Click Button  Submit