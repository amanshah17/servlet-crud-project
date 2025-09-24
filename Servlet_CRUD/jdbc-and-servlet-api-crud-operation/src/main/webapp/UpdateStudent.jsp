<%@page import="com.jspider.jdbc_and_servlet_api_crud_operation.dao.StudentDao"%>
<%@page import="com.jspider.jdbc_and_servlet_api_crud_operation.dto.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Student Details</title>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 20px;
        color: #fff;
    }

    .form-container {
        background: rgba(30, 30, 30, 0.95);
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0px 8px 20px rgba(0,0,0,0.6);
        width: 400px;
        backdrop-filter: blur(10px);
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #f5f5f5;
    }

    label {
        font-weight: bold;
        margin-bottom: 6px;
        display: block;
        color: #ccc;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"],
    input[type="date"],
    input[type="number"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border-radius: 8px;
        border: 1px solid #555;
        background: #1e1e1e;
        color: #fff;
        font-size: 14px;
    }

    input:focus {
        outline: none;
        border-color: #667eea;
        box-shadow: 0 0 8px rgba(102,126,234,0.6);
    }

    input[type="submit"] {
        background: #4DD7F0;
        color: #000;
        border: none;
        padding: 12px;
        border-radius: 8px;
        width: 100%;
        font-size: 16px;
        cursor: pointer;
        transition: 0.3s;
    }

    input[type="submit"]:hover {
        background: #1bb6d4;
    }
</style>
</head>
<body>
    <%
    int id = Integer.parseInt(request.getParameter("id"));
    Student student = new StudentDao().getStudentById(id);
    %>
    <div class="form-container">
        <h2>Update Student</h2>
        <form action="updateStudent" method="post">
            <label for="id">Id</label>
            <input type="text" name="id" value="<%= student.getId() %>" readonly="readonly">

            <label for="name">Name</label>
            <input type="text" name="name" value="<%= student.getName() %>" required>

            <label for="email">Email</label>
            <input type="email" name="email" value="<%= student.getEmail() %>" required>

            <label for="phone">Phone</label>
            <input type="text" name="phone" value="<%= student.getPhone() %>" required>

            <label for="dob">DOB</label>
            <input type="date" name="dob" value="<%= student.getDob() %>" required>

            <label for="gender">Gender</label>
            <input type="text" name="gender" value="<%= student.getGender() %>" required>

            <label for="age">Age</label>
            <input type="number" name="age" value="<%= student.getAge() %>" required>

            <label for="password">Password</label>
            <input type="password" name="password" value="<%= student.getPassword() %>" required>

            <input type="submit" value="Update">
        </form>
    </div>
</body>
</html>