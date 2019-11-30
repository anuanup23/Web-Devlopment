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
import javax.servlet.http.HttpSession;
import com.anup.user.servlets.dao.loginDao;
@WebServlet("/login")
public class login extends HttpServlet {
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
				String Fname, Lname ,Branch;
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
					String uname = request.getParameter("email");
					String pass = request.getParameter("password");	
					int score = 0;
					int qid = 1;
					boolean test = false;
					PrintWriter out = response.getWriter();
					loginDao dao = new loginDao();
		 		 try {
		 			Statement statement = connection.createStatement();
					ResultSet rs = statement.executeQuery(" select * from users where email = '"+uname+"' ");
					
					if(dao.check(uname, pass, connection))
			 {
				HttpSession session = request.getSession();
				session.setAttribute("username", uname);
				while(rs.next()) {	
				session.setAttribute("fname",rs.getString(1));
				   session.setAttribute("lname",rs.getString(2));
				   session.setAttribute("branch",rs.getString(5));
				   session.setAttribute("roll",rs.getInt(6));
				   session.setAttribute("score",score);
				   session.setAttribute("index",qid);
				   session.setAttribute("Completed",test);
				   ResultSet r = statement.executeQuery(" select count(*) from questions");
				   while(r.next())
				   {
					   int noofques = (int)r.getInt(1);
					   noofques++;
					   session.setAttribute("NoOfQues", noofques);
				   }
				   response.sendRedirect("Welcome.jsp");
				}
			 }
			 else 
			 {
		   out.println("<script type=\"text/javascript\">");
			   out.println("alert('User or password incorrect');");
			   out.println("location='login.jsp';");
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