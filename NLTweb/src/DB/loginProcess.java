package DB;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.servlet.*;

@WebServlet("/loginProcess")
public class loginProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public loginProcess() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id =request.getParameter("userid");
		String password = request.getParameter("userpassword");
		String result;
		
		if(checkLoginInfo(id,password)){
			HttpSession session = request.getSession();
			session.setAttribute("LOGIN_ID", id);
			result="SUCCESS";
		}else{
			result="FAIL";
		}
		response.sendRedirect("manin_page.jsp?LOGIN_RESULT="+result);
	}



private boolean checkLoginInfo(String id,String password){
	
	String jdbcURL = "jdbc:mysql://localhost:3306/webdb";
	String dbID="root";
	String dbPW="1031";
	
	Connection conn=null;
	Statement stmt=null;
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcURL,dbID,dbPW);
	
	stmt = conn.createStatement();
	
	String Command = String.format("select login_PW from members where login_ID='"+loginID+"'");
	
	ResultSet rs = stmt.executeQuery(Command); 
	
	}
}
