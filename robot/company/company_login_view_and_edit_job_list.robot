*** Settings ***

Documentation  Company Login View and Edit Job List

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
    Go To           http://127.0.0.1:8000/job_list/

Edit Job
    [Documentation]  This test case enters the required details and posts a job
    Click link  /edit_job/11/
    Input Text  job_title  Test Job new              # Input Job title
    Input Text  start_date  01-02-2021            # Input Job Application start date
    Input Text  end_date  01-02-2024              # Input Job Application end date
    Input Text  experience  10                     # Input Experience required for Job
    Input Text  salary  30000                     # Input Salary for the job posted
    Input Text  skills  Skill_3, skills_4, skills_5    # Input Skills required for job
    Input Text  location  test_location_2           # Input Location for the job
    Input Text  description  Test job description 2     # Input Description of job
    Click Button  Submit                          # Press Submit Button
    Alert Should Be Present  Job details updated successfully.    # This Alert must be present after submitting

# Delete Job
#     [Documentation]  This test case deletes a job