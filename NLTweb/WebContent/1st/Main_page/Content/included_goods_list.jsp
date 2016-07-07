<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("euc-kr");%>
<jsp:useBean id="goods_info_DB" class="DB.goods_info_DB" scope="page"/>
<head>
<style>
#중앙정렬{text-align:center;}

</style>

</head>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<%
		goods_info_DB.connect();
		
		
		

goods_info_DB.setGoods_Frequency_low(request.getParameter("Frequency_low_text"));
goods_info_DB.setGoods_Frequency_high(request.getParameter("Frequency_high_text"));
goods_info_DB.setGoods_BW_low(request.getParameter("BW_low_text"));
goods_info_DB.setGoods_BW_high(request.getParameter("BW_high_text"));
goods_info_DB.setGoods_DataRate_high(request.getParameter("DataRate_low_text"));
goods_info_DB.setGoods_DataRate_low(request.getParameter("DataRate_high_text"));
goods_info_DB.setGoods_RFmax(request.getParameter("RFmax_text"));
goods_info_DB.setGoods_Sensitivity_num(request.getParameter("Sensitivity_num_text"));
goods_info_DB.setGoods_Sensitivity_k(request.getParameter("Sensitivity_k_text"));
goods_info_DB.setGoods_mark(request.getParameter("mark_text"));



goods_info_DB.setGoods_Mod_3FSK(request.getParameter("mod_3FSK_checkbox"));
goods_info_DB.setGoods_Mod_4FSK(request.getParameter("mod_4FSK_checkbox"));
goods_info_DB.setGoods_Mod_FSK(request.getParameter("mod_FSK_checkbox"));
goods_info_DB.setGoods_Mod_GFSK(request.getParameter("goods_Mod_GFSK"));
goods_info_DB.setGoods_Mod_MSK(request.getParameter("mod_MSK_checkbox"));
goods_info_DB.setGoods_Mod_GMSK(request.getParameter("mod_GMSK_checkbox"));
goods_info_DB.setGoods_Mod_OOK(request.getParameter("mod_OOK_checkbox"));

boolean temp;
System.out.println(request.getParameter("Frequency_low_checkbox")+"체크박스 들어간다");
temp=goods_info_DB.isnullString(request.getParameter("Frequency_low_checkbox"));
System.out.println(temp+"bool변환");
goods_info_DB.setFrequency_low_checkbox(temp);


temp=goods_info_DB.isnullString(request.getParameter("Frequency_high_checkbox"));
goods_info_DB.setFrequency_high_checkbox(temp);

temp=goods_info_DB.isnullString(request.getParameter("DataRate_low_checkbox"));
goods_info_DB.setDataRate_low_checkbox(temp);

temp=goods_info_DB.isnullString(request.getParameter("DataRate_high_checkbox"));
goods_info_DB.setDataRate_high_checkbox(temp);

temp=goods_info_DB.isnullString(request.getParameter("BW_low_checkbox"));
goods_info_DB.setBW_low_checkbox(temp);

temp=goods_info_DB.isnullString(request.getParameter("BW_high_checkbox"));
goods_info_DB.setBW_high_checkbox(temp);

temp=goods_info_DB.isnullString(request.getParameter("RFmax_checkbox"));
goods_info_DB.setRFmax_checkbox(temp);

temp=goods_info_DB.isnullString(request.getParameter("Sensitivity_num_checkbox"));
goods_info_DB.setSensitivity_num_checkbox(temp);

temp=goods_info_DB.isnullString(request.getParameter("Sensitivity_k_checkbox"));
goods_info_DB.setSensitivity_k_checkbox(temp);



goods_info_DB.mak_filter_list();
String sss;
sss = goods_info_DB.makCommand();	
System.out.println("sss");
//goods_info_DB.goods_filter_search();

%>
	
	
<hr>
 
 <table table style="width:1200;table-layout:fixed" border=1 cellspacing="1" cellpadding ="5" align="center" width=100%>
				<tr bgcolor="#FFCCCC">
				<td><p id="중앙정렬">제품명</p></td>
				<td><p id="중앙정렬">Frequency<br>(MHz)</p></td>
				<td><p id="중앙정렬">DataRate<br>(Kbps)</p></td>
				<td><p id="중앙정렬">BW<br>(KHz)</p></td>
				<td><p id="중앙정렬">RFmax<br>()dBm)</p></td>
				<td><p id="중앙정렬">Sensitivivty<br>(dBm)</p></td>
				<td><p id="중앙정렬">제조사</p></td>
				<td><p id="중앙정렬">Modulation mod</p></td>
				</tr>
 
  
		<%if(goods_info_DB.goods_filter_search()==true){
			do{ %>
				
				
				<tr>
				<td><p id="중앙정렬"><%=goods_info_DB.next_goods_name()%></p></td>
				<td><p id="중앙정렬"><%=goods_info_DB.next_goods_frequency()%></p></td>
				<td><p id="중앙정렬"><%=goods_info_DB.next_goods_DataRate()%></p></td>
				<td><p id="중앙정렬"><%=goods_info_DB.next_goods_BW()%></p></td>
				<td><p id="중앙정렬"><%=goods_info_DB.next_goods_RFmax()%></p></td>
				<td><p id="중앙정렬"><%=goods_info_DB.next_goods_Sensitivity()%></p></td>
				<td><p id="중앙정렬"><%=goods_info_DB.next_goods_mark()%></p></td>
				<td><p id="중앙정렬"><%=goods_info_DB.next_goods_mod()%></p></td>
				</tr>
				
			
			
			<%}while(goods_info_DB.is_info_exist());
		}%>
		</table>
		<hr>
		
		<%goods_info_DB.disconnect(); %>
  
</html>