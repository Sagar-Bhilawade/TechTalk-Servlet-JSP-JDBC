package com.tech.talk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
	
//	Get user by email and password
	public User getUserEmailAndPassword(String email , String password) {
		User user =null ;
		try {
			String query ="select * from user where email = ? and password = ?";
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			ResultSet rst = pstmt.executeQuery();
			if(rst.next()) {
				user=new User();
				user.setId(rst.getInt("id"));
				user.setName(rst.getString("name"));
				user.setEmail(rst.getString("email"));
				user.setPassword(rst.getString("password"));
				user.setAbout(rst.getString("about"));
				user.setGender(rst.getString("gender"));
				user.setDateTime(rst.getTimestamp("rdate"));
				user.setProfile(rst.getString("profile"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
		
		
	}
}
