package com.anup.user.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/Logout")
public class logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
         	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		         		HttpSession session = request.getSession();
         		session.removeAttribute("username");
         		session.removeAttribute("lname");
         		session.removeAttribute("branch");
         		session.removeAttribute("roll");
         		session.removeAttribute("fname");
         		session.removeAttribute("score");
         		session.removeAttribute("index");
         		session.removeAttribute("completed");
         		session.invalidate();
         		response.sendRedirect("login.jsp");
         	}
}