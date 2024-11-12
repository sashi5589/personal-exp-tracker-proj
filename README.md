# Personal Expense Tracker - Comprehensive Documentation

## 1. Project Overview
The Personal Expense Tracker is a web-based application designed to help users monitor their daily expenses, categorize transactions, and visualize spending patterns. It provides a simple yet effective way to keep track of finances, making it ideal for personal budgeting and financial planning.

### Use Cases
- **Track Spending**: Keep track of daily expenses and categorize them for easy reference.
- **Analyze Patterns**: Understand monthly spending trends and adjust budgets accordingly.
- **Generate Reports**: Create detailed reports of expenses to review spending habits.

This project uses a Python Flask backend and a MySQL database, and is containerized using Docker and Docker Compose for easy deployment.

---

## 2. Features
### a) User Authentication
- Register and log in to access your account.
- Passwords are securely stored using hashing techniques.

### b) Expense Management
- Add new expenses with details such as date, amount, category, and payment mode.
- Edit or delete existing expenses.

### c) Categorization
- Expenses can be categorized (e.g., Food, Travel, Utilities) to help track spending in specific areas.
- View expenses by category to see where most of your money is going.

### d) Reporting and Visualization
- Generate monthly reports to see total spending per category.
- Visualize expenses using bar charts and pie charts to analyze patterns.

---

## 3. API Documentation

### Register User
- **Endpoint**: `/register`
- **Method**: `POST`
- **Payload**:
  ```json
  {
    "username": "user1",
    "email": "user1@example.com",
    "password": "password123"
  }
  ```
- **Response**:
  - `201 Created` on successful registration.

### Login User
- **Endpoint**: `/login`
- **Method**: `POST`
- **Payload**:
  ```json
  {
    "username": "user1",
    "password": "password123"
  }
  ```
- **Response**:
  - `200 OK` with session token.

### Add Expense
- **Endpoint**: `/create_expense_entry`
- **Method**: `POST`
- **Payload**:
  ```json
  {
    "date": "2024-11-10",
    "expensename": "Groceries",
    "amount": 50,
    "paymode": "Credit Card",
    "category": "Food"
  }
  ```

### View Expenses
- **Endpoint**: `/view_expenses`
- **Method**: `GET`
- **Response**:
  ```json
  [
    {
      "id": 1,
      "date": "2024-11-10",
      "expensename": "Groceries",
      "amount": 50,
      "paymode": "Credit Card",
      "category": "Food"
    }
  ]
  ```

### Delete Expense
- **Endpoint**: `/delete_expense/<id>`
- **Method**: `DELETE`
- **Response**: `204 No Content`

---

## 4. Database Schema
The application uses a MySQL database with the following schema:

### Tables:
1. **Users**
   - `id`: Primary key
   - `username`: Unique
   - `email`: Unique
   - `password`: Hashed

2. **Expenses**
   - `id`: Primary key
   - `user_id`: Foreign key referencing `users.id`
   - `date`: Date of expense
   - `expensename`: Name of the expense
   - `amount`: Expense amount
   - `paymode`: Payment mode (e.g., cash, credit card)
   - `category`: Expense category

---

## 5. Installation and Setup

### Prerequisites
Ensure you have the following installed:
- Python 3.x
- Docker & Docker Compose

### Step 1: Clone the Repository
```bash
git clone <repository-url>
cd personal-expense-tracker
```

### Step 2: Create Environment Variables
Create a `.env` file with:
```
MYSQL_HOST=db
MYSQL_USER=mysql
MYSQL_PASSWORD=password
MYSQL_DB=expenses
FLASK_ENV=development
```

### Step 3: Build and Run Using Docker Compose
```bash
docker-compose up --build
```

### Step 4: Access the Application
Open your browser and go to:
```
http://localhost:5000
```

---

## 6. Usage Guide
1. **Register** a new account using the sign-up page.
2. **Log in** to your account to start tracking expenses.
3. Use the dashboard to **add expenses**, categorize them, and generate reports.
4. View monthly charts to see spending trends and adjust your budget.

---

## 7. Troubleshooting

### Common Issues
1. **MySQL Connection Error**:
   - Ensure that the database credentials in the `.env` file are correct.
   - Make sure the MySQL container is running.

2. **Port Already in Use**:
   - If port `5000` or `3306` is already in use, modify the `docker-compose.yml` file.

### Tips for Production
- Use environment variables for sensitive information.
- Use a production-grade database like PostgreSQL for better performance.

---
