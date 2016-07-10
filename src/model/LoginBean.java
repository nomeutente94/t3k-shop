package model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class LoginBean {
	String username,password;
	Connection	con;
	String	url	=	"jdbc:mysql://127.0.0.1:3306/t3kshop";
	public LoginBean(){
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			String url = "jdbc:mysql://127.0.0.1:3306/t3kshop";	
			con=DriverManager.getConnection(url,"root","nokian70");
			System.out.println("Connessione	OK	\n");
		}catch(Exception e)	{	
			System.out.println("Connessione	Fallita	\n");				
			System.out.println(e);	
		}
	}
	
	public void setUsername(String username){
		this.username=username;
	}
	
	public void setPassword(String password){
		this.password=password;
	}
	
	public boolean isFound()throws SQLException{
		boolean found = false;
		String sql="select * from cliente where username=? and password=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1,username);
		ps.setString(2,password);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			if(username.equals(rs.getString("username"))&& password.equals(rs.getString("password")))
				found=true;
		}
		ps.close();
		con.close();
		return found;
		
	}
	

}
