*** Settings ***
Resource    ./actions/keywords.robot

*** Test Cases ***
Login in OrangeHRM
    [Tags]    good    bad
    Given User Test Website
    When User fill the form with valid data
    Then User click login button

Valid PIM Employee Creation
    [Tags]    good
    Given User is on the PIM page
    When User fill the form with valid employee info
    And User save the employee
    Then User should see the employee info page
Invalid PIM Employee Creation
    [Tags]    bad
    Given User is on the PIM pagev2
    When User fill the form with invalid employee info
    Then User save the invalid employee info
PIM Employee Update Personal Details
    [Tags]    good
    Given User is on the PIM page
    When User updates the employee's personal details
    Then User saves the employee's personal details changes
    Then User add employee custom fields info
PIM Employee Delete
    [Tags]    good
    Given User is on the PIM page
    And User delete employee data



Valid Admin User Employee Creation
    [Tags]    good
    Given User is on the admin page
    When User fill the form with valid user info
    Then User save the admin user data

Invalid Admin User Employee Creation
    [Tags]    bad
    Given User is on the admin page
    When User fill the form with invalid user info
    And User save the admin user invalid data

Admin Employee Update Account Data
    [Tags]    good
    Given User is on the admin page
    When User updates the employee's account data
    Then User save the employee account data

Admin Employee Delete Account Data
    [Tags]    good
    Given User is on the admin page
    Then User delete employee account data

User Logout in OrangeHRM
    [Tags]    good    bad
    Given User is on Dashboard
    Then User Click Profile Dropdown
    Then User Click Logout

*** Keywords ***

User Test Website
    User Opens Browser and Go to URL
User fill the form with valid data
    Login To OrangeHRM
User click login button
    Login Button


#GOODPATH - PIM
User is on the PIM page
    Go To PIM Add Employee
User fill the form with valid employee info
    Fill User Form With Valid Data
User save the employee
    Save New Employee Data
User should see the employee info page
    Employee List

#Update
User updates the employee's personal details
    Employee Personal Info
User saves the employee's personal details changes
    Save Updated Employee Personal Details
User add employee custom fields info
    Employee Custom Fields
#Delete
User delete employee data
    Delete Employee Data

#BADPATH - PIM
User is on the PIM pagev2
    Go To PIM Add Employee
User fill the form with invalid employee info
    Fill User Form With Invalid Data
User save the invalid employee info
    Save New Employee Data


#GOODPATH - Admin
User is on the admin page
    Go To Admin Add User
User fill the form with valid user info
    Fill Admin User Form With Valid Data
User save the admin user data
    Save User Data
#Update
User updates the employee's account data
    Update User Data
User save the employee account data
    Save Updated Employee Data
#Delete
User delete employee account data
    Delete Employee Account Data

#BADPATH - Admin
User fill the form with invalid user info
    Fill Admin User Form With Invalid Data
User save the admin user invalid data
    Save User Data

User is on Dashboard
    Dashboard
User Click Profile Dropdown
    Profile Dropdown
User Click Logout
    Logout