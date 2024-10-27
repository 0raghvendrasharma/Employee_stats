package com.example.studentapp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DatabaseUtil {
    private static final String URL = "jdbc:mysql://localhost:3306/studentdb"; // Update with your database
    private static final String USER = "root"; // Update with your DB username
    private static final String PASSWORD = "pblproject9827"; // Update with your DB password

    public static Connection getConnection() throws SQLException {
        // Load MySQL JDBC Driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL Driver not found.", e);
        }
        
        // Establish connection
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // Method to update a student record
    public static void updateStudent(Student student) throws SQLException {
        try (Connection connection = getConnection()) {
            String sql = "UPDATE students SET name=?, age=?, department=? WHERE id=?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, student.getName());
                statement.setInt(2, student.getAge());
                statement.setString(3, student.getDepartment());
                statement.setString(4, student.getId());
                statement.executeUpdate();
            }
        }
    }

    // Method to delete a student record
    public static void deleteStudent(String studentId) throws SQLException {
        try (Connection connection = getConnection()) {
            String sql = "DELETE FROM students WHERE id=?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, studentId);
                statement.executeUpdate();
            }
        }
    }
    
    public static Student getStudentById(String id) throws SQLException {
        Student student = null;
        try (Connection connection = getConnection()) {
            String sql = "SELECT name, id, age, department FROM students WHERE id=?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, id);
                ResultSet resultSet = statement.executeQuery();
                if (resultSet.next()) {
                    String name = resultSet.getString("name");
                    int age = resultSet.getInt("age");
                    String department = resultSet.getString("department");
                    student = new Student(name, id, age, department);
                }
            }
        }
        return student;
    }
    public static List<Student> getAllStudents() throws SQLException {
        List<Student> students = new ArrayList<>();
        try (Connection connection = getConnection()) {
            String sql = "SELECT name, id, age, department FROM students";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                ResultSet resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    String name = resultSet.getString("name");
                    String id = resultSet.getString("id");
                    int age = resultSet.getInt("age");
                    String department = resultSet.getString("department");
                    Student student = new Student(name, id, age, department);
                    students.add(student);  // Add student to list
                }
            }
        }
        return students;
    }
}
