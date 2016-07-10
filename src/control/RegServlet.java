package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserBean;
public class RegServlet extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException{
		response.setContentType("text/html");
		UserBean usBean= new UserBean();
		usBean.setNome(request.getParameter("nome"));
		usBean.setCognome(request.getParameter("cognome"));
		usBean.setIndirizzo(request.getParameter("indirizzo"));
		usBean.setCap(request.getParameter("cap"));
		usBean.setCitta(request.getParameter("citta"));
		usBean.setStato(request.getParameter("stato"));
		usBean.setdataNascita(request.getParameter("dataNascita"));
		usBean.setTelefono(request.getParameter("telefono"));
		usBean.setEmail(request.getParameter("email"));
		usBean.setUsername(request.getParameter("username"));
		usBean.setPassword(request.getParameter("password"));
		try{
			if(usBean.insertUser()){
				HttpSession session=request.getSession();
				session.setMaxInactiveInterval(60*60*24*365);
				synchronized(session){
					session.setAttribute("username",request.getParameter("username"));
					getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
				}
			}
		}catch(Exception e)	{	
			System.out.println("Connessione	Fallita	\n");				
			System.out.println(e);	
		}

		
	}
}
	
	