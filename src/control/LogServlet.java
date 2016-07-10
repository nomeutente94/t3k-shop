package control;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.LoginBean;
public class LogServlet extends HttpServlet{
	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
			response.setContentType("text/html");
			LoginBean login=new LoginBean();
			login.setUsername(request.getParameter("username"));
			login.setPassword(request.getParameter("password"));
		try{
			if(login.isFound()){
				HttpSession session=request.getSession();
				session.setMaxInactiveInterval(60*60*24*365);
				synchronized(session){
					session.setAttribute("username", request.getParameter("username"));
					getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
				}
			}else{}
		}catch(Exception e)	{	
			System.out.println("Connessione	Fallita	\n");				
			System.out.println(e);	
		}
				
	}
	}



