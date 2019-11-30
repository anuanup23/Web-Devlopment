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
@WebServlet("/delete")
public class delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection connection;
	public void init (ServletConfig config)
 {
	  try {
		  Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/quiz", "root", "2304");
	} catch (SQLException e) {
		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
 }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
	 			Statement statement;
				try {
					PrintWriter out = response.getWriter();
					statement = connection.createStatement();
					int rs = statement.executeUpdate("delete from questions");
					if(rs > 0)
					{
						 out.println("<script type=\"text/javascript\">");
						   out.println("alert('All Previous Questions Deleted');");
						   out.println("location='addQue.jsp';");
					   out.println("</script>");
					}
					else
					{
						 out.println("<script type=\"text/javascript\">");
						   out.println("alert('Nothing Deleted Or Nothing Was There To Delete');");
						   out.println("location='addQue.jsp';");
					   out.println("</script>");
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
	}
	public void destroy() 
    {
    	try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }
}
