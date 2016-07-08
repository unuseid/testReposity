<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd
아이디 중복 검사 단계">
<html>
<head>



<%

Connection con = null;
Statement stmt = null;

try{
	String jdbcURL = "jdbc:mysql://localhost:3306/webdb";
	String dbID="root";
	String dbPW="1031";
	
	request.setCharacterEncoding("UTF-8");
	Class.forName("com.mysql.jdbc.Driver"); //드라이버 로드
	con = DriverManager.getConnection(jdbcURL,dbID,dbPW); //연결
	if(con==null){throw new Exception("데이터베이스 연결불가<br>");}
		
	stmt = con.createStatement(); //statement 객체 확보
	
	
	String loginID = request.getParameter("login_ID");//적은 아이디 가져옴
	
	out.println("<center>넘어온 아이디는 <b>"+loginID + "</b>입니다.</center>");

	
	
	
	
	String Command = String.format("select *from members where login_ID='"+loginID+"'");
	
	out.println(Command);//검사문
	
	ResultSet rs = stmt.executeQuery(Command);  //결과가 result형 객체 rs로 반환
	
	boolean isData = rs.next();
	
	
	if(isData){out.print("사용 불가능한 아이디 입니다!");}
	else{out.print("사용 가능한 아이디 입니다!");}
	
	stmt.close(); //연결 해제
	
	
	   

	
	
	
}catch(Exception e){
	out.println(e);
}

%>






<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<H2>searchID</H2>
</body>
</html>