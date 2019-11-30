package com.anup.user.servlets.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class loginDao {   
        String sql = "select * from users where email = ? and password = ? ";
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
	public ResultSet getdetails(String uname,String pass) throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection	con = DriverManager.getConnection(url,username,password);
		Statement statement = con.createStatement();
		ResultSet rs = statement.executeQuery("select * from users ");
		return rs;
	}
}