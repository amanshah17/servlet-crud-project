package com.jspider.jdbc_and_servlet_api_crud_operation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.Period;

import com.jspider.jdbc_and_servlet_api_crud_operation.dao.StudentDao;
import com.jspider.jdbc_and_servlet_api_crud_operation.dto.Student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;
@WebServlet (value="/addStudent")
public class AddStudentController implements Servlet {

	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ServletConfig getServletConfig() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		long phone = Long.parseLong(req.getParameter("phone"));
		String dob = req.getParameter("dob");
		String gender = req.getParameter("gender");

		// Convert DOB to LocalDate and calculate age
		LocalDate birthDate = LocalDate.parse(dob);
		LocalDate today = LocalDate.now();
		int age = Period.between(birthDate, today).getYears();

		
		Student student = new Student();
		
		student.setId(id);
		student.setName(name);
		student.setEmail(email);
		student.setPassword(password);
		student.setPhone(phone);
		student.setDob(dob);
		student.setGender(gender);
		student.setAge(age);
		
		StudentDao studentDao =  new StudentDao();
		Student student1 = studentDao.saveUserData(student);
		
        PrintWriter printWriter = res.getWriter();
        printWriter.write("<html><body>");
        if(student1 != null) {
        	System.out.println("Student Added successful");
        	printWriter.write("<script type='text/javascript'>");
        	printWriter.write("alert('Student Added successful! Welcome to Student Management System');");
        	printWriter.write("</script>");
        	RequestDispatcher dispatch = req.getRequestDispatcher("StudentData.jsp");
        	dispatch.include(req, res);
        }else {
        	System.out.println("Add Student Details failed");
        	printWriter.write("<script type='text/javascript'>");
        	printWriter.write("alert('Add Student Details failed! Please try again.');");
        	printWriter.write("</script>");
        	RequestDispatcher dispatch = req.getRequestDispatcher("AddStudent.jsp");
        	dispatch.include(req, res);
        }
		
	}

	@Override
	public String getServletInfo() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	

}
