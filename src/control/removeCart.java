package control;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Articolo;
public class removeCart extends HttpServlet {
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException{
		HttpSession session=request.getSession();
		ArrayList<Articolo> carrello;
		synchronized(session){
			carrello = (ArrayList<Articolo>)session.getAttribute("carrello");
			if(carrello==null){
				carrello = new ArrayList<Articolo>();
				session.setAttribute("carrello", carrello);
			}
			
			boolean found = false;
			System.out.println((String)request.getParameter("id"));
			System.out.println((String)request.getParameter("quantita"));
			for(int i=0; !found && i<carrello.size(); i++){
				if(carrello.get(i).getId().equals((String)request.getParameter("id"))){
					found = true;
					carrello.get(i).setQuantita(carrello.get(i).getQuantita()- Integer.parseInt((String)request.getParameter("quantita")));
					if(carrello.get(i).getQuantita()<=0)
						carrello.remove(i);
				}
			}
		}
		getServletContext().getRequestDispatcher("/cart.jsp").forward(request, response);
	}	
}


