package com.example.studentapp;

public class Student {
    private String name;
    private String id;
    private int age;
    private String department;

    // Constructor
    public Student(String name, String id, int age, String department) {
        this.name = name;
        this.id = id;
        this.age = age;
        this.department = department;
    }

    // Getters and Setters
    public String getName() 
    { return name; }
    
    public void setName(String name) 
    { this.name = name; }
    
    public String getId() 
    { return id; }
    
    public void setId(String id) 
    { this.id = id; }
    
    public int getAge() 
    { return age; }
    
    public void setAge(int age) 
    { this.age = age; }
    
    public String getDepartment() 
    { return department; }
    
    public void setDepartment(String department) 
    { this.department = department; }
}
