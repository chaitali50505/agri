package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	public static Connection connect()
	{
		//Use Tomcat version 7.0
		Connection con=null;
		try {
		Class.forName("com.mysql.jdbc.Driver");
//		System.out.println("Driver loaded");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rentaldb","root","");
			System.out.println("Connection Established");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return(con);
	}
}
