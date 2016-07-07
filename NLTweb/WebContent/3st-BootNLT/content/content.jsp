<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-inverse">
<div class="container">
<div class="navbar-header">
 <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">제품 등록/수정</a></li>
    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">스펙필터</a></li>
    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">여유1</a></li>
    <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">여유2</a></li>
  </ul>
</div>
  <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right">
            <div class="form-group">
              <input type="text" placeholder="ID" class="form-control">
            </div>
            <div class="form-group">
              <input type="password" placeholder="Password" class="form-control">
            </div>
            <button type="submit" class="btn btn-success">Sign in</button>
          </form>
        </div><!--/.navbar-collapse -->
  
</div>
</nav>
<div class="tab-content" align="center">    <!-- 탭 컨텐츠! -->
	<div role="tabpanel" class="tab-pane fade in active" id="home">
		<jsp:include page="./Tab/item_add.jsp"></jsp:include>
	</div>
	 <div role="tabpanel" class="tab-pane fade" id="profile" align="center">	
		<jsp:include page="./Tab/item_search.jsp"></jsp:include>
	</div>
	<div role="tabpanel" class="tab-pane fade" id="messages">
		<p>Section3!</p>
	</div>
	<div role="tabpanel" class="tab-pane fade" id="settings">
		<jsp:include page="./testincluded.jsp"></jsp:include> <!-- 주석처리해서 없애려면 graph,js도 불러오지 말아야함, 변수를 찾지못한 자바스크립트가 멈추고 search의 스크립트 까지 동작이 함께 멈춤 -->
		<!-- <jsp:include page="./included_Admin_goods_Add.jsp" ></jsp:include> -->
	</div>
</div>
	
<div id="item_table_div"></div>
</body>
</html>