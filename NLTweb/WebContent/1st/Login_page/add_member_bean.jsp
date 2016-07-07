<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<%request.setCharacterEncoding("UTF-8"); %>   
<jsp:useBean id="member_DB" class="DB.member_DB" scope="page"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:setProperty  name="member_DB" property="login_ID"/>
<jsp:setProperty  name="member_DB" property="login_PW"/>
<jsp:setProperty  name="member_DB" property="user_name"/>
<jsp:setProperty  name="member_DB" property="user_sex"/>
<jsp:setProperty  name="member_DB" property="user_age"/>
<jsp:setProperty  name="member_DB" property="user_location"/>
<jsp:setProperty  name="member_DB" property="user_email"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
//선택 입력사항들 입력했으면 수동으로 set함수를 이용해 변수 넘겨줌 jsp:setProperty이용시 변수가 넘어오지 않으면 오류를 일으킴 필수이입항목은 위에서 처리함
String user_location = request.getParameter("user_location");
String user_age = request.getParameter("usr_age");
String user_email = request.getParameter("usr_email");
String user_sex = request.getParameter("usr_sex");

member_DB.connect(); 

boolean add_member_sec;
String user_name;

add_member_sec = member_DB.add_member();



member_DB.disconnect();


%>
<% if(add_member_sec==true){%><jsp:include page="./add_member_congratulation.jsp"/><%}%>
<% if(add_member_sec==false){%><jsp:include page="./add_member_fail.jsp"/><%}%>






</body>
</html>