package control;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class addWishlist extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException{
		HttpSession session=request.getSession();
		ArrayList<String> wishlist;
		synchronized(session){
			wishlist = (ArrayList<String>)session.getAttribute("wishlist");
			if(wishlist==null){
				wishlist = new ArrayList<String>();
				session.setAttribute("wishlist", wishlist);
			}
			
			boolean found = false;
			for(int i=0; !found && i<wishlist.size(); i++){
				if(wishlist.get(i).equals((String)request.getParameter("id")))
					found = true;
			}
			
			if(!found)
				wishlist.add((String)request.getParameter("id"));
		}
		getServletContext().getRequestDispatcher("/wishlist.jsp").forward(request, response);
	}	
}


