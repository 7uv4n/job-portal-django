*** Settings ***
Documentation  Test case to check Signing Up new account for Job Applicant Login
Library  SeleniumLibrary
Library  String

*** Variables ***
${URL}           http://127.0.0.1:8000/signup/
${Browser}       chrome
${FileName}      profile_pic.jpg  # Replace with the name of the file you want to upload
${FilePath}      ${EXECDIR}${/}${FileName}  # Construct the file path using ${EXECDIR}

*** Keywords ***
Generate Random Email
    ${random_string}=    Generate Random String  10  abcdefghijklmnopqrstuvwxyz0123456789
    ${email}=    Set Variable    user_${random_string}@test.com
    [Return]     ${email}

*** Test Cases ***

Open Website
    [Documentation]  This test case verifies that the user is able to open the URL
    Open Browser  ${URL}  ${Browser}

Sign Up
    [Documentation]  This test case verifies whether sign up functionality is working well
    ${email}=    Generate Random Email

    Input Text    first_name    First Name Test User1   # Input the user's first name
    Input Text    last_name     Last Name Test User1    # Input the user's last name
    Input Password    password1    testpassword1        # Input the user's password
    Input Password    password2    testpassword1        # Confirm the user's password
    Input Text    email    ${email}                     # Input the user's email address with random value
    Input Text    phone    12345678901                  # Input the user's phone number
    Click Element    id:male                            # Select the 'Male' gender option
    Choose File    image    ${FilePath}                 # Choose a file to upload (e.g., an image)
    Click Button    Submit                              # Click Submit
