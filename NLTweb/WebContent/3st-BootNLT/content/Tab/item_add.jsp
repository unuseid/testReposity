<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script language=javascript>

function checkInput() {
	
	if(document.goods_info_input.goods_name.value.length==0) {
		alert("제품 이름을 입력하세요");
        goods_info_input.goods_name.focus();
        return false;
        }
	alert('return true');
	return true;
}

function popup_item(form){
	var tem = checkInput();
	var from1 = document.querySelector('#goods_info_input');
	if(tem){window.open("", "add_goods_POP", "width=600, height=400, scrollbars=yes");}
	else {from1.action=""; from1.target="";}
	return true;	
}

function search_goods_name(){
	var tem = checkInput();
	var tem2 = 1;
	aler(tem2);
	tem2 = document.querySelector('#goods_name');
	aler(tem2);
	if(tem){window.open("./content/popup/search_goods_bean.jsp?", "add_goods_POP", "width=600, height=400, scrollbars=yes");}
}
function search_goods_name2(){
	var bool = checkInput();
	if(bool){
		var from1 = document.querySelector('#goods_name');
		var temp1 = from1.value;
		window.open("./content/popup/search_goods_bean.jsp?id="+temp1, "add_goods_POP", "width=600, height=400, scrollbars=yes");
	}
}

</script> 


</head>
<body>

<div class="container-fluid" align="center">
	
</div>
   <div class="jumbotron">   
   <form action="./content/popup/add_goods_bean.jsp" name="goods_info_input" id="goods_info_input" method="post" target="add_goods_POP"  onsubmit="return popup_item(this)">

    <table class="table table-striped nanum" align="center">
    <colgroup>
	    <col class="col-xs-1">
	    <col class="col-xs-9">
	</colgroup>
	<tbody  align="center">
    <tr> 
      <td colspan="1"> 
        <div>제품 이름</div>
      </td>
      <td> 
        <input type="text" name="goods_name" id="goods_name" class="col-xs-8">
        <input type="button" name="confirm_id" value="이름 중복확인" class="col-xs-4" onClick="search_goods_name2()"><!-- 제품내용 추가하기전에 이름확인하면 동일이름 제품 있을 시 스펙 불러와서 팝업으로 띄워주는 기능 업데이트 ㅇ/ㅖ정 -->
      </td>
    </tr>
    <tr> 
      <td> 
        <div>제조사</div>
      </td>
      <td> 
        <input type="text" name="goods_mark" class="col-xs-12">
      </td>
    </tr>
    
   
      
    <tr> 
      <td> 
        <div>Frequency</div>
      </td>
      <td> 
        <input type="text"  class="col-xs-4" name="goods_Frequency_low">
        <b class="col-xs-4">~</b>
        <input type="text"  class="col-xs-4" name="goods_Frequency_high">
    </tr>
    
    
    <tr> 
      <td> 
        <div>DataRate</div>
      </td>
      <td> 
        <input type="text"  class="col-xs-4" name="goods_DataRate_low" >
        <b class="col-xs-4">~</b>
        <input type="text"  class="col-xs-4" name="goods_DataRate_high">
      </td>
    </tr>
    <tr>
    <td> 
        <div>BW</div>
      </td>
    <td> 
       <input type="text" class="col-xs-4" name="goods_BW_low">
       <b class="col-xs-4">~</b>
       <input type="text" class="col-xs-4" name="goods_BW_high">
      </td>
    </tr>
    <tr>
    <td> 
        <div align="center">Sensitivity</div>
    </td>
    <td> 
       <input type="text" class="col-xs-4" name="goods_Sensitivity_num" > 
       <b class="col-xs-4">@</b>
       <input type="text" class="col-xs-4" name="goods_Sensitivity_k">
    </td>
    </tr>
     <tr> 
      <td> 
        <div align="center">RFmax</div>
      </td>
      <td> 
        <input type="text" class="col-xs-12" name="goods_RFmax">
      </td>
    </tr>
    <tr>
    <td> 
        <div>Mod</div>
    </td>
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
       <input class="btn btn-primary btn-lg" type=submit value="등록/수정">
  </form>

    </div>

</body>
</html>