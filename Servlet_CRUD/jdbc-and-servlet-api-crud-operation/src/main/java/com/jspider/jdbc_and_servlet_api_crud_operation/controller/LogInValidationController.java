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


@WebServlet (value = "/studentLoginController")
public class LogInValidationController extends GenericServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void service(ServletRequest req, ServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
	    String userEmail = req.getParameter("email");
	    String userPassword = req.getParameter("password");

	    StudentDao studentDao =  new StudentDao();
	    Student student = studentDao.getStudentByEmail(userEmail);

	    PrintWriter printWriter = resp.getWriter();
	    printWriter.write("<html><body>");

	    if (student != null && student.getPassword().equals(userPassword)) {
	        System.out.println("Login successful");
	        printWriter.write("<script type='text/javascript'>");
	        printWriter.write("alert('Login successful! Welcome to Student Management System');");
	        printWriter.write("</script>");
	        RequestDispatcher dispatch = req.getRequestDispatcher("StudentData.jsp");
	        dispatch.include(req, resp);
	    } else {
	        System.out.println("Login Failed");
	        printWriter.write("<script type='text/javascript'>");
	        printWriter.write("alert('Login Failed! Wrong email or password');");
	        printWriter.write("</script>");
	        RequestDispatcher dispatch = req.getRequestDispatcher("StudentLogin.jsp"); 
	        dispatch.include(req, resp);
	    }

	    printWriter.write("</body></html>");
	}

}
