# Library Management System

A database-driven desktop application designed to manage user records in a library.
Developed using Java (Swing GUI), JDBC, and SQL as part of the DBMS course project.

---

## Table of Contents

* Introduction
* Features
* Technologies Used
* System Requirements
* Database Structure
* How It Works
* Screenshots (optional)
* Future Enhancements
* Team Members

---

## Introduction

The Library Management System is a simple Java-based desktop application that allows a librarian to manage user information efficiently. It supports operations such as adding new users, updating existing records, searching for user details, and deleting entries from the database. The goal of the project is to demonstrate practical implementation of DBMS concepts and JDBC connectivity.

---

## Features

* Add new users to the database
* Update existing user details
* Search for a user using user ID
* Delete a user record
* Simple and user-friendly Java Swing interface
* Secure and efficient database operations using Prepared Statements

---

## Technologies Used

* Java
* Java Swing (GUI)
* JDBC (Java Database Connectivity)
* MySQL / Oracle SQL Database
* NetBeans IDE (or any Java IDE used)

---

## System Requirements

* JDK 8 or above
* Database server (MySQL/Oracle)
* JDBC driver
* IDE like NetBeans, IntelliJ, or Eclipse

---

## Database Structure

Table Name: `users`
Columns:

* user_id
* user_name
* email
* contact_info_u
* membership_id
* librarian_id

---

## How It Works

### Insert User

Takes input from text fields and inserts it into the `users` table using:

```sql
INSERT INTO users VALUES (?, ?, ?, ?, ?, ?)
```

### Update User

Modifies user details based on user ID:

```sql
UPDATE users SET user_name=?, email=?, contact_info_u=?, membership_id=?, librarian_id=? WHERE user_id=?
```

### Search User

Fetches and displays user details:

```sql
SELECT * FROM users WHERE user_id=?
```

### Delete User

Removes a user record:

```sql
DELETE FROM users WHERE user_id=?
```

---

## Future Enhancements

* Implement login authentication for librarians
* Add book management (issue, return, stock)
* Use a modern UI framework or web-based interface
* Add validation for email, phone numbers, and user inputs
* Include search filters and sorting options

---

## Team Members

* Kisshor
* Naren
* Nithyasri

---

If you want, I can also make a **GitHub-friendly README.md** with proper Markdown styling.
