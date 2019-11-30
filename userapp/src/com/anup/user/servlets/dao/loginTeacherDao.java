package com.anup.user.servlets.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class loginTeacherDao {
	 String sql = "select * from teacher where username = ? and password = ? ";
	    String url ="jdbc:mysql://localhost:3307/quiz";
	    String username = "root";
	    String password = "2304";
	public boolean check(String uname ,String pass,Connection connection) throws SQLException
  {
		PreparedStatement st = connection.prepareStatement(sql);
		st.setString(1,uname);
		st.setString(2,pass);
		ResultSet rs = st.executeQuery();
		if(rs.next()) return true;
		return false;
  }
}
