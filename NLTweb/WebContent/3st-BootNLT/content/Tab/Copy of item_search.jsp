<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script>
$(document).ready(function(){
	$("#ajaxbutton").click(function(){
		$("#item_table_div").load("./content/item_table.jsp");
	})
	
	$("#ajaxbutton2").click(function(){
		$.ajax({
	        type: 'post',
	        url: './content/item_table.jsp',
	        success: function(data){
	            alert(data);
	        }
	   });
	    return false; //<- 이 문장으로 새로고침(reload)이 방지됨
	})
	
})
</script>


</head>
<body>

<form name ="fillter" id="fillter" method = post action=http://localhost:8080/NLTweb/3st-BootNLT/MainPage.jsp>
 <div class="jumbotron">   
      <div class="container">
        <h2>제품 검색</h2>
        <p>다양한 조건을 만족시키는 제품을 검색 할 수 있습니다.</p>

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
	      <td><input type="text" name="goods_Frequency_low"  class="form-control">
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
      <input type=submit value="필터적용">
      <p><a class="btn btn-primary btn-lg" role="button" id="ajaxbutton2">새로고침없이 필터적용</a></p>
      <p><a class="btn btn-primary btn-lg" role="button" id="ajaxbutton">test</a></p>
      
    </div>
    </form>

</body>
</html>