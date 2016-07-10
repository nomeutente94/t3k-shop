package control;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class SearchServlet extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		response.setContentType("text/html");
		String searchKey = request.getParameter("text-search");
		String page = request.getParameter("page");
		String type = request.getParameter("type");
		request.setAttribute("searchKey", searchKey);
		request.setAttribute("page", page);
		request.setAttribute("type", type);
		getServletContext().getRequestDispatcher("/search_result.jsp").forward(request, response);
	}
}
