<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="member_DB" class="DB.member_DB" scope="page"/>
<jsp:setProperty  name="member_DB" property="login_ID"/>
<jsp:setProperty  name="member_DB" property="login_PW"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//선택 입력사항들 입력했으면 수동으로 set함수를 이용해 변수 넘겨줌 jsp:setProperty이용시 변수가 넘어오지 않으면 오류를 일으킴 필수이입항목은 위에서 처리함



member_DB.connect(); 

boolean isLoginSec;
int adminnum=100;

isLoginSec = member_DB.isLoginSec();

%>
결과 <%=isLoginSec %>
<%=member_DB.getLogin_ID() %>
<%=member_DB.getLogin_PW() %>

<%
  if(isLoginSec==true)
  {
	  session.setAttribute("logined_user_ID",request.getParameter("login_ID"));
	  session.setAttribute("logined_user_location", member_DB.get_logined_user_location());
	  adminnum = member_DB.isAdmin_num();
	  session.setAttribute("adminnum","5");
	  
	  if(adminnum==0){session.setAttribute("adminnum","0");}
	  else if(adminnum==1){session.setAttribute("adminnum","1");}
	  else if(adminnum==2){session.setAttribute("adminnum","2");}
	  session.setAttribute("pageControll","search");
	  response.sendRedirect("../Main_page/MainPage.jsp");
  }
%>

로그인 실패!
AdminNum =<%=adminnum%>
<%member_DB.disconnect(); %>
</body>
</html>