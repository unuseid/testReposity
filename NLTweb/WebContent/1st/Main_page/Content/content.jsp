<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">    
<%request.setCharacterEncoding("euc-kr");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<h1><p id="몸">contnet DEMO!</p></h1>
<%
        boolean isAdmin=false;
        
        String adminnum = (String)session.getAttribute("adminnum");
        
        if("0".equals(adminnum) || "1".equals(adminnum) || "2".equals(adminnum)){
        	isAdmin=true;
        }
        
        
        if(isAdmin){ %><jsp:include page="./included_Admin_goods_Add.jsp"></jsp:include> <%}%>
        <jsp:include page="./included_goods_list.jsp"></jsp:include>
      
</body>
</html>