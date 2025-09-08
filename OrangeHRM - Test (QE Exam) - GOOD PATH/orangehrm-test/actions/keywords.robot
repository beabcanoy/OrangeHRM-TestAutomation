*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Resource    ../variables/test_variables.robot
Library    DateTime

*** Keywords ***
User Opens Browser and Go to URL
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Sleep    5s
Login To OrangeHRM
    Input Text    //input[@placeholder='Username']    ${username}
    Sleep    3s
    Input Text    //input[@placeholder='Password']    ${password}
    Sleep    3s

Login Button
    Click Button    //button[normalize-space()='Login']
    Sleep    5s
    
Go To PIM Add Employee
    Click Element    //*[@id="app"]/div[1]/div[1]/aside/nav/div[2]/ul/li[2]/a/span
    Sleep    5s

Fill User Form With Valid Data
    ${firstName}    FakerLibrary.First Name
    ${middleName}    FakerLibrary.Last Name
    ${lastName}    FakerLibrary.Last Name
    ${userName}    FakerLibrary.User Name
    ${empId}    FakerLibrary.Numerify    0$$$

    Click Button    //button[normalize-space()='Add']
    Sleep    5s
    Click Button    //button[normalize-space()='Cancel']
    Sleep    5s
    Click Button    //button[normalize-space()='Add']
    Sleep    5s

    Choose File    //input[@type="file"]    ${EXECDIR}/img/user.png
    Sleep    5s
    Input Text    //input[@placeholder='First Name']    ${firstName}
    Sleep    3s
    Input Text    //input[@placeholder='Middle Name']    ${middleName}
    Sleep    3s
    Input Text    //input[@placeholder='Last Name']    ${lastName}
    Sleep    3s
    Click Element    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div[2]/div[1]/div[2]/div/div/div[2]/input
    Press Keys              NONE    CTRL+A
    Press Keys              NONE    BACKSPACE
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div[2]/div[1]/div[2]/div/div/div[2]/input    ${empId}
    Sleep    5s
    Click Element    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div[2]/div[2]/div/label/span
    Sleep    5s
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div[2]/div[3]/div/div[1]/div/div[2]/input   ${userName}
    Sleep    3s
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div[2]/div[4]/div/div[1]/div/div[2]/input    ${emp_password}
    Sleep    3s
    Input Password    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div[2]/div[4]/div/div[2]/div/div[2]/input    ${emp_password}
    Sleep    3s
Save New Employee Data
    Click Button    //button[normalize-space()='Save']
    Sleep    10s

Employee List
    Click Element    //a[normalize-space()='Employee List']
    Sleep    5s
    Execute Javascript    window.scroll(0, 50)
    Sleep    3s

#Update Employee
Employee Personal Info
    ${firstName}    FakerLibrary.First Name
    ${middleName}    FakerLibrary.Last Name
    ${lastName}    FakerLibrary.Last Name
    ${empId}    FakerLibrary.Numerify    0$$$
    ${otherId}    FakerLibrary.Numerify    0$$$
    ${driver_license}    FakerLibrary.Bothify    ???-######
    ${dob}    FakerLibrary.Date Of Birth
    # ${ssn_num}    FakerLibrary.Numerify    $$$-$$-$$$$
    # ${sin_num}    FakerLibrary.Numerify    $$$-$$$-$$$

    # Scroll Element Into View    //*[@id="app"]/div[1]/div[2]/div[2]/div/div[2]/div[3]/div/div/div[8]/div
    # Sleep    5s
    # Execute Javascript    window.scroll(0, 50)
    # Sleep    3s
    Click Element    //button[@type='button' and .//i[contains(@class, 'bi-pencil-fill')]]
    Sleep    5s
    Click Element    firstName
    Press Keys              NONE    CTRL+A
    Press Keys              NONE    BACKSPACE
    Input Text    firstName    ${firstName}
    Sleep    3s
    Click Element    middleName
    Press Keys              NONE    CTRL+A
    Press Keys              NONE    BACKSPACE
    Input Text    middleName    ${middleName}
    Sleep    3s
    Click Element    lastName
    Press Keys              NONE    CTRL+A
    Press Keys              NONE    BACKSPACE
    Input Text    lastName    ${lastName}
    Sleep    3s
    Click Element    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[1]/form/div[2]/div[1]/div[1]/div/div[2]/input
    Press Keys              NONE    CTRL+A
    Press Keys              NONE    BACKSPACE
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[1]/form/div[2]/div[1]/div[1]/div/div[2]/input    ${empId}
    Sleep    3s
    Click Element    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[1]/form/div[2]/div[1]/div[2]/div/div[2]/input
    Press Keys              NONE    CTRL+A
    Press Keys              NONE    BACKSPACE
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[1]/form/div[2]/div[1]/div[2]/div/div[2]/input    ${otherId}
    Sleep    3s
    Click Element    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[1]/form/div[2]/div[2]/div[1]/div/div[2]/input
    Press Keys              NONE    CTRL+A
    Press Keys              NONE    BACKSPACE
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[1]/form/div[2]/div[2]/div[1]/div/div[2]/input    ${driver_license}
    Sleep    3s

    ${future_date}=    Future Date    ${expiry_format}
    ${formatted_date}=    Convert Date    ${future_date}    result_format=%d-%m-%Y
    Click Element    xpath=//input[@placeholder='dd-mm-yyyy']
    Press Keys       xpath=//input[@placeholder='dd-mm-yyyy']    CTRL+A
    Press Keys       xpath=//input[@placeholder='dd-mm-yyyy']    BACKSPACE
    Input Text       xpath=//input[@placeholder='dd-mm-yyyy']    ${formatted_date}
    Sleep            5s

    # ${future_date}=    Future Date    ${expiry_format}
    # ${formatted_date}=    Convert Date    ${future_date}    result_format=%d-%m-%Y
    # Click Element    xpath=//input[@placeholder='yyyy-dd-mm']
    # Press Keys       xpath=//input[@placeholder='yyyy-dd-mm']    CTRL+A
    # Press Keys       xpath=//input[@placeholder='yyyy-dd-mm']    BACKSPACE
    # Input Text       xpath=//input[@placeholder='yyyy-dd-mm']    ${formatted_date}
    # Sleep            5s

    Execute Javascript    window.scroll(0, 300)
    Sleep    3s

    # Click Element    xpath=//input[@placeholder='Social Security Number']
    # Press Keys              NONE    CTRL+A
    # Press Keys              NONE    BACKSPACE
    # Input Text    xpath=//input[@placeholder='Social Security Number']    ${ssn_num}
    # Sleep    3s

    # Click Element    xpath=//input[contains(@class, 'oxd-input--active')]
    # Press Keys              NONE    CTRL+A
    # Press Keys              NONE    BACKSPACE
    # Input Text    xpath=//input[contains(@class, 'oxd-input--active')]    ${sin_num}
    # Sleep    3s

    Click Element    xpath=//label[text()='Nationality']/../following-sibling::div//div[contains(@class,'oxd-select-text-input')]
    ${options}=    Get WebElements    xpath=//div[@role='listbox']//span
    ${count}=    Get Length    ${options}
    ${index}=    Evaluate    random.randint(0, ${count} - 1)    modules=random
    Click Element    ${options}[${index}]
    Sleep    5s
    ${status}=    Evaluate    random.choice(['Single', 'Married', 'Other'])    modules=random
    Click Element    xpath=//label[text()='Marital Status']/../following-sibling::div//div[contains(@class,'oxd-select-text-input')]
    Click Element    xpath=//div[@role='listbox']//span[normalize-space()='${status}']
    Sleep    5s
    ${dob}=          FakerLibrary.date_of_birth    minimum_age=18    maximum_age=65
    ${formatted}=    Convert Date    ${dob}    ${date_format}
    Click Element    xpath=//label[text()='Date of Birth']/../following-sibling::div//input
    Press Keys              NONE    CTRL+A
    Press Keys              NONE    BACKSPACE
    Input Text       xpath=//label[text()='Date of Birth']/../following-sibling::div//input    ${formatted}
    Sleep    5s
    ${radios}=    Get WebElements    xpath=//div[@class='oxd-radio-wrapper']//label
    ${count}=     Get Length    ${radios}
    ${index}=     Evaluate    random.randint(0, ${count} - 1)    modules=random
    Click Element    ${radios}[${index}]
    Sleep    5s

Save Updated Employee Personal Details
    Click Element    //div[@class='orangehrm-horizontal-padding orangehrm-vertical-padding']//button[@type='submit'][normalize-space()='Save']
    Sleep    10s

Employee Custom Fields
    ${word}    FakerLibrary.Word

    Execute Javascript    window.scroll(0, 300)
    Sleep    3s
    ${blood_types}=    Evaluate    ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-']    modules=random
    ${choice}=        Evaluate    random.choice(${blood_types})    modules=random
    Click Element    xpath=//label[text()='Blood Type']/../following-sibling::div//div[contains(@class,'oxd-select-text-input')]
    Click Element    xpath=//div[@role='listbox']//span[normalize-space()='${choice}']
    Sleep    5s
    Click Element    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[2]/div/form/div[1]/div/div[2]/div/div[2]/input
    Press Keys              NONE    CTRL+A
    Press Keys              NONE    BACKSPACE
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/div/div[2]/div[2]/div/form/div[1]/div/div[2]/div/div[2]/input    ${word}
    Sleep    3s
    Click Element    (//button[@type='submit'][normalize-space()='Save'])[2]
    Sleep    5s


#Contact Details
# Add Employee Contact Details
#     Click Element    //a[normalize-space()='Contact Details']
#     Sleep    3s

#DELETE
Delete Employee Data
    Click Element    //a[normalize-space()='Employee List']
    Sleep    5s
    Execute Javascript    window.scroll(0, 300)
    Sleep    3s
    Click Element    //button[@type='button' and .//i[contains(@class, 'bi-trash')]]
    Sleep    5s
    Click Element    //button[normalize-space()='No, Cancel']
    Sleep    5s
    Click Element    //button[@type='button' and .//i[contains(@class, 'bi-trash')]]
    Sleep    5s
    Click Element    //button[normalize-space()='Yes, Delete']
    Sleep    10s

#BADPATH - PIM
#Go To PIM Add Employee
Fill User Form With Invalid Data
    ${middleName}    FakerLibrary.Last Name
    ${lastName}    FakerLibrary.Last Name
    ${userName}    FakerLibrary.User Name

    Click Button    //button[normalize-space()='Add']
    Sleep    5s
    Click Button    //button[normalize-space()='Cancel']
    Sleep    5s
    Click Button    //button[normalize-space()='Add']
    Sleep    5s

    Input Text    //input[@placeholder='Middle Name']    ${middleName}
    Sleep    3s
    Input Text    //input[@placeholder='Last Name']    ${lastName}
    Sleep    3s
    Click Element    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div[2]/div[2]/div/label/span
    Sleep    5s
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div[2]/div[3]/div/div[1]/div/div[2]/input   ${userName}
    Sleep    3s
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div[2]/div[4]/div/div[1]/div/div[2]/input    ${emp_password}
    Sleep    3s
    Input Password    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div[2]/div[4]/div/div[2]/div/div[2]/input    ${emp_password}
    Sleep    3s
#Save New Employee Data



Go To Admin Add User
    Click Element    //*[@id="app"]/div[1]/div[1]/aside/nav/div[2]/ul/li[1]/a/span
    Sleep    5s

Fill Admin User Form With Valid Data
    ${Name}    FakerLibrary.Name
    ${randomLetter}    FakerLibrary.Random Letter
    ${userName}    FakerLibrary.User Name

    Click Button    //button[normalize-space()='Add']
    Sleep    5s
    Click Button    //button[normalize-space()='Cancel']
    Sleep    5s
    Click Button    //button[normalize-space()='Add']
    Sleep    5s

    ${roles}=    Create List    Admin    ESS
    ${choice}=   Evaluate    random.choice(${roles})    modules=random
    Click Element    xpath=//label[text()='User Role']/../following-sibling::div//div[contains(@class,'oxd-select-text')]
    Click Element    xpath=//div[@role='listbox']//span[text()='${choice}']
    Sleep    5s
    Input Text    //input[@placeholder='Type for hints...']    ${emp_letter}
    Sleep    5s
    Press Keys              NONE    ARROW_DOWN
    Press Keys              NONE    ENTER
    Sleep    5s
    ${status}=    Create List    Enabled    Disabled
    ${choice}=   Evaluate    random.choice(${status})    modules=random
    Click Element    xpath=//label[text()='Status']/../following-sibling::div//div[contains(@class,'oxd-select-text')]
    Click Element    xpath=//div[@role='listbox']//span[text()='${choice}']
    Sleep    5s
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[4]/div/div[2]/input    ${username}
    Sleep    5s
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[2]/div/div[1]/div/div[2]/input    ${emp_password}
    Sleep    5s
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[2]/div/div[2]/div/div[2]/input    ${emp_password}
    Sleep    5s
Save User Data
    Click Button    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[3]/button[2]
    Sleep    10s

Update User Data
    ${Name}    FakerLibrary.Name
    ${randomLetter}    FakerLibrary.Random Letter
    ${userName}    FakerLibrary.User Name

    Execute Javascript    window.scroll(0, 100)
    Sleep    3s
    Click Element    //button[@type='button'][.//i[contains(@class, 'bi-pencil-fill')]]
    Sleep    3s
    Click Element    //button[normalize-space()='Cancel']
    Sleep    3s
    Execute Javascript    window.scroll(0, 100)
    Sleep    3s
    Click Element    //button[@type='button'][.//i[contains(@class, 'bi-pencil-fill')]]
    Sleep    3s

    ${roles}=    Create List    Admin    ESS
    ${choice}=   Evaluate    random.choice(${roles})    modules=random
    Click Element    xpath=//label[text()='User Role']/../following-sibling::div//div[contains(@class,'oxd-select-text')]
    Click Element    xpath=//div[@role='listbox']//span[text()='${choice}']
    Sleep    5s

    Click Element    //input[@placeholder='Type for hints...']
    Press Keys              NONE    CTRL+A
    Press Keys              NONE    BACKSPACE
    Sleep    2s
    Input Text    //input[@placeholder='Type for hints...']    ${emp_letter}
    Sleep    5s
    Press Keys              NONE    ARROW_DOWN
    Press Keys              NONE    ENTER
    Sleep    3s

    ${status}=    Create List    Enabled    Disabled
    ${choice}=   Evaluate    random.choice(${status})    modules=random
    Click Element    xpath=//label[text()='Status']/../following-sibling::div//div[contains(@class,'oxd-select-text')]
    Click Element    xpath=//div[@role='listbox']//span[text()='${choice}']
    Sleep    5s
    
    Click Element    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[4]/div/div[2]/input
    Press Keys              NONE    CTRL+A
    Press Keys              NONE    BACKSPACE
    Sleep    2s
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[4]/div/div[2]/input    ${username}
    Sleep    5s

    Click Element    //i[@class='oxd-icon bi-check oxd-checkbox-input-icon']
    Sleep    3s

    Input Text    (//input[@type='password'])[1]    ${emp_password}
    Sleep    2s
    Input Text    (//input[@type='password'])[2]    ${emp_password}
    Sleep    2s

Save Updated Employee Data
    Click Button    //button[normalize-space()='Save']
    Sleep    5s

#Delete
Delete Employee Account Data
    
    Execute Javascript    window.scroll(0, 100)
    Sleep    3s
    Click Element    (//i[@class='oxd-icon bi-trash'])[2]
    Sleep    3s
    Click Element    //button[normalize-space()='No, Cancel']
    Sleep    2s
    Execute Javascript    window.scroll(0, 100)
    Sleep    3s
    Click Element    (//i[@class='oxd-icon bi-trash'])[2]
    Sleep    3s
    Click Element    //button[normalize-space()='Yes, Delete']
    Sleep    5s

#BADPATH - Admin
#Go To Admin Add Employee
Fill Admin User Form With Invalid Data
    ${Name}    FakerLibrary.Name
    ${randomLetter}    FakerLibrary.Random Letter
    ${userName}    FakerLibrary.User Name

    Click Button    //button[normalize-space()='Add']
    Sleep    5s
    Click Button    //button[normalize-space()='Cancel']
    Sleep    5s
    Click Button    //button[normalize-space()='Add']
    Sleep    5s

    ${roles}=    Create List    Admin    ESS
    ${choice}=   Evaluate    random.choice(${roles})    modules=random
    Click Element    xpath=//label[text()='User Role']/../following-sibling::div//div[contains(@class,'oxd-select-text')]
    Click Element    xpath=//div[@role='listbox']//span[text()='${choice}']
    Sleep    5s
    Input Text    //input[@placeholder='Type for hints...']    ${emp_letter}
    Sleep    5s
    Press Keys              NONE    ARROW_DOWN
    Press Keys              NONE    ENTER
    Sleep    5s
    ${status}=    Create List    Enabled    Disabled
    ${choice}=   Evaluate    random.choice(${status})    modules=random
    Click Element    xpath=//label[text()='Status']/../following-sibling::div//div[contains(@class,'oxd-select-text')]
    Click Element    xpath=//div[@role='listbox']//span[text()='${choice}']
    Sleep    5s
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[4]/div/div[2]/input    ${username}
    Sleep    5s
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[2]/div/div[1]/div/div[2]/input    ${emp_newPass}
    Sleep    5s
    Input Text    //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[2]/div/div[2]/div/div[2]/input    ${emp_newPass2}
    Sleep    5s
# Save User Data

Dashboard
    Click Element    //span[normalize-space()='Dashboard']
    Sleep    3s
Profile Dropdown
    Click Element    //p[@class='oxd-userdropdown-name']
    Sleep    3s
Logout
    Click Element    //span[@class='oxd-userdropdown-tab']
    Sleep    3s
    Click Element    //a[normalize-space()='Logout']
    Wait Until Page Contains Element    //div[@class='orangehrm-login-layout-blob']