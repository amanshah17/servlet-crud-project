package com.jspider.jdbc_and_servlet_api_crud_operation.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.jspider.jdbc_and_servlet_api_crud_operation.dao.StudentDao;

import jakarta.servlet.GenericServlet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;

@WebServlet (value = "/delete")
public class DeleteStudentController extends GenericServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		int id = Integer.parseInt(req.getParameter("id"));
		PrintWriter printWriter = res.getWriter();
		printWriter.write("<html><body>");
		if(new StudentDao().deleteStudentById(id)) {
			System.out.println("User Deleted successful");
			printWriter.write("<script type='text/javascript'>");
			printWriter.write("alert('User Data Deleted successful!');");
			printWriter.write("</script>");
			RequestDispatcher dispatcher = req.getRequestDispatcher("StudentData.jsp");
			dispatcher.include(req, res);
		}else {
			System.out.println("User Deleted not successful");
			printWriter.write("<script type='text/javascript'>");
			printWriter.write("alert('User Data Not Deleted !');");
			printWriter.write("</script>");
			RequestDispatcher dispatcher = req.getRequestDispatcher("StudentData.jsp");
			dispatcher.include(req, res);
		}
		printWriter.write("</body></html>");
		
	}

}
