package control;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Articolo;
public class addCart extends HttpServlet {
	
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
			for(int i=0; !found && i<carrello.size(); i++){
				if(carrello.get(i).getId().equals((String)request.getParameter("id"))){
					found = true;
					carrello.get(i).setQuantita(carrello.get(i).getQuantita()+ Integer.parseInt((String)request.getParameter("quantita")));
				}
			}
			
			if(!found){
				Articolo nuovoArticolo = new Articolo();
				nuovoArticolo.setQuantita(Integer.parseInt((String)request.getParameter("quantita")));
				nuovoArticolo.setId((String)request.getParameter("id"));
				carrello.add(nuovoArticolo);
			}
		}
		getServletContext().getRequestDispatcher("/cart.jsp").forward(request, response);
	}	
}


