<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

 <div class="jumbotron">   
      <div class="container">
        <h1>제품 추가/수정</h1>
        <p>제품 이름을 작성하고 버튼을 누르면 해당 이름의 제품이 수정/추가 됩니다</p>
        
        <h2>-</h2>
	<table class="table table-bordered table-striped nanum">
	  <colgroup>
	    <col class="col-xs-1">
	    <col class="col-xs-7">
	  </colgroup>
	  <tbody>
	    <tr>
	      <td>제품이름</td>
	      <td><input type="text" name="goods_Frequency_low" class="form-control"></td>
	    </tr>
	    <tr>
	      <td>제조사</td>
	      <td><input type="text" name="goods_Frequency_low" class="form-control"></td>
	    </tr>
	    <tr>
	      <td>Frequency</td>
	      <td><input type="text" name="goods_Frequency_low" class="form-control"></td>
	    </tr>
	    <tr>
	      <td>DataRate </td>
	      <td><input type="text" name="goods_Frequency_low" class="form-control"></td>
	    </tr>
	    <tr>
	      <td>BW</td>
	      <td><input type="text" name="goods_Frequency_low" class="form-control"></td>
	    </tr>
	    <tr>
	      <td>RFmax</td>
	      <td><input type="text" name="goods_Frequency_low" class="form-control"></td>
	    </tr>
	    <tr>
	      <td>sensitivity</td>
	      <td><input type="text" name="goods_Frequency_low" class="form-control">@@<input type="text" name="goods_Frequency_low" class="form-control"></td>
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
	    </tr>
	  </tbody>
	</table>
        
        
        
        
        
        
        
        
        <p><a class="btn btn-primary btn-lg" href="http://bootstrapk.com/examples/jumbotron/#" role="button">Learn more »</a></p>
      </div>
    </div>

</body>
</html>