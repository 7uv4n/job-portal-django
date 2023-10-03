*** Settings ***

Documentation  Login Functionality Validity and Invalidity

Library  SeleniumLibrary

*** Variables ***

${URL}  http://127.0.0.1:8000/user_login/
${Browser}  chrome
${FileName}      profile_pic.jpg  # Replace with the name of the file you want to upload
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



Update Text and Submit
    [Documentation]  This test case updates text and submits the form
    Input Text  first_name  abcde  # Update first name
    Input Text  last_name   abcde   # Update last name
    Input Text  email       abc@abc.com  # Update email
    Input Text  phone       1234567890    # Update phone number
    Choose File    image    ${FilePath}                # Choose a file to upload (e.g., an image)
    Click Button    Submit                             # Click Submit    
    Alert Should Be Present  Profile Updated Successfully    # Verify the alert message

Logout
    [Documentation]  This test case verifies that the user can successfully logout
    Click Element  //a[@href='/logout/']