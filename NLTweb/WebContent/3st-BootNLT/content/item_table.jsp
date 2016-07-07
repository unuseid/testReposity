<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
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
goods_info_DB.setGoods_name(request.getParameter("name_text"));


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
 <div class="container">
  <table class="table table-bordered table-striped nanum">
	  <colgroup>
	    <col class="col-xs-1">
	    <col class="col-xs-1">
	    <col class="col-xs-1">
	    <col class="col-xs-1">
	    <col class="col-xs-1">
	    <col class="col-xs-1">
	    <col class="col-xs-1">
	    <col class="col-xs-2">
	  </colgroup>
	  <thead align="center">
				<tr>
				<td>제품명</td>
				<td>Frequecy</td>
				<td>DataRate</td>
				<td>BW</td>
				<td>RFmax</td>
				<td>Sensitivity</td>
				<td>mark</td>
				<td>MOD</td>
				</tr>
 		</thead>
 		<tbody align="center">
  
		<%if(goods_info_DB.goods_filter_search()==true){
			do{ %>
				
				
				<tr>
				<td><%=goods_info_DB.next_goods_name()%></td>
				<td><%=goods_info_DB.next_goods_frequency()%></td>
				<td><%=goods_info_DB.next_goods_DataRate()%></td>
				<td><%=goods_info_DB.next_goods_BW()%></td>
				<td><%=goods_info_DB.next_goods_RFmax()%></td>
				<td><%=goods_info_DB.next_goods_Sensitivity()%></td>
				<td><%=goods_info_DB.next_goods_mark()%></td>
				<td><%=goods_info_DB.next_goods_mod()%></td>
				</tr>
				
			
			
			<%}while(goods_info_DB.is_info_exist());
		}%>
		</tbody>
		</table>
		<hr>
		</div>
		
		<%goods_info_DB.disconnect(); %>
  
</html>