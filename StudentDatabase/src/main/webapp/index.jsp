<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Form</title>
</head>
<body>
    <h1>Student Registration</h1>
    <form action="student" method="post">
        <input type="hidden" name="action" value="add">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br>

        <label for="id">ID:</label>
        <input type="text" id="id" name="id" required><br>

        <label for="age">Age:</label>
        <input type="number" id="age" name="age" required><br>

        <label for="department">Department:</label>
        <input type="text" id="department" name="department" required><br>

        <input type="submit" value="Add Student">
    </form>

    <h2>Update Student</h2>
    <form action="student" method="post">
        <input type="hidden" name="action" value="update">
        <label for="updateId">ID:</label>
        <input type="text" id="updateId" name="id" required><br>

        <label for="updateName">Name:</label>
        <input type="text" id="updateName" name="name" required><br>

        <label for="updateAge">Age:</label>
        <input type="number" id="updateAge" name="age" required><br>

        <label for="updateDepartment">Department:</label>
        <input type="text" id="updateDepartment" name="department" required><br>

        <input type="submit" value="Update Student">
    </form>

    <h2>Delete Student</h2>
    <form action="student" method="post">
        <input type="hidden" name="action" value="delete">
        <label for="deleteId">ID:</label>
        <input type="text" id="deleteId" name="id" required><br>

        <input type="submit" value="Delete Student">
    </form>

    <h2>Fetch Student</h2>
    <form action="student" method="post">
        <input type="hidden" name="action" value="fetch">
        <label for="fetchId">ID:</label>
        <input type="text" id="fetchId" name="id" required><br>
        <input type="submit" value="Fetch Student">
    </form>

    <c:if test="${not empty fetchedStudent}">
        <h3>Fetched Student Details:</h3>
        <p>Name: ${fetchedStudent.name}</p>
        <p>ID: ${fetchedStudent.id}</p>
        <p>Age: ${fetchedStudent.age}</p>
        <p>Department: ${fetchedStudent.department}</p>
    </c:if>
    
    <!-- Fetch All Students Form -->
    <h2>Fetch All Students</h2>
    <form action="student" method="post">
        <input type="hidden" name="action" value="fetchAll">
        <input type="submit" value="Fetch All Students">
    </form>

    <!-- Display All Students -->
    <c:if test="${not empty studentList}">
        <h3>All Students:</h3>
        <table border="1">
            <tr>
                <th>Name</th>
                <th>ID</th>
                <th>Age</th>
                <th>Department</th>
            </tr>
            <c:forEach var="student" items="${studentList}">
                <tr>
                    <td>${student.name}</td>
                    <td>${student.id}</td>
                    <td>${student.age}</td>
                    <td>${student.department}</td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    
</body>
</html>
