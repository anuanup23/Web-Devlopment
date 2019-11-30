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
@WebServlet("/totalmarks")
public class Scoreval extends HttpServlet {
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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		if(request.getParameter("option") == null)
		{
			out.println("<script type=\"text/javascript\">");
			   out.println("alert('please select an option');");
			   out.println("location='Display.jsp';");
		   out.println("</script>");
		}
		int answer  = 0;
		answer = Integer.parseInt(request.getParameter("option"));
		HttpSession session = request.getSession();
		int index = (int)session.getAttribute("index");
		int score = (int)session.getAttribute("score");
		int noofques = (int)session.getAttribute("NoOfQues");
		String query = "SELECT * FROM questions where q_id = "+index+"";
			 Statement st;
			try {
				st = connection.createStatement();
				  ResultSet rs= st.executeQuery(query);
			  while(rs.next()) {
				  index = index + 1;
				  if(answer == rs.getInt(7)) 
					  score = score + 1;
				  session.setAttribute("index", index);
				  session.setAttribute("score", score);
			  }
				if(index < noofques) {
				response.sendRedirect("Display.jsp");
				}
				else
				{
					int roll = (int)session.getAttribute("roll");
				int r = st.executeUpdate("update marks set marks = marks + "+score+",tot_tests = tot_tests + 1 where roll ="+roll+""); 
			    response.sendRedirect("seescore.jsp");  
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
