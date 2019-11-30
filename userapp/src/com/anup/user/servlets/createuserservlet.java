package com.anup.user.servlets;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/addServlet")
public class createuserservlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
	private Connection connection;
          public void init (ServletConfig config)
          {
        	  try {
        		  Class.forName("com.mysql.jdbc.Driver");
				  connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/quiz", "root", "2304");
			} catch (SQLException e) {
				  e.printStackTrace();
			} catch (ClassNotFoundException e) {
				  e.printStackTrace();
			}
          }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		if(request.getParameter("firstName") == "")
		{
			out.println("<script type=\"text/javascript\">");
			   out.println("alert('please insert FirstName');");
			   out.println("location='index.jsp';");
		   out.println("</script>");
		}
		if(request.getParameter("lastName") == "")
		{
			out.println("<script type=\"text/javascript\">");
			   out.println("alert('please insert SecondName');");
			   out.println("location='index.jsp';");
		   out.println("</script>");
		}
		if(request.getParameter("email") == "")
		{
			out.println("<script type=\"text/javascript\">");
			   out.println("alert('please insert Email');");
			   out.println("location='index.jsp';");
		   out.println("</script>");
		}
		if(request.getParameter("password") == "")
		{
			out.println("<script type=\"text/javascript\">");
			   out.println("alert('please insert Password');");
			   out.println("location='index.jsp';");
		   out.println("</script>");
		}
		if(request.getParameter("branch") == "")
		{
			out.println("<script type=\"text/javascript\">");
			   out.println("alert('please insert Branch');");
			   out.println("location='index.jsp';");
		   out.println("</script>");
		}
		if(request.getParameter("rollno") == null)
		{
			out.println("<script type=\"text/javascript\">");
			   out.println("alert('please insert Roll Number');");
			   out.println("location='index.jsp';");
		   out.println("</script>");
		}
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		int rollno = Integer.parseInt(request.getParameter("rollno"));
		int test = 0;
		String branch = request.getParameter("branch");
			try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(" select * from users where roll = "+rollno+" or email = '"+email+"'");
			if(rs.next())
			{
				 out.println("<script type=\"text/javascript\">");
				   out.println("alert('User Already Present');");
				   out.println("location='login.jsp';");
			   out.println("</script>");
				
			}
			int result = statement.executeUpdate("insert into users values('"+firstName+"','"
			+lastName+"','"+email+"','"+password+"','"+branch+"',"+rollno+")");
		    if(result > 0) {
		    	int res = statement.executeUpdate("insert into marks values("+rollno+","+test+","+test+")");
		    	if(res > 0)
		    	response.sendRedirect(request.getContextPath() + "/login.jsp");
		    	else
		        response.sendRedirect(request.getContextPath() + "/index.jsp");
		    }
		    else
		    	response.sendRedirect(request.getContextPath() + "/index.jsp");
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