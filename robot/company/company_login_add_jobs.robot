*** Settings ***

Documentation  Company Login Add jobs to the portal

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

Navigate to Another Page for Adding Job
    [Documentation]  This test case navigates to another page after logging in
    Go To           http://127.0.0.1:8000/add_job/

Add Job to the portal
    [Documentation]  This test case enters the required details and posts a job
    Input Text  job_title  Test Job               # Input Job title
    Input Text  start_date  01-01-2021            # Input Job Application start date
    Input Text  end_date  01-01-2024              # Input Job Application end date
    Input Text  experience  5                     # Input Experience required for Job
    Input Text  salary  20000                     # Input Salary for the job posted
    Input Text  skills  Skill_1, skills_2, skills_3    # Input Skills required for job
    Input Text  location  test_location           # Input Location for the job
    Input Text  description  Test job description     # Input Description of job
    Click Button  Submit                          # Press Submit Button
    Alert Should Be Present  Job added successfully.    # This Alert must be present after submitting
