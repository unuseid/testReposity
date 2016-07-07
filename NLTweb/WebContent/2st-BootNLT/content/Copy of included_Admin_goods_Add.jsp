<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("euc-kr");%>



<jsp:useBean id="goods_info_DB" class="DB.goods_info_DB" scope="page"/>
<script language=javascript>
function checkInput() {
	if(document.goods_info_input.goods_name.value.length==0) {
		alert("제품 이름을 입력하세요");
        goods_info_input.goods_name.focus();
        return false;
        }
}

function checkInput_img() {
	if(document.goods_img_info_input.goods_name.value.length==0) {
		alert("제품 이름을 입력하세요");
        login_form.mem_id.focus();
        return false;
        }
	if(document.goods_img_info_input.goods_img.value.length==0) {
                alert("가격을 입력해주세요");
                login_form.mem_pwd.focus();
                return false;
        }
}
function popsubmit(){
	checkInput();
	window.open("", "add_goods_POP", "width=600, height=400, scrollbars=yes");
	document.goods_info_input.action = "./Content/add_goods_bean.jsp";
	document.goods_info_input.target = "add_goods_POP";
	document.goods_info_input.method = "post";
	document.goods_info_input.submit();
}

function popsubmit_img(){
	window.open("", "add_goods_img_POP", "width=600, height=400, scrollbars=yes");
	document.goods_img_info_input.action = "add_goods_img_bean.jsp";
	document.goods_img_info_input.target = "add_goods_img_POP";
	document.goods_img_info_input.method = "post";
	document.goods_img_info_input.submit();
}


</script>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<form action="testproc.jsp" name="goods_info_input" method="post" >
<%goods_info_DB.connect(); %>
	<table width="600" border="0" cellspacing="0" cellpadding="5" align="center">
  <tr bgcolor="#3399CC"> 
    <td height="39" class="normalbold" align="center"><font size="+1" color="#FFFFFF"> 제품정보 추가</font></td>
  </tr>
  <tr>
    <td class="normal"> </td>
  </tr>
</table>
<form method="post" action="add_member.jsp" name="userinput">
  <table width="600" border="1" cellspacing="0" cellpadding="3" bordercolor="#FFFFFF" align="center">
    <tr> 
      <td bgcolor="#FFCCCC" class="normalbold" width="179"> 
        <div align="center">제품 이름</div>
      </td>
      <td colspan="3" class="normal"bgcolor="#FFFFFF"> 
        <input type="text" name="goods_name" size="50">
        <input type="button" name="confirm_id" value="이름 중복확인" onClick="searchID()">
      </td>
    </tr>
    <tr> 
      <td bgcolor="#FFCCCC" class="normalbold" width="179" height="23"> 
        <div align="center">제조사</div>
      </td>
      <td colspan="3" height="23" class="normal"bgcolor="#FFFFFF" > 
        <input type="text" name="goods_mark">
      </td>
    </tr>
    
   
      
    <tr> 
      <td bgcolor="#FFCCCC" class="normalbold" width="179"> 
        <div align="center">Frequency</div>
      </td>
      <td colspan="3" class="normal"bgcolor="#FFFFFF"> 
        <input type="text" name="goods_Frequency_low">
        ~
        <input type="text" name="goods_Frequency_high">
    </tr>
    
    
    <tr> 
      <td bgcolor="#FFCCCC" class="normalbold" width="179"> 
        <div align="center">DataRate</div>
      </td>
      <td colspan="3" class="normal"bgcolor="#FFFFFF"> 
        <input type="text" name="goods_DataRate_low">
        ~
        <input type="text" name="goods_DataRate_high">
      </td>
    </tr>
    <tr>
    <td bgcolor="#FFCCCC" class="normalbold" width="179"> 
        <div align="center">BW</div>
      </td>
    <td colspan="3" class="normal" bgcolor="#FFFFFF"> 
       <input type="text" name="goods_BW_low">
        ~
        <input type="text" name="goods_BW_high">
      </td>
    </tr>
    <tr>
    <td bgcolor="#FFCCCC" class="normalbold" width="179"> 
        <div align="center">Sensitivity</div>
    </td>
    <td colspan="1" class="normal" bgcolor="#FFFFFF"> 
       <input type="text" name="goods_Sensitivity_num">
    </td>
    <td bgcolor="#FFCCCC" class="normalbold" width="179"> 
        <div align="center">Sensitivity K</div>
    </td>
    <td colspan="1" class="normal" bgcolor="#FFFFFF"> 
       <input type="text" name="goods_Sensitivity_k">
    </td>
    </tr>
     <tr> 
      <td bgcolor="#FFCCCC" class="normalbold" width="179" height="23"> 
        <div align="center">RFmax</div>
      </td>
      <td colspan="3" height="23" class="normal"bgcolor="#FFFFFF" > 
        <input type="text" name="goods_RFmax">
      </td>
    </tr>
    <tr>
    <td bgcolor="#FFCCCC" class="normalbold" width="179" height="23"> 
        <div align="center">Mod</div>
    </td>
    <td colspan="3" height="23" class="normal"bgcolor="#FFFFFF" > 
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
      <td colspan="4" class="normal" bgcolor="#FFFFFF"> 
        <div align="center"> 
          <input type="button" name="confirm" value="신 규 등 록 / 수 정" onClick="popsubmit()">
          <input type="reset" name="reset" value="취  소">
        </div>
      </td>
    </tr>
    
  </table>
</form>
</form>

<form action="testproc.jsp" name="goods_img_info_input" method="post" enctype="multipart/form-data">
	<table width="600" border="1" cellspacing="0" cellpadding="3" bordercolor="#000000" align="center">
	<tr> 
      <td bgcolor="#FFCCCC" class="normalbold" width="179"> 
        <div align="center">상품 이미지(아직)</div>
      </td>
      <td colspan="3" class="normal" bgcolor="#FFFFFF"> 
        <input type="file" name="goods_img" size=40>
      </td>
    </tr>
   
    <tr>
      <td colspan="4" class="normal" bgcolor="#FFFFFF">
      <div align="center"> 
      <input type="button" name="confirm" value="이미지 등록" onClick="popsubmit_img()">
      </div>
      </td>
    </tr>
    </table>
    </form>
</html>
<%goods_info_DB.disconnect(); %>