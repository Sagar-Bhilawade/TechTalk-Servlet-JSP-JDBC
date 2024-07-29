package com.tech.talk.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
	private static Connection con;

	public static Connection getConnection() {
		try {
			//Create connection only one time rest time just provide created one
			if (con == null) {
				// Driver class load
				Class.forName("com.mysql.cj.jdbc.Driver");

				// Create a Connection
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/techtalk", "root", "manager");

			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return con;
	}

}
