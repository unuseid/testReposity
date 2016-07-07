<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>

	<div class="jumbotron">
	<form method="post" action="add_member.jsp" name="userinput">
		<table class="table table-striped nanum" align="center">
   			 <colgroup>
	          <col class="col-xs-1">
	  		  <col class="col-xs-7">
			 </colgroup>
		<tbody align="center">
   	 	<tr> 
      	<td colspan="1"> 
        <div>제품 이름</div>
      	</td>
      	<td colspan="3"> 
        <input type="text" name="goods_name" size="10">
        <input type="button" name="confirm_id" value="이름 중복확인" onClick="searchID()">
      	</td>
    	</tr>
    	<tr align="center"> 
      	<td colspan="1"> 
        <div>제조사</div>
      	</td>
      	<td colspan="3"> 
        <input type="text" name="goods_mark">
      	</td>
    	</tr>
    
   
      
    	<tr align="center"> 
      	<td colspan="1"> 
        <div align="center">Frequency</div>
     	</td>
      	<td colspan="3"> 
        <input type="text" size="10" name="goods_Frequency_low">
        ~
        <input type="text" size="10" name="goods_Frequency_high">
    	</tr>
    
    
    	<tr> 
      	<td colspan="1"> 
        <div align="center">DataRate</div>
      	</td>
      	<td colspan="3"> 
        <input type="text" size="10" name="goods_DataRate_low">
        ~
        <input type="text" size="10" name="goods_DataRate_high">
      	</td>
    	</tr>
    	<tr>
    	<td colspan="1"> 
        <div align="center">BW</div>
      	</td>
    	<td colspan="3"> 
        <input type="text" size="10" name="goods_BW_low">
        ~
        <input type="text" size="10" name="goods_BW_high">
      	</td>
    	</tr>
    	<tr>
    	<td colspan="1"> 
        <div align="center">Sensitivity</div>
    	</td>
    	<td colspan="1"> 
        <input type="text" size="10" name="goods_Sensitivity_num" >
    	</td>
    	<td colspan="1"> 
        <div align="center">Sensitivity K</div>
    	</td>
    	<td colspan="1"> 
        <input type="text" size="10" name="goods_Sensitivity_k">
    	</td>
    	</tr>
    	<tr> 
    	<td colspan="1"> 
        <div align="center">RFmax</div>
    	</td>
      	<td colspan="3"> 
        <input type="text" size="10" name="goods_RFmax">
      	</td>
    	</tr>
    	<tr>
    	<td colspan="1"> 
        <div align="center">Mod</div>
    	</td>
    	<td colspan="3"> 
    	<input type = checkbox name= "goods_Mod_3FSK" value="goods_Mod_3FSK">3FSK</input>
    	<input type = checkbox name= "goods_Mod_4FSK" value="goods_Mod_4FSK">4FSK</input>
    	<input type = checkbox name= "goods_Mod_FSK" value="goods_Mod_FSK">FSK</input>
    	<input type = checkbox name= "goods_Mod_GFSK" value="goods_Mod_GFSK">GFSK</input>
    	<input type = checkbox name= "goods_Mod_MSK" value="goods_Mod_MSK">MSK</input>
    	<input type = checkbox name= "goods_Mod_GMSK" value="goods_Mod_GMSK">GMSK</input>
    	<input type = checkbox name= "goods_Mod_OOK" value="goods_Mod_OOK">OOK</input>    
    	</td>
    	</tr>
    	<tr> 
    	<td colspan="4"> 
        <div align="center"> 
          <input type="button" name="confirm" value="신 규 등 록 / 수 정" onClick="popsubmit()">
          <input type="reset" name="reset" value="취  소">
        </div>
      	</td>
    	</tr>
    	</tbody>
	  	</table>
	  	</form>
	</div>

</body>
</html>