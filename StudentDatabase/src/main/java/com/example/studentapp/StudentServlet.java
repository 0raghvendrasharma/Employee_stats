package com.example.studentapp;

import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

public class StudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            addStudent(request, response);
        } else if ("update".equals(action)) {
            updateStudent(request, response);
        } else if ("delete".equals(action)) {
            deleteStudent(request, response);
        } else if ("fetch".equals(action)) { 
            fetchStudent(request, response);
        } else if ("fetchAll".equals(action)) { // New action to fetch all students
            fetchAllStudents(request, response);
        }
    }

    private void addStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        int age = Integer.parseInt(request.getParameter("age"));
        String department = request.getParameter("department");

        Student student = new Student(name, id, age, department);

        try (Connection connection = DatabaseUtil.getConnection()) {
            String sql = "INSERT INTO students (name, id, age, department) VALUES (?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, student.getName());
                statement.setString(2, student.getId());
                statement.setInt(3, student.getAge());
                statement.setString(4, student.getDepartment());

                int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) {
                    response.getWriter().print("Student added successfully!");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("Error: " + e.getMessage());
        }
    }

    private void updateStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        int age = Integer.parseInt(request.getParameter("age"));
        String department = request.getParameter("department");

        Student student = new Student(name, id, age, department);

        try {
            DatabaseUtil.updateStudent(student);
            response.getWriter().print("Student updated successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("Error: " + e.getMessage());
        }
    }

    private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");

        try {
            DatabaseUtil.deleteStudent(id);
            response.getWriter().print("Student deleted successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("Error: " + e.getMessage());
        }
    }
    
    private void fetchStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");

        try {
            Student student = DatabaseUtil.getStudentById(id);
            if (student != null) {
                // Set student details as request attributes
                request.setAttribute("fetchedStudent", student);
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            } else {
                response.getWriter().print("Student not found!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("Error: " + e.getMessage());
        }
    }
    
    private void fetchAllStudents(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            List<Student> students = DatabaseUtil.getAllStudents();  // Fetch all students
            if (students != null && !students.isEmpty()) {
                request.setAttribute("studentList", students);  // Set list of students in request attribute
                request.getRequestDispatcher("/index.jsp").forward(request, response);  // Forward to index.jsp
            } else {
                response.getWriter().print("No students found!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("Error: " + e.getMessage());
        }
    }
}