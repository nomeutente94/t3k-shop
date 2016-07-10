package control;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class fillDatabase extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		String numberofproducts=request.getParameter("numberofproducts");
		
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			String url = "jdbc:mysql://127.0.0.1:3306/t3kshop";	
			Connection con=DriverManager.getConnection(url,"root","nokian70");	
			System.out.println("Connessione	OK	\n");
			String sql="insert into Prodotto values(?,?,?,?,?,?,?,?,?,?,?)";
			
			for(int i=1; i<Integer.parseInt(numberofproducts+1); i++){
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setInt(1,i);
				ps.setString(2,String.valueOf(i));
				ps.setString(3,String.valueOf(i));
				ps.setString(4,String.valueOf(i));
				ps.setString(5,String.valueOf(i));
				ps.setString(6,String.valueOf(i));
				ps.setString(7,String.valueOf(i));
				ps.setString(8,String.valueOf(i));
				ps.setString(9,String.valueOf(i));
				ps.setString(10,String.valueOf(i));
				ps.setInt(11,i);
				ps.executeUpdate();
			}
			con.close();		
		}catch(Exception e)	{	
			System.out.println("Connessione	Fallita	\n");				
			System.out.println(e);	
		}
	}
}

	