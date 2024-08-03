package com.tech.talk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.tech.talk.entities.User;

public class UserDao {
	private Connection connection;

	public UserDao(Connection con) {
		this.connection = con;
	}

	public boolean saveUser(User user) {
		boolean f = false;
		try {
			String query = "insert into user(name, email, password, gender, about) values (?, ?, ?, ?, ?)";
			PreparedStatement pst = connection.prepareStatement(query);
			pst.setString(1, user.getName());
			pst.setString(2, user.getEmail());
			pst.setString(3, user.getPassword());
			pst.setString(4, user.getGender());
			pst.setString(5, user.getAbout());
			if (pst.executeUpdate() > 0) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
