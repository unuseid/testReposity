<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./public/css/styles.css">
<link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap-theme.min.css" media="screen" />
<link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.min.css" media="screen" />
<script src="./bootstrap/js/bootstrap.min.css"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://d3js.org/d3.v2.js"></script>


<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">

<script src="./graph.js"></script>


</head>
<body>
<!-- 상단 네비게이션 바 -->
<div class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <!-- 브라우저가 좁아졋을때 나오는 버튼(클릭시 메뉴출력) -->
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">부트스트랩 테스트SSS EE ㅇ</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">홈으로</a></li>
            <li><a href="#about">부트스트랩이란</a></li>
            <li><a href="#contact">문의하기</a></li>
          </ul>
        </div>
      </div>
</div>
<div class="container">
      <div style="margin-top: 100px;">
        <h1>부트스트랩 기본 템플릿입니다</h1>
        <p class="lead">여러분은 부트스트랩을 이용하여 다양한 기능을 구현할수 있습니다.</p>
      </div>
      <div class="control-btn-group">
        <button type="button" id="ac_on_btn" class="btn btn-primary">On</button>
        <button type="button" id="test_btn" class="btn btn-default">Off</button>
      </div>
<div class="col-lg-6">
      <h2 class="page-header">Sensor Graph (1 sec)</h2>
      <div class="row">
        <div id="graph" class="graph"></div>
      </div>
    </div>
     <div class="col-lg-6">
      <h1 class="page-header"> 실시간 전류(암페어) 모니터링 </h1>
      <div class="row">
        <div class="col-sm-2"> 전류값 </div>
        <div class="col-sm-1" id="temp_value">0</div>
        <div class="col-sm-2"> mA</div>
      </div>
      <div class="row">
        <div class="col-sm-2"> 측정 시간 </div>
        <div class="col-sm-4" id="temp_time">... </div>
      </div>
      </div>
      
      <div class="col-lg-6" id="graph_pane"></div>
      

</div>
</body>
</html>