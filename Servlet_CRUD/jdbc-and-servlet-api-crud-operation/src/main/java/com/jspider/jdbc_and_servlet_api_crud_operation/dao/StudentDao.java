package com.jspider.jdbc_and_servlet_api_crud_operation.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jspider.jdbc_and_servlet_api_crud_operation.connection.JdbcConnection;
import com.jspider.jdbc_and_servlet_api_crud_operation.dto.Student;

public class StudentDao {
	Connection connection = JdbcConnection.getConnection();
	
	public Student saveUserData(Student student) {
		String insertQuery = "insert into student(id,name,email,password,phone,dob,gender,age) VALUE (?,?,?,?,?,?,?,?)";

		try {
			PreparedStatement ps = connection.prepareStatement(insertQuery);
			ps.setInt(1, student.getId());
			ps.setString(2, student.getName());
			ps.setString(3, student.getEmail());
			ps.setString(4, student.getPassword());
			ps.setLong(5, student.getPhone());
			ps.setString(6, student.getDob());
			ps.setString(7, student.getGender());
			ps.setInt(8, student.getAge());
			int a = ps.executeUpdate();

			return a != 0 ? student : null;
		} catch (SQLException e) {

			e.printStackTrace();
			return null;
		}

	}
	public Student getStudentByEmail(String email) {
		String getStudentByEmailQuery = "SELECT email,password FROM student WHERE email = ?";

		try {
			PreparedStatement ps = connection.prepareStatement(getStudentByEmailQuery);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				String dbEmail = rs.getString("email");
				String password = rs.getString("password");

				Student student = new Student();

				student.setEmail(dbEmail);
				student.setPassword(password);
				
				return student;
			} else {
				return null;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	public List<Student> getAllStudent(){
		String displayAllStudentQuery = "SELECT * FROM student";
		try {
			PreparedStatement ps = connection.prepareStatement(displayAllStudentQuery);

			ResultSet rs = ps.executeQuery();
			List<Student> students = new ArrayList<>();
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String email = rs.getString("email");
				long phone = rs.getLong("phone");
				String dob = rs.getString("dob");
				String gender = rs.getString("gender");
				int age = rs.getInt("age");
				Student student = new Student();

				student.setId(id);
				student.setName(name);
				student.setEmail(email);
				student.setPhone(phone);
				student.setDob(dob);
				student.setGender(gender);
				student.setAge(age);
				students.add(student);
			}

			return students;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	public Student getStudentById(int userId){
		String displayAllStudentQuery = "SELECT * FROM student where id =?";
		try {
			PreparedStatement ps = connection.prepareStatement(displayAllStudentQuery);
            ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String email = rs.getString("email");
				long phone = rs.getLong("phone");
				String password = rs.getString("password");
				String dob = rs.getString("dob");
				String gender = rs.getString("gender");
				int age = rs.getInt("age");
				Student student = new Student();

				student.setId(id);
				student.setName(name);
				student.setEmail(email);
				student.setPhone(phone);
				student.getPassword();
				student.setDob(dob);
				student.setGender(gender);
				student.setAge(age);
				return student;
			}else {
				return null;
			}	
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean deleteStudentById(int id) {
		String deleteStudentQuery = "DELETE FROM student WHERE id = ?";

		try {
			PreparedStatement ps = connection.prepareStatement(deleteStudentQuery);
			ps.setInt(1, id);
			int a = ps.executeUpdate();
			return a != 0 ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	public Student updateStudentDao(Student student) {
		String updateUserQuery = "UPDATE student SET name = ?,email = ?,phone = ?,password = ?,dob = ?,gender = ?,age = ? WHERE id = ?";
		
		try {
			PreparedStatement ps = connection.prepareStatement(updateUserQuery);
			ps.setInt(8, student.getId());
			ps.setString(1, student.getName());
			ps.setString(2, student.getEmail());
			ps.setLong(3, student.getPhone());
			ps.setString(4, student.getPassword());
			ps.setString(5, student.getDob());
			ps.setString(6, student.getGender());
			ps.setInt(7, student.getAge());
			int a = ps.executeUpdate();
			return a != 0 ? student : null;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	

}
