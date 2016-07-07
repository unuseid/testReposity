<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
<%request.setCharacterEncoding("euc-kr");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>1st NLTweb</title>
</head>
<body>
<div id="jb-container">
 	<div id="jb-header">
 	<!-- <h1><p id="머리">NLssTwebdd DEMO!</p></h1>  -->
 		<jsp:include page="./Head/head.jsp"></jsp:include>
 	</div>
 	
 	<div id="jb-content">
 		<jsp:include page="./Content/content.jsp"></jsp:include>
 	</div>
 	
 	<div id="jb-sidebar">
 		<jsp:include page="./Sidebar/sidebar.jsp"></jsp:include>
 	</div>
 
 	<div id="jb-footer">
 		<jsp:include page="./Foot/foot.jsp"></jsp:include>
 	</div>
 	
  
</div>

</body>
</html>