<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>makeid.jsp</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
<!--
.normal {  font-family: "굴림", "돋움"; font-size: x-small; font-style: normal; font-weight: normal; text-decoration: none}
.normalbold {  font-family: "굴림", "돋움"; font-size: x-small; font-style: normal; font-weight: bold; text-decoration: none}
-->

#jb-container {
        width: 1040px;
        margin: 0px auto;
        padding: 20px;
        border: 5px solid #bcbcbc;
        background:#A6A6A6 url(head_img.jpg) no-repeat center top;
      }
</style>

</head>

<script language="JavaScript">
    function checkUserInput() {
        if(document.userinput.login_ID.value == "") {
            alert("ID를 입력하세요");
            return;
        }

        if(document.userinput.login_PW.value == "") {
            alert("비밀번호를 입력하세요");
            return;
        }
        else if(document.userinput.login_PW.value != document.userinput.login_PW2.value)
        {
            alert("비밀번호를 동일하게 입력하세요");
            return;
        }

        if(document.userinput.user_name.value == "") {
            alert("사용자 이름을 입력하세요");
            return;
        }
        return;
    }
    
    
    function openit(){
    	checkUserInput()
    	window.open("", "add_member_POP", "width=700, height=700, scrollbars=yes");
        document.userinput.action = "add_member_bean.jsp";
        document.userinput.target = "add_member_POP";
        document.userinput.method = "post";
        document.userinput.submit();
    	
    }
    
    
    function openConfirmid() {
        if (document.userinput.login_ID.value == "") {
            alert("아이디를 입력하세요");
            return;
        }
        url = "confirmid.jsp?login_ID=" + 
            document.userinput.login_ID.value ;
        
        open(url, "confirm", "toolbar=no, location=no, \
             status=no, menubar=no, scrollbars=no, \
             resizable=no, width=300, height=200");
    }
    
    function searchID(){
    window.open("", "POP", "width=600, height=400, scrollbars=yes");
    document.userinput.action = "searchID.jsp";
    document.userinput.target = "POP";
    document.userinput.method = "post";
    document.userinput.submit();
    }
    //openConfirmid(document.userinput.id.value)
</script>

<body bgcolor="#FFFFFF">
<div id="jb-container">
<center>
<table width="600" border="0" cellspacing="0" cellpadding="5">
  <tr bgcolor="#3399CC"> 
    <td height="39" class="normalbold"><font size="+1" color="#FFFFFF">회 원 가 입</font></td>
  </tr>
  <tr>
    <td class="normal"> </td>
  </tr>
</table>
<form method="post" action="add_member.jsp" name="userinput">
  <table width="600" border="1" cellspacing="0" cellpadding="3" bordercolor="#000000">
    <tr> 
      <td bgcolor="#FFCCCC" class="normalbold" width="179"> 
        <div align="center">회원 아이디</div>
      </td>
      <td colspan="3" class="normal"  bgcolor="#FFFFFF"> 
        <input type="text" name="login_ID" size="50">
        <input type="button" name="confirm_id" value="ID중복확인" onClick="searchID()">
      </td>
    </tr>
    <tr> 
      <td bgcolor="#FFCCCC" class="normalbold" width="179"> 
        <div align="center">비밀번호</div>
      </td>
      <td width="154" class="normal" bgcolor="#FFFFFF"> 
        <input type="password" name="login_PW">
      </td>
      <td width="141" class="normalbold" bgcolor="#FFCCCC"> 
        <div align="center">비밀번호 확인</div>
      </td>
      <td width="160" bgcolor="#FFFFFF"> 
        <input type="password" name="login_PW2">
      </td>
    </tr>
    <tr> 
      <td bgcolor="#FFCCCC" class="normalbold" width="179" height="23"> 
        <div align="center">성 명</div>
      </td>
      <td colspan="3" height="23" class="normal" bgcolor="#FFFFFF"> 
        <input type="text" name="user_name">
      </td>
    </tr>
    
    <tr>
     
     <td bgcolor="#FFCCCC" class="normalbold" width="179" height="23">
      <div align="center">성별</div>
     </td>
     <td colspan="3" height="23" class="normal"  bgcolor="#FFFFFF">
     <input type="radio" value="man" name="user_sex" checked="checked"/> 남자
     <input type="radio" value="woman" name="user_sex" /> 여자 
     </td>
     </tr>
      
    <tr> 
      <td bgcolor="#FFCCCC" class="normalbold" width="179"> 
        <div align="center">나이(선택)</div>
      </td>
      <td colspan="3" class="normal" bgcolor="#FFFFFF"> 
        <input type="text" name="user_age">
    </tr>
    
    <tr> 
      <td bgcolor="#FFCCCC" class="normalbold" width="179" bgcolor="#FFFFFF"> 
        <div align="center">E-Mail(선택)</div>
      </td>
      <td colspan="3" class="normal" bgcolor="#FFFFFF"> 
        <input type="text" name="user_email">
      </td>
    </tr>
    <tr> 
      <td bgcolor="#FFCCCC" class="normalbold" width="179"> 
        <div align="center">위치 선택</div>
      </td>
      <td colspan="3" class="normal" bgcolor="#FFFFFF"> 
        <select name="user_location">
          <option value="서울">서울</option>
          <option value="세종">세종</option>
          <option value="인천">인천</option>
          <option value="광주">광주</option>
          <option value="부산">부산</option>
          <option value="울산">울산</option>
          <option value="대구">대구</option>
          <option value="기타">기타</option>
        </select>
      </td>
    </tr>
    <tr> 
      <td colspan="4" class="normal" bgcolor="#FFFFFF"> 
        <div align="center"> 
          <input type="button" name="confirm" value="가 입" onClick="openit()">
          <input type="reset" name="reset" value="취   소">
        </div>
      </td>
    </tr>
  </table>
</form>
</center>
</body>
</html>
</div>
</html>