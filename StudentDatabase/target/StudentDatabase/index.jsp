<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Management Portal</title>
    <style>
        /* Base styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7f9;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            padding: 0;
        }

        /* Container and heading styles */
        .container {
            max-width: 800px;
            width: 100%;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            padding: 2em;
            margin: 20px;
            text-align: center;
        }

        h1 {
            color: #0056b3;
            font-size: 2.5em;
            margin-bottom: 0.5em;
        }

        .box {
            background-color: #f9fbfd;
            padding: 1.5em;
            border-radius: 6px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 1.5em;
            text-align: left;
        }

        /* Form and button styles */
        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 0.5em;
            color: #333;
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"] {
            padding: 0.5em;
            border-radius: 4px;
            border: 1px solid #ccc;
            margin-bottom: 1em;
            font-size: 1em;
            width: 100%;
        }

        input[type="submit"] {
            background-color: #0056b3;
            color: #fff;
            padding: 0.8em;
            border: none;
            border-radius: 4px;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #00408d;
        }

        /* Table styles */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1em;
        }

        table, th, td {
            border: 1px solid #ccc;
            padding: 0.75em;
            text-align: left;
        }

        th {
            background-color: #0056b3;
            color: white;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .container {
                padding: 1em;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Employee Management Portal</h1>

        <!-- Employee Registration Box -->
        <div class="box">
            <h2>Register Employee</h2>
            <form action="student" method="post">
                <input type="hidden" name="action" value="add">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>

                <label for="id">ID:</label>
                <input type="text" id="id" name="id" required>

                <label for="age">Age:</label>
                <input type="number" id="age" name="age" required>

                <label for="department">Department:</label>
                <input type="text" id="department" name="department" required>

                <input type="submit" value="Add Employee">
            </form>
        </div>

        <!-- Update Employee Box -->
        <div class="box">
            <h2>Update Employee</h2>
            <form action="student" method="post">
                <input type="hidden" name="action" value="update">
                <label for="updateId">ID:</label>
                <input type="text" id="updateId" name="id" required>

                <label for="updateName">Name:</label>
                <input type="text" id="updateName" name="name" required>

                <label for="updateAge">Age:</label>
                <input type="number" id="updateAge" name="age" required>

                <label for="updateDepartment">Department:</label>
                <input type="text" id="updateDepartment" name="department" required>

                <input type="submit" value="Update Employee">
            </form>
        </div>

        <!-- Delete Employee Box -->
        <div class="box">
            <h2>Delete Employee</h2>
            <form action="student" method="post">
                <input type="hidden" name="action" value="delete">
                <label for="deleteId">ID:</label>
                <input type="text" id="deleteId" name="id" required>

                <input type="submit" value="Delete Employee">
            </form>
        </div>

        <!-- Fetch Employee Box -->
        <div class="box">
            <h2>Fetch Employee</h2>
            <form action="student" method="post">
                <input type="hidden" name="action" value="fetch">
                <label for="fetchId">ID:</label>
                <input type="text" id="fetchId" name="id" required>
                <input type="submit" value="Fetch Employee">
            </form>
            <!-- Display Fetched Employee Details -->
            <c:if test="${not empty fetchedEmployee}">
                <div class="fetched-data">
                    <h3>Fetched Employee Details:</h3>
                    <p>Name: ${fetchedEmployee.name}</p>
                    <p>ID: ${fetchedEmployee.id}</p>
                    <p>Age: ${fetchedEmployee.age}</p>
                    <p>Department: ${fetchedEmployee.department}</p>
                </div>
            </c:if>
        </div>

        <!-- Fetch All Employees Box -->
        <div class="box">
            <h2>Fetch All Employees</h2>
            <form action="student" method="post">
                <input type="hidden" name="action" value="fetchAll">
                <input type="submit" value="Fetch All Employees">
            </form>
            <!-- Display All Employees Table -->
            <c:if test="${not empty employeeList}">
                <h3>All Employees:</h3>
                <table>
                    <tr>
                        <th>Name</th>
                        <th>ID</th>
                        <th>Age</th>
                        <th>Department</th>
                    </tr>
                    <c:forEach var="employee" items="${employeeList}">
                        <tr>
                            <td>${employee.name}</td>
                            <td>${employee.id}</td>
                            <td>${employee.age}</td>
                            <td>${employee.department}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
        </div>

        <!-- Run Process Script Box -->
        <div class="box">
            <h2>Run File to Send Mail</h2>
            <form action="runProcess" method="post">
                <input type="hidden" name="action" value="run">
                <input type="submit" value="Run Script">
            </form>
        </div>

    </div>
</body>
</html>
