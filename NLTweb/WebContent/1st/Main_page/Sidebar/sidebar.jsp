<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" type="text/css" href="style.css" media="screen" />    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<h1><p id="사이드">sideBar!</p></h1>
<form name = fillter method = post action=http://localhost:8080/NLTweb/1st/Main_page/MainPage.jsp>
       <h3>스펙 필터</h3>
        <ul>
          <li>
          Frequency_low<br>         
          <input type="text" name="Frequency_low_text" maxlength="15"size="5"><input type = checkbox name= Frequency_low_checkbox value="Frequency_low_checkbox">이상/이하</input>                   
          </li>
          
          <li>
          Frequency_high<br>         
          <input type="text" name="Frequency_high_text" maxlength="15"size="5"><input type = checkbox name= Frequency_high_checkbox value="Frequency_high_checkbox">이상/이하</input>                   
          </li>
          
          <li>
          DataRate_low<br>         
          <input type="text" name="DataRate_low_text" maxlength="15"size="5"><input type = checkbox name= DataRate_low_checkbox value="DataRate_low_checkbox">이상/이하</input>                   
          </li>
          
          <li>
          DataRate_high<br>         
          <input type="text" name="DataRate_high_text" maxlength="15"size="5"><input type = checkbox name= DataRate_high_checkbox value="DataRate_high_checkbox">이상/이하</input>                   
          </li>
          
          <li>
          BW_low<br>         
          <input type="text" name="BW_low_text" maxlength="15"size="5"><input type = checkbox name= BW_low_checkbox value="BW_low_checkbox">이상/이하</input>                   
          </li>
          
          <li>
          BW_high<br>         
          <input type="text" name="BW_high_text" maxlength="15"size="5"><input type = checkbox name= BW_high_checkbox value="BW_high_checkbox">이상/이하</input>                   
          </li>
          
          <li>
          RFmax<br>         
          <input type="text" name="RFmax_text" maxlength="15"size="5"><input type = checkbox name= RFmax_checkbox value="RFmax_checkbox">이상/이하</input>                   
          </li>
          
          <li>
          Sensitivity_num<br>         
          <input type="text" name="Sensitivity_num_text" maxlength="15"size="5"><input type = checkbox name= Sensitivity_num_checkbox value="Sensitivity_num_checkbox">이상/이하</input>                   
          </li>
          
          <li>
          Sensitivity_k<br>         
          <input type="text" name="Sensitivity_k_text" maxlength="15"size="5"><input type = checkbox name= Sensitivity_k_checkbox value="Sensitivity_k_checkbox">이상/이하</input>                   
          </li>
          
          <li>
           제조사<br>         
          <input type="text" name="mark_text" maxlength="15"size="15">                 
          </li>
          
        </ul>
        
        <h3>able Mod</h3>
        <ul>
          <li><input type = checkbox name= mod_3FSK_checkbox value="filter_food">3FSK</input></li>          
          <li><input type = checkbox name= mod_4FSK_checkbox value="filter_food">4FSK</input></li>          
          <li><input type = checkbox name= mod_FSK_checkbox value="filter_food">FSK</input></li>          
          <li><input type = checkbox name= mod_GFSK_checkbox value="filter_food">GFSK</input></li>          
          <li><input type = checkbox name= mod_MSK_checkbox value="filter_food">MSK</input></li>          
          <li><input type = checkbox name= mod_GMSK_checkbox value="filter_food">GMSK</input></li>          
          <li><input type = checkbox name= mod_OOK_checkbox value="filter_food">OOK</input></li>
          
          
        </ul>
        
        <table  border="0" cellspacing="0" width="180">
        
        <H2>제품명<br></H2>
        <input type="text" name="filter_name" maxlength="15"size="20">
                         
        <td align="right"><input type=submit value="필터적용">
       </td>
        </table>
        <% // 관리자 admin만 볼수 있는 페이지
        
       // isAdmin ="0".equals(adminnum);
        //if(isAdmin){ %> <h2>최고 관리자 모드 입니다!</h2> <%//} %>
        
      </form>
</body>
</html>