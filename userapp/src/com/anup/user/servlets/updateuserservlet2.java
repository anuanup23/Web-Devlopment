package com.anup.user.servlets;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/updateServlet")
public class updateuserservlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
          public void init (ServletConfig config)
          {
        	  try {
        		  Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/mydb", "root", "2304");
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
          }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String email = request.getParameter("email");
		        String password = request.getParameter("password");
		
		try {
			Statement statement = connection.createStatement();
			int result = statement.executeUpdate("update user set password = '"+password+"' where email = '"+email+"'");
		    PrintWriter out = response.getWriter();
		    if(result > 0)
		    	out.print("<H1>PASSWORD UPDATED</H1>");
		    else
		    	out.print("<H1>ERROR</H1>");
		    } 
		catch (SQLException e) {
			e.printStackTrace();
		}	}
    public void destroy() 
    {
    	try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }	
}