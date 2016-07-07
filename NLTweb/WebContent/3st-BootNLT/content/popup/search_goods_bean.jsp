<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="goods_info_DB" class="DB.goods_info_DB" scope="page"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
일단 들어왔음
<%
String str = request.getParameter("id");
System.out.println(str);
goods_info_DB.connect();
goods_info_DB.setGoods_name(str);

if(goods_info_DB.goods_name_search(str)==true){
	do{ %><h1>동일 이름 제품이 존재 합니다! :<%=goods_info_DB.next_goods_name()%></h1><%
	}while(goods_info_DB.is_info_exist());
}
else {%><h1>동일 이름 제품이 없습니다!</h1><%}

goods_info_DB.disconnect(); %>

</body>
</html>