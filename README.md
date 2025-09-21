# OrangeHRM Automation with RobotFramework

## 📌 Introduction
BDD-style test automation for **OrangeHRM Demo** using **Robot Framework** with Gherkin syntax. Delivers maintainable, human-readable, and scalable QA workflows.

The automation covers:
- CRUD functionality (Create, Read, Update, Delete)  
- Good and bad test cases  
- Dynamic data generation using **Faker**  
- Dropdown handling  
- Modal interactions  

---

## ⚙️ Framework Setup
The project is structured as follows:
```
orangehrm-test/
├── test.robot # Main test suite
├── actions/
│ └── keyboards.robot # Keywords
└── variables/
└── test_variables.robot # Global variables
```

- Tests follow **Gherkin-style syntax** for readability and behavior-driven development (BDD).

---

## 🧪 Test Scenarios

### ✅ Create Employee (Good Path)
- Logs in, navigates to **Add Employee**
- Generates realistic names and IDs with **Faker**
- Uploads a profile image
- Submits the form successfully

### ❌ Create Employee (Bad Path)
- Leaves required fields empty  
- Triggers validation messages  
- Confirms proper form validation enforcement  

### ✏️ Read and Update Employee
- Edits existing employee data (name, marital status, license number, nationality)  
- Uses randomized inputs for realistic coverage  

### 🗑️ Delete Employee
- Handles **cancel** and **confirm** delete actions  
- Automates confirmation modal interactions  

### 👤 Admin User CRUD
- Creates and updates system users via the **Admin panel**  
- Uses randomized data with **dropdown selections** for roles and statuses  

---

## ▶️ Test Execution
Run the suite with:
  ``` bash
  robot test.robot
  ```

- Reports and logs are generated automatically in HTML format
- Tests are modular and reusable for scalability

### 👨‍💻 Author

Developed by Beverly A. Canoy
