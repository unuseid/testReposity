<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("euc-kr");%>
<jsp:useBean id="goods_info_DB" class="DB.goods_info_DB" scope="page"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<jsp:setProperty  name="goods_info_DB" property="goods_name"/>
<%
//String user_location = request.getParameter("user_location");
goods_info_DB.setGoods_Frequency_low(request.getParameter("goods_Frequency_low"));
goods_info_DB.setGoods_Frequency_high(request.getParameter("goods_Frequency_high"));
goods_info_DB.setGoods_BW_low(request.getParameter("goods_BW_low"));
goods_info_DB.setGoods_BW_high(request.getParameter("goods_BW_high"));
goods_info_DB.setGoods_DataRate_high(request.getParameter("goods_DataRate_high"));
goods_info_DB.setGoods_DataRate_low(request.getParameter("goods_DataRate_low"));
goods_info_DB.setGoods_RFmax(request.getParameter("goods_RFmax"));
goods_info_DB.setGoods_Sensitivity_num(request.getParameter("goods_Sensitivity_num"));
goods_info_DB.setGoods_Sensitivity_k(request.getParameter("goods_Sensitivity_k"));
goods_info_DB.setGoods_mark(request.getParameter("goods_mark"));
goods_info_DB.setGoods_Mod_3FSK(request.getParameter("goods_Mod_3FSK"));
goods_info_DB.setGoods_Mod_4FSK(request.getParameter("goods_Mod_4FSK"));
goods_info_DB.setGoods_Mod_FSK(request.getParameter("goods_Mod_FSK"));
goods_info_DB.setGoods_Mod_GFSK(request.getParameter("goods_Mod_GFSK"));
goods_info_DB.setGoods_Mod_MSK(request.getParameter("goods_Mod_MSK"));
goods_info_DB.setGoods_Mod_GMSK(request.getParameter("goods_Mod_GMSK"));
goods_info_DB.setGoods_Mod_OOK(request.getParameter("goods_Mod_OOK"));




System.out.println(request.getParameter("goods_name"));

goods_info_DB.connect();

boolean result = goods_info_DB.add_goods();

goods_info_DB.disconnect();
%>


<% if(result==true){%><jsp:include page="./add_goods_result/Congratulation.jsp"/><%}%>
<% if(result==false){%><jsp:include page="./add_goods_result/Failure.jsp"/><%}%>


<body>

</body>
</html>