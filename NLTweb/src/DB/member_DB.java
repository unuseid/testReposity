package DB;

import java.sql.*;
import java.util.*;


public class member_DB {
	String login_ID, login_PW, user_name, user_location, user_email, user_sex, user_age;

	
	private String jdbcURL = "jdbc:mysql://localhost:3306/webdb";
	private String dbID="root";
	private String dbPW="1031";
	
	private Connection conn= null;
	private PreparedStatement pstmt = null;
	private String Command;
	private Statement stmt;
	ResultSet rs;
	
	
	
	public void connect() throws SQLException{ //������ ���̽��� ���� jsp���������� �ݵ�� dbó�� �� ȣ������� ��
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcURL,dbID,dbPW);
			stmt = conn.createStatement();
		} catch (ClassNotFoundException e) {e.printStackTrace();}
	}
	
	
	
	
	public void disconnect() throws SQLException{//������ ���̽� �������� jps���������� �ݵ�� ������ �������
		if(pstmt!=null){pstmt.close();}
		if(conn!=null){conn.close();}
		if(stmt!=null){stmt.close();}
	}
	
	
	
	
	
	public boolean add_member() throws SQLException, ClassNotFoundException{// �ߺ� Ȯ���� ����� �߰������ �� ���� ��� �߰� ����� ��ȯ
		
		
		if(searchID()==false){
			if(login_ID!=null && login_PW!=null){
			String Command = String.format("insert into members"+"(login_ID) values('%s');",login_ID);//�ϴ� ��� �߰�
			stmt.executeUpdate(Command);
			
			Command = String.format("update members set login_PW='%s' where login_ID='%s';",login_PW,login_ID);
			stmt.executeUpdate(Command);
			}
			
			if(user_name!=null){
				Command = String.format("update members set name='%s' where login_ID='%s';",user_name,login_ID);
				stmt.executeUpdate(Command);
			}
			if(user_email!=null){
				Command = String.format("update members set email='%s' where login_ID='%s';",user_email,login_ID);
				stmt.executeUpdate(Command);
			}
			if(user_sex!=null){
				Command = String.format("update members set sex='%s' where login_ID='%s';",user_sex,login_ID);
				stmt.executeUpdate(Command);
			}
			if(user_age!=null){
				Command = String.format("update members set age='%s' where login_ID='%s';",user_age,login_ID);
				stmt.executeUpdate(Command);
			}
			if(user_location!=null){
				Command = String.format("update members set location='%s' where login_ID='%s';",user_location,login_ID);
				stmt.executeUpdate(Command);
			}
			return true;
		}
		
		return false;
		
	}
	
	
	
	public boolean searchID() throws ClassNotFoundException, SQLException{

			String Command = String.format("select *from members where login_ID='"+login_ID+"'");
	
			ResultSet rs = stmt.executeQuery(Command);  //��� result�� ��ü rs�� ��ȯ
			
			return rs.next();

	}
	
	
	public boolean isLoginSec() throws SQLException{
		Command = String.format("select * from members where login_ID='"+login_ID+"' AND login_PW='"+login_PW+"';");
		
		rs = stmt.executeQuery(Command);  //��� result�� ��ü rs�� ��ȯ
		
		return rs.next();
	}
	public String get_logined_user_location() throws SQLException{
		return rs.getString("location");
	}
	
	public int isAdmin_num() throws SQLException{
		Command = String.format("select * from members where login_ID='"+login_ID+"' AND login_PW='"+login_PW+"';");
		
		ResultSet rs = stmt.executeQuery(Command);  //��� result�� ��ü rs�� ��ȯ
		rs.next();
		Command = rs.getString("num");
		
		if("0".equals(Command)==true){return 0;}
		else if("1".equals(Command)==true){return 1;}
		else if("2".equals(Command)==true){return 2;}
		return 99;
	}
	



	/////get �� set �Լ��� ���� ������ ������ ���� �ڵ����� ���
	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getLogin_ID() {
		return login_ID;
	}

	public void setLogin_ID(String login_ID) {
		this.login_ID = login_ID;
	}

	public String getLogin_PW() {
		return login_PW;
	}

	public void setLogin_PW(String login_PW) {
		this.login_PW = login_PW;
	}

	public String getUser_location() {
		return user_location;
	}

	public void setUser_location(String user_location) {
		this.user_location = user_location;
	}

	public String getUser_email() {
		return user_email;
	}


	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_sex() {
		return user_sex;
	}

	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}

	public String getUser_age() {
		return user_age;
	}

	public void setUser_age(String user_age) {
		this.user_age = user_age;
	}
	
	
	
}
//ȸ���� ������ ���̽� ��ü�� ���ϴ� ���� �̴�. ũ�� ȸ�� ����(add_member�Լ�)�� �α����Լ������ �����Ѵ�
//