*** Settings ***

Documentation  Company Login View Job Applicants

Library  SeleniumLibrary

*** Variables ***

${URL}  http://127.0.0.1:8000/user_login/
${Browser}  chrome
${FileName}      sample_resume.pdf  # Replace with the name of the file you want to upload
${FilePath}      ${EXECDIR}${/}${FileName}  # Construct the file path using ${EXECDIR}

*** Test Cases ***

Open Website
    [Documentation]  This test case verifies that the user is able to open the URL
    Open Browser  ${URL}  ${Browser}

Login to your account
    [Documentation]  This test case verifies a successful login
    Input Text  username  abc@abc.com
    Input Text  password  abc
    Click Button  Submit

Navigate to Another Page for viewing Jobs
    [Documentation]  This test case navigates to another page after logging in
    Go To           http://127.0.0.1:8000/all_jobs/

Apply for a job
    [Documentation]  This test case applies a job
    Click Link   /job_detail/5/              # Click on the expired job link 
    Click Link   /job_apply/5/               # Click on the apply link
    Alert Should Be Present  Date for applying has been closed         # Handle Alert
    Click Link  /job_detail/12/              # Click on the ongoing job link
    Click Link  /job_apply/12/               # Click on the apply link    
    Choose File    resume    ${FilePath}               # Choose a file to upload (e.g., an image)
    Click Button    Submit                             # Click Submit    

