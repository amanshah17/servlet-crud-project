<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Login</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

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
        width: 350px;
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
    input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border-radius: 8px;
        border: 1px solid #555;
        background: #1e1e1e;
        color: #fff;
        font-size: 14px;
    }

    input[type="text"]:focus,
    input[type="password"]:focus {
        outline: none;
        border-color: #667eea;
        box-shadow: 0 0 8px rgba(102,126,234,0.6);
    }

    input[type="submit"] {
        background: rgba(255, 255, 255, 0.05);
        color: white;
        border: none;
        padding: 12px;
        border-radius: 8px;
        width: 100%;
        font-size: 16px;
        cursor: pointer;
        transition: 0.3s;
    }

    input[type="submit"]:hover {
        background: rgb(47, 71, 71);
    }

    .register-link {
        text-align: center;
        margin-top: 15px;
    }

    .register-link a {
        text-decoration: none;
        color: #90cdf4;
        font-weight: bold;
        transition: 0.3s;
    }

    .register-link a:hover {
        color: #63b3ed;
    }
</style>
</head>
<body>
    <div class="form-container">
        <h2>Student Login</h2>
        <form action="studentLoginController" method="post">
            <label for="email">Email</label>
            <input type="text" id="email" name="email" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>

            <input type="submit" value="Login">
        </form>
        <div class="register-link">
            <p>Don’t have an account? <a href="StudentRegistration.jsp">Register here</a></p>
        </div>
    </div>
</body>
</html>
