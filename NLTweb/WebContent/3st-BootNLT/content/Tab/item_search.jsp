<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script>
$(document).ready(function(){
	$("#ajaxbutton").click(function(){
		var postdata = $("#fillter").serialize();
		$("#item_table_div").load("./content/item_table.jsp",postdata);
	})

})
</script>


</head>
<body>

<form name ="fillter" id="fillter" method = post>
 <div class="jumbotron">   
      <div class="container">
        <h2>제품 검색</h2>
        <p>
          다양한 조건을 만족시키는 제품을 검색 할 수 있습니다.
        <br>
         원하시는 조건을 작성하세요 체크박스에 체크하면 입력값 이상 하지않으면 이하로 검색 합니다.
        <br>
         조건을 입력치 않고 검색하면 모든 제품 정보를 불러 옵니다        
        </p>

	<table class="table table-bordered table-striped nanum">
	  <colgroup>
	    <col class="col-xs-1">
	    <col class="col-xs-7">
	    <col class="col-xs-1">
	  </colgroup>
	  <thead align="center">
	  <td>조건</td><td>수치</td><td>이상/이하</td>
	  </thead>
	  <tbody align="center">
	    <tr>
	      <td>제품이름</td>
	      <td><input type="text" name="name_text"  class="form-control">
	      <td></td>
	    </tr>
	    <tr>
	      <td>제조사</td>
	      <td><input type="text" name="mark_text" class="form-control"></td>
	      <td></td>
	    </tr>
	    <tr>
	      <td>Frequency low</td>
	      <td><input type="text" name="Frequency_low_text" class="form-control"></td> 
	      <td><input type = checkbox name= "Frequency_low_checkbox" value="Frequency_low_checkbox"></input>  </td>
	    </tr>
	     <tr>
	      <td>Frequency high</td>
	      <td><input type="text" name="Frequency_high_text" class="form-control"></td> 
	      <td><input type = checkbox name= "Frequency_high_checkbox" value="Frequency_high_checkbox"></input>  </td>
	    </tr>
	    <tr>
	      <td>DataRate low</td>
	      <td><input type="text" name="DataRate_low_text" class="form-control"></td>
	      <td><input type = checkbox name= "DataRate_low_checkbox" value="DataRate_low_checkbox"></input>  </td>
	    </tr>
	     <tr>
	      <td>DataRate high</td>
	      <td><input type="text" name="DataRate_high_text" class="form-control"></td> 
	      <td><input type = checkbox name= "DataRate_high_checkbox" value="DataRate_high_checkbox"></input>  </td>
	    </tr>
	    <tr>
	      <td>BW low</td>
	      <td><input type="text" name="BW_low_text" class="form-control"></td>
	      <td><input type = checkbox name= "BW_low_checkbox" value="BW_low_checkbox"></input>  </td>
	    </tr>
	     <tr>
	      <td>BW high</td>
	      <td><input type="text" name="BW_high_text" class="form-control"></td>
	      <td><input type = checkbox name= "BW_high_checkbox" value="BW_high_checkbox"></input>  </td>
	    </tr>
	    <tr>
	      <td>RFmax</td>
	      <td><input type="text" name="RFmax_text" class="form-control"></td>
	      <td><input type = checkbox name= "RFmax_checkbox" value="RFmax_checkbox"></input>  </td>
	    </tr>
	    <tr>
	      <td>sensitivity</td>
	      <td><input type="text" name="Sensitivity_num_text" class="form-control"></td>
	      <td><input type = checkbox name= "Sensitivity_num_checkbox" value="Sensitivity_num_checkbox"></input>  </td>
	    </tr>
	    <tr>
	      <td>sensitivity K</td>
	      <td><input type="text" name="Sensitivity_k_text" class="form-control"></td>
	      <td><input type = checkbox name= "Sensitivity_k_checkbox" value="Sensitivity_k_checkbox"></input>  </td>
	    </tr>
	    <tr>
	      <td>Mod</td>
	      <td>
			<input type = checkbox name= "goods_Mod_3FSK" value="goods_Mod_3FSK">3FSK</input>
  		  	<input type = checkbox name= "goods_Mod_4FSK" value="goods_Mod_4FSK">4FSK</input>
  		  	<input type = checkbox name= "goods_Mod_FSK" value="goods_Mod_FSK">FSK</input>
  			<input type = checkbox name= "goods_Mod_GFSK" value="goods_Mod_GFSK">GFSK</input> 
 		    <input type = checkbox name= "goods_Mod_MSK" value="goods_Mod_MSK">MSK</input>
 		    <input type = checkbox name= "goods_Mod_GMSK" value="goods_Mod_GMSK">GMSK</input>
 		    <input type = checkbox name= "goods_Mod_OOK" value="goods_Mod_OOK">OOK</input>    
		  </td>
		  <td></td>
	    </tr>
	  </tbody>
	</table>
      </div>
      <p><a class="btn btn-primary btn-lg" role="button" id="ajaxbutton">필터 적용</a></p>
      
    </div>
    </form>

</body>
</html>