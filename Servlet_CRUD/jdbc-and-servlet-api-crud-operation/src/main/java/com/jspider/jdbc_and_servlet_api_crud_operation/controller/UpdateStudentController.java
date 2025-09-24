package com.jspider.jdbc_and_servlet_api_crud_operation.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.jspider.jdbc_and_servlet_api_crud_operation.dao.StudentDao;
import com.jspider.jdbc_and_servlet_api_crud_operation.dto.Student;

import jakarta.servlet.GenericServlet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;
@WebServlet (value="/updateStudent")
public class UpdateStudentController extends GenericServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
        String email = req.getParameter("email");
        long phone = Long.parseLong(req.getParameter("phone"));
        String password = req.getParameter("password");
        String dob = req.getParameter("dob");
        String gender = req.getParameter("gender");
        int age = Integer.parseInt(req.getParameter("age"));
       
        
        Student student = new Student();
        student.setId(id);
        student.setName(name);
        student.setEmail(email);
        student.setPhone(phone);
        student.setPassword(password);
        student.setDob(dob);
        student.setGender(gender);
        student.setAge(age);
        StudentDao studentDao = new StudentDao();
        
        Student student2 = studentDao.updateStudentDao(student);
        
        PrintWriter printWriter = res.getWriter();
        printWriter.write("<html><body>");
        if(student2 != null) {
        	System.out.println("Update successfully");
        	printWriter.write("<script type='text/javascript'>");
        	printWriter.write("alert('Update successfully!');");
        	printWriter.write("</script>");
        	RequestDispatcher dispatch = req.getRequestDispatcher("StudentData.jsp");
        	dispatch.include(req, res);
        }else {
        	System.out.println("Not Updated");
        	printWriter.write("<script type='text/javascript'>");
        	printWriter.write("alert('Updatedation failed! Please try again.');");
        	printWriter.write("</script>");
        	RequestDispatcher dispatch = req.getRequestDispatcher("StudentData.jsp");
        	dispatch.include(req, res);
        }
		
	}

}
