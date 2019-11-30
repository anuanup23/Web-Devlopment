package com.anup.user.servlets;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.anup.user.servlets.dao.loginTeacherDao;
@WebServlet("/teacherlogin")
public class teacherlogin extends HttpServlet {
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
		String uname = request.getParameter("username");
		String pass = request.getParameter("password");	
		PrintWriter out = response.getWriter();
		loginTeacherDao dao = new loginTeacherDao();
		 try {
		if(dao.check(uname, pass, connection)) {
			HttpSession session = request.getSession();
			session.setAttribute("username", uname);
			response.sendRedirect("addQue.jsp");
		}
			else 
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('User or password incorrect');");
				out.println("location='loginTeacher.jsp';");
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
