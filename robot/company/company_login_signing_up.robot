*** Settings ***

Documentation  Signing Up new account for Company Login
Library  SeleniumLibrary

*** Variables ***

${URL}  http://127.0.0.1:8000/company_signup/
${Browser}  chrome
${FileName}      sample_logo.png  # Replace with the name of the file you want to upload
${FilePath}      ${EXECDIR}${/}${FileName}  # Construct the file path using ${EXECDIR}


*** Test Cases ***

Open Website
    [Documentation]  This test case verifies that the user is able to open the URL
    Open Browser  ${URL}  ${Browser}

Sign Up
    [Documentation]  This test case verifies whether sign up functionality is working well
    Input Text    first_name    First Name Test        # Input the user's first name
    Input Text    last_name    Last Name Test          # Input the user's last name
    Input Text    username    test_username_123        # Input the desired username
    Input Password    password1    testpassword        # Input the user's password
    Input Password    password2    testpassword        # Confirm the user's password
    Input Text    email    test_username_123@test.com  # Input the user's email address
    Input Text    phone    1234567890                  # Input the user's phone number
    Click Element    id:male                           # Select the 'Male' gender option
    Choose File    image    ${FilePath}                # Choose a file to upload (e.g., an image)
    Input Text    company_name    Test Company Name    # Input the name of the user's company
    Click Button    Submit
