*** Settings ***

Documentation  Signing Up new account for Company Login
Library  SeleniumLibrary

*** Variables ***

${URL}  http://127.0.0.1:8000/signup/
${Browser}  chrome
${FileName}      profile_pic.jpg  # Replace with the name of the file you want to upload
${FilePath}      ${EXECDIR}${/}${FileName}  # Construct the file path using ${EXECDIR}


*** Test Cases ***

Open Website
    [Documentation]  This test case verifies that the user is able to open the URL
    Open Browser  ${URL}  ${Browser}

Sign Up
    [Documentation]  This test case verifies whether sign up functionality is working well
    Input Text    first_name    First Name Test User   # Input the user's first name
    Input Text    last_name    Last Name Test User     # Input the user's last name
    Input Password    password1    testpassword        # Input the user's password
    Input Password    password2    testpassword        # Confirm the user's password
    Input Text    email    test_username_user_123456789@test.com  # Input the user's email address
    Input Text    phone    1234567890                  # Input the user's phone number
    Click Element    id:male                           # Select the 'Male' gender option
    Choose File    image    ${FilePath}                # Choose a file to upload (e.g., an image)
    Click Button    Submit                             # Click Submit
