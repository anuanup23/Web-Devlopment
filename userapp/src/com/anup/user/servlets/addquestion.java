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
@WebServlet("/addquestion")
public class addquestion extends HttpServlet {
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
		if(request.getParameter("ques") == "")
		{
			out.println("<script type=\"text/javascript\">");
			   out.println("alert('please add aquestion');");
			   out.println("location='addQue.jsp';");
		   out.println("</script>");
		}
		if(request.getParameter("first") == "")
		{
			out.println("<script type=\"text/javascript\">");
			   out.println("alert('please add first option');");
			   out.println("location='addQue.jsp';");
		   out.println("</script>");
		}
		if(request.getParameter("second") == "")
		{
			out.println("<script type=\"text/javascript\">");
			   out.println("alert('please add second option');");
			   out.println("location='addQue.jsp';");
		   out.println("</script>");
		}
		if(request.getParameter("third") == "")
		{
			out.println("<script type=\"text/javascript\">");
			   out.println("alert('please add third option');");
			   out.println("location='addQue.jsp';");
		   out.println("</script>");
		}
		if(request.getParameter("fourth") == "")
		{
			out.println("<script type=\"text/javascript\">");
			   out.println("alert('please add fourth option');");
			   out.println("location='addQue.jsp';");
		   out.println("</script>");
		}
		String ques = request.getParameter("ques");
		String first = request.getParameter("first");
		String second = request.getParameter("second");
		String third = request.getParameter("third");
		String fourth = request.getParameter("fourth");
		int ans  = Integer.parseInt(request.getParameter("ans"));
		try {
			Statement statement = connection.createStatement();
			ResultSet rs= statement.executeQuery("select max(q_id) from questions");
			int q = 0;
			  if(rs.next())
			  {
				  q = (int)rs.getInt(1);
				  q = q + 1;
			  }
			int result = statement.executeUpdate("insert into questions values("+q+",'"+ques+"','"
			+first+"','"+second+"','"+third+"','"+fourth+"',"+ans+")");
		    if(result > 0) {
		    	out.println("<script type=\"text/javascript\">");
				   out.println("alert('Question Added Successfully');");
				   out.println("location='addQue.jsp';");
			   out.println("</script>");
		    }
		    else
		    {
		    	out.println("<script type=\"text/javascript\">");
				   out.println("alert('Question Was Not Added An Error Was Ocurred');");
				   out.println("location='addQue.jsp';");
			   out.println("</script>");
	        } 
		}
		catch (SQLException e) {
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
