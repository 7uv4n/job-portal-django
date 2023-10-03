*** Settings ***

Documentation  Company Login View Job Applicants

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

Navigate to Another Page for viewing Jobs
    [Documentation]  This test case navigates to another page after logging in
    Go To           http://127.0.0.1:8000/all_applicants/

View Resume of an Applicant
    [Documentation]  This test case views Resume of an applicant
    Click Element   css:a[href$="sample_resume.pdf"]    # Searches for a Resume uploaded by a user for Testing Purpose
    ${ActualURL}=  Get Location
    Should Be Equal  ${ActualURL}  http://127.0.0.1:8000/media/sample_resume.pdf  # Check whether the click leads to the webpage to view the resume
