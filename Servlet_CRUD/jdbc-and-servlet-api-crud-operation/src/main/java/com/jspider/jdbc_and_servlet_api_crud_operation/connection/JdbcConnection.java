package com.jspider.jdbc_and_servlet_api_crud_operation.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.cj.jdbc.Driver;

public class JdbcConnection {
	public static Connection getConnection() {
		try {
			Driver driver = new Driver();
			DriverManager.registerDriver(driver);
			String url = "jdbc:mysql://localhost:3306/student-management" ;
			String username = "root";
			String password = "Aman@1712";
			return DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
