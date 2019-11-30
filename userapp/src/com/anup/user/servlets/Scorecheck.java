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
import javax.servlet.http.HttpSession;
@WebServlet("/Scorecheck")
public class Scorecheck extends HttpServlet {
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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
	    {
		 int answer = 0;
	     int  color = Integer.parseInt(request.getParameter("q_answer")) ;
	     if(color == 3 ) answer = answer + 1;
	     color = Integer.parseInt(request.getParameter("q_answer1")) ;
	     if(color == 4 ) answer = answer + 1;
	     color = Integer.parseInt(request.getParameter("q_answer2")) ;
	     if(color == 1 )   answer = answer + 1;
	     color = Integer.parseInt(request.getParameter("q_answer3")) ;
	     if(color == 2)   answer = answer + 1;
	     response.setContentType("text/html");
	     PrintWriter out = response.getWriter();
			      HttpSession session = request.getSession(true);
			     int roll = (int) session.getAttribute("roll");
			     Statement statement = connection.createStatement();
			   int result = statement.executeUpdate("update marks set marks = marks + "+answer+" , tot_tests = tot_tests + 1 where roll = "+roll+"");
			   if(result > 0)
			   {
		         out.println("<script type=\"text/javascript\">");
			     out.println("alert("+answer+");");
			     out.println("location='Welcome.jsp';");
			     out.println("</script>");
			   }
			   else
			   {
				     out.println("<script type=\"text/javascript\">");
				     out.println("alert(error);");
				     out.println("location='Welcome.jsp';");
				     out.println("</script>");
			   }
	    }
	    catch(Exception exception)
	    {
	        exception.printStackTrace();    
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
