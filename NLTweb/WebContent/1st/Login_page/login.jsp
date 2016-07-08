<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>회원가입</title>
<script language=javascript>

function check() {
	if(document.login_form.login_ID.value.length==0) {
		alert("아이디 및 비밀번호 입력하시오");
                login_form.mem_id.focus();
                return false;
        }
	if(document.login_form.login_PW.value.length==0) {
                alert("아이디 및 비밀번호 입력하시오");
                login_form.mem_pwd.focus();
                return false;
        }
	document.login_form.submit();
}

</script>
</head>
<style>
#jb-container {
        width: 1040px;
        margin: 0px auto;
        padding: 20px;
        border: 5px solid #bcbcbc;
        background:#A6A6A6 url(head_img.jpg) no-repeat center top;
        align:"center"
      }
body {
    background-color: #b0c4de; 
    }
</style>


<div id="jb-container">

<body bgcolor="green" text="black" link="blue" vlink="purple" alink="red" topmargin="0">
      <p align="left"><br>
        <br><form name="login_form" method="post" action=login_act_bean.jsp>
      <center>
        <b> 회원 로그인</b> <BR>
       </center>
      <p> 
      <div align="center">  
        <table border="0" cellspacing="0" width="202" bgcolor="#082758">
         
            <tr> 
              <td width="964">
                <div align="left">
                  <table border="0" cellpadding="3" cellspacing="1" width="202" bgcolor="white">
       
                    <tr> 
                      <td width="66" bgcolor="#2E78ED">
                        <p align="center"><font size="2" color="white">아이디</font>
                      </td>
                      
                      
                      <td width="120"> 
                        <p><font size="2">
                          <input type="text" name="login_ID" maxlength="15" size="15">
                          </font>
                      </td>
                    </tr>
                    
                    
                    <tr> 
                      <td width="66" bgcolor="#2E78ED"> 
                        <p align="left"><font size="2" color="white">비밀번호</font>
                      </td>
                      <td width="120"> 
                        <p><font size="2">
                          <input type="password" name="login_PW" maxlength="15"  size="15">
                          </font>
                      </td>
                    </tr>
                  </table>
                  </table>
                  </div>
       
                   <p align="center">
                      
             <input type="checkbox" name="favorite" value="기업"  >기업용</input>
             <input type="button" name="login" value="로그인" onclick="check()">
             </form>           
               
      <p align="center">                  
    <a href="http://localhost:8080/NLTweb/1st/Login_page/makid.jsp">회원가입</a>

</body>
</div>
</html>