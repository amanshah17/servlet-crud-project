<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page
	import="com.jspider.jdbc_and_servlet_api_crud_operation.dto.Student"%>
<%@page import="java.util.List"%>
<%@page
	import="com.jspider.jdbc_and_servlet_api_crud_operation.dao.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Management System</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Arial', sans-serif;
	background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
	min-height: 100vh;
	color: #fff;
}

nav {
	height: 70px;
	width: 100%;
	background-color: #191c1c;
	display: flex;
	justify-content: center;
	align-items: center;
	position: fixed;
	top: 0;
	left: 0;
}

article {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 40px;
	font-weight: 700;
	color: #246682;
}

section {
	margin-top: 70px;
	height: 200px;
	width: 100%;
	display: flex;
	justify-content: space-between;
	padding-right: 50px;
}

#add {
	margin-left: 60px;
	margin-top: 94px;
	height: 100px;
	width: 200px;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #283638;
	border-radius: 30px;
}

#btn1 {
	background-color: #387dba; height : 40px;
	width: 150px;
	height: 40px;
}

.sort-btn {
    margin-top: 135px;
	background: #387dba;
	color: black;
	margin-right: 10px;
}

.table-container {
	width: 95%;
	margin: 40px auto;
	overflow-x: auto;
}

table {
	width: 100%;
	border-collapse: collapse;
	background: rgba(30, 30, 30, 0.95);
	border-radius: 12px;
	overflow: hidden;
	box-shadow: 0px 8px 25px rgba(0, 0, 0, 0.6);
	color: #fff;
	font-family: 'Arial', sans-serif;
}

thead {
	background: linear-gradient(135deg, #203a43, #2c5364);
	color: #f5f5f5;
	text-transform: uppercase;
	letter-spacing: 0.05em;
	font-size: 14px;
}

th, td {
	padding: 14px 18px;
	text-align: left;
	border-bottom: 1px solid #444;
}

tbody tr:hover {
	background: rgba(255, 255, 255, 0.05);
	transition: 0.3s ease;
}

td {
	color: #ddd;
	font-size: 15px;
}

/* Buttons */
button {
	border: none;
	padding: 6px 14px;
	border-radius: 6px;
	cursor: pointer;
	font-size: 14px;
	font-weight: bold;
	transition: 0.3s;
}

button.edit-btn {
	background: #4DD7F0;
	color: #000;
}

button.edit-btn:hover {
	background: #1bb6d4;
}

button.delete-btn {
	background: #e63946;
	color: #fff;
}

button.delete-btn:hover {
	background: #c1121f;
}
</style>
</head>
<body>
    <nav><article>Student Management System</article></nav>

	<section>
		<div id="add">
			<a href="AddStudent.jsp"><button id="btn1">ADD STUDENT</button></a>
		</div>
		<div style="margin-bottom:20px; text-align:center;">
            <a href="StudentData.jsp?sort=id"><button class="sort-btn">Sort by ID</button></a>
            <a href="StudentData.jsp?sort=name"><button class="sort-btn">Sort by Name</button></a>
            <a href="StudentData.jsp?sort=age"><button class="sort-btn">Sort by Age</button></a>
        </div>
	</section>

	<div class="table-container">
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>DOB</th>
                <th>Gender</th>
                <th>Age</th>
                <th colspan="2">Action</th>
            </tr>
        </thead>
        <tbody>
            <% 
               String sort = request.getParameter("sort");
               List<Student> students = new StudentDao().getAllStudent();
               if("id".equals(sort)){
            	   Collections.sort(students, (s1,s2) -> s1.getId()-s2.getId());
               }else if("name".equals(sort)){
            	   Collections.sort(students, (s1,s2) -> s1.getName().compareTo(s2.getName()));
               }else if("age".equals(sort)){
            	   Collections.sort(students, (s1,s2) -> s1.getAge() - s2.getAge());
               }
               for(Student student : students) { 
            %>
            <tr>
                <td><%= student.getId() %></td>
                <td><%= student.getName() %></td>
                <td><%= student.getEmail() %></td>
                <td><%= student.getPhone() %></td>
                <td><%= student.getDob() %></td>
                <td><%= student.getGender() %></td>
                <td><%= student.getAge() %></td>
                <td>
                    <a href="UpdateStudent.jsp?id=<%=student.getId() %>">
                        <button class="edit-btn">EDIT</button>
                    </a>
                </td>
                <td>
                    <a href="delete?id=<%= student.getId() %>">
                        <button class="delete-btn">DELETE</button>
                    </a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>


</body>
</html>