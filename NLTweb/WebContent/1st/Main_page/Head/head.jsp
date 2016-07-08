<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" type="text/css" href="../style.css" media="screen" />
<%request.setCharacterEncoding("euc-kr");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<h1><p id="머리">NLssTwebdd DEMO!</p></h1>
  
         <%=session.getAttribute("logined_user_ID")%>님어서오세요
         (<%=session.getAttribute("adminnum")%>등급)       
</body>
</html>