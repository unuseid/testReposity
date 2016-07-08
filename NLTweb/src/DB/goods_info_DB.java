package DB;


import java.security.interfaces.RSAKey;
import java.sql.*;
import java.io.*;

import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
* MySql �� �̹��� �����ϴ� ��ƾ
* CREATE TABLE tbl_test (
* ID INTEGER PRIMARY KEY, 
* FILENAME VARCHAR(50) NOT NULL,
* FILE MEDIUMBLOB NOT NULL
* );
* */
public class goods_info_DB{
	String goods_name, goods_mark, 
	goods_Frequency_low, goods_Frequency_high,
	goods_DataRate_low,goods_DataRate_high,
	goods_BW_low,goods_BW_high,
	goods_Sensitivity_num,goods_Sensitivity_k,
	goods_RFmax;
	//add_goods용
	
	String goods_Mod_3FSK,goods_Mod_4FSK,goods_Mod_FSK,goods_Mod_GFSK,goods_Mod_MSK,goods_Mod_GMSK,goods_Mod_OOK;
	
	
	String filter_d;
	
	
	String filter_food,filter_alcohol, filter_forKid, filter_cargoods, filter_kitchen,
	filter_office, filter_interior, filter_under, filter_pet, filter_living, filter_toy, filter_name; //üũ�ڽ��� ���� ���͵�
	
	
	String mod_list[] = {"MODE_3FSK", "MODE_4FSK", "MODE_FSK", "MODE_GFSK", "MODE_MSK", "MODE_GMSK", "MODE_OOK"};
	String mod_filter[]={null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null};
	String CommandTemp[]={"1",null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,
			null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,
			null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null};
	boolean Frequency_low_checkbox,Frequency_high_checkbox, DataRate_low_checkbox,DataRate_high_checkbox,BW_low_checkbox,BW_high_checkbox,RFmax_checkbox,
	Sensitivity_num_checkbox,Sensitivity_k_checkbox;
	
	private String jdbcURL = "jdbc:mysql://localhost:3306/webdb";
	private String dbID="root";
	private String dbPW="1031";
	
	private Connection conn= null;
	private PreparedStatement pstmt = null;
	private String Command;
	private Statement stmt;
	private ResultSet rs;
	
	
	public void connect() throws SQLException{ //������ ���̽��� ���� jsp���������� �ݵ�� dbó�� �� ȣ������� ��
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcURL,dbID,dbPW);
			stmt = conn.createStatement();
		} catch (ClassNotFoundException e) {e.printStackTrace();}
	}
		
	public void disconnect() throws SQLException{//������ ���̽� �������� jps���������� �ݵ�� ������ �������
		if(pstmt!=null){pstmt.close();}
		if(conn!=null){conn.close();}
		if(stmt!=null){stmt.close();}
		if(rs != null){rs.close();}
	}
	
	
	public boolean search_goods_name() throws SQLException{
		
			String Command = String.format("select *from item_list where name='"+goods_name+"'");
	
			ResultSet rs = stmt.executeQuery(Command);  //��� result�� ��ü rs�� ��ȯ
			
			return rs.next();


	}
	
	
	
	public boolean add_goods() throws SQLException{// �ߺ� Ȯ���� ����� �߰������ �� ���� ��� �߰� ����� ��ȯ
		int i=0;
		if(search_goods_name()==false){
			String Command = String.format("insert into item_list"+"(name) values('%s');",goods_name);//�ϴ� ǰ���̸� �߰�
			stmt.executeUpdate(Command);
		}
			if(goods_Frequency_low!="")
			{
			Command = String.format("update item_list set frequency_low='%s' where name='%s';",goods_Frequency_low,goods_name);
			stmt.executeUpdate(Command);
			}
			if(goods_Frequency_high!=""){
			Command = String.format("update item_list set frequency_high='%s' where name='%s';",goods_Frequency_high,goods_name);
			stmt.executeUpdate(Command);
			}
			if(goods_DataRate_low!=""){
			Command = String.format("update item_list set DataRate_low='%s' where name='%s';",goods_DataRate_low,goods_name);
			stmt.executeUpdate(Command);	
			}
			if(goods_DataRate_high!=""){
			Command = String.format("update item_list set DataRate_high='%s' where name='%s';",goods_DataRate_high,goods_name);
			stmt.executeUpdate(Command);
			}
			if(goods_BW_low!=""){
			Command = String.format("update item_list set BW_low='%s' where name='%s';",goods_BW_low,goods_name);
			stmt.executeUpdate(Command);
			}
			if(goods_BW_high!=""){
			Command = String.format("update item_list set BW_high='%s' where name='%s';",goods_BW_high,goods_name);
			stmt.executeUpdate(Command);
			}
			if(goods_RFmax!=""){
			Command = String.format("update item_list set RF_max='%s' where name='%s';",goods_RFmax,goods_name);
			stmt.executeUpdate(Command);
			}
			if(goods_Sensitivity_num!=""){
			Command = String.format("update item_list set Sensitivity_num='%s' where name='%s';",goods_Sensitivity_num,goods_name);
			stmt.executeUpdate(Command);
			}
			if(goods_Sensitivity_k!=""){
			Command = String.format("update item_list set Sensitivity_k='%s' where name='%s';",goods_Sensitivity_k,goods_name);
			stmt.executeUpdate(Command);
			}
			if(goods_mark!=""){
			Command = String.format("update item_list set mark='%s' where name='%s';",goods_mark,goods_name);
			stmt.executeUpdate(Command);
			}
			
			System.out.println(goods_Mod_3FSK);
			if(goods_Mod_3FSK!=null){
			goods_Mod_3FSK="1";}else{goods_Mod_3FSK="0";}
			Command = String.format("update item_list set MODE_3FSK='%s' where name='%s';",goods_Mod_3FSK,goods_name);
			stmt.executeUpdate(Command);
			
			
			if(goods_Mod_4FSK!=null){
			goods_Mod_4FSK="1";}else{goods_Mod_4FSK="0";}
			Command = String.format("update item_list set MODE_4FSK=%s where name='%s';",goods_Mod_4FSK,goods_name);
			stmt.executeUpdate(Command);
			
			if(goods_Mod_FSK!=null){
			goods_Mod_FSK="1";}else{goods_Mod_FSK="0";}
			Command = String.format("update item_list set MODE_FSK=%s where name='%s';",goods_Mod_FSK,goods_name);
			stmt.executeUpdate(Command);
			
			if(goods_Mod_GFSK!=null){
			goods_Mod_GFSK="1";}else{goods_Mod_GFSK="0";}
			Command = String.format("update item_list set MODE_GFSK=%s where name='%s';",goods_Mod_GFSK,goods_name);
			stmt.executeUpdate(Command);
			
			if(goods_Mod_MSK!=null){
			goods_Mod_MSK="1";}else{goods_Mod_MSK="0";}
			Command = String.format("update item_list set MODE_MSK=%s where name='%s';",goods_Mod_MSK,goods_name);
			stmt.executeUpdate(Command);
			
			if(goods_Mod_GMSK!=null){
			goods_Mod_GMSK="1";}else{goods_Mod_GMSK="0";}
			Command = String.format("update item_list set MODE_GMSK=%s where name='%s';",goods_Mod_GMSK,goods_name);
			stmt.executeUpdate(Command);
			
			if(goods_Mod_OOK!=null){
			goods_Mod_OOK="1";}else{goods_Mod_OOK="0";}
			Command = String.format("update item_list set MODE_OOK=%s where name='%s';",goods_Mod_OOK,goods_name);
			stmt.executeUpdate(Command);
			
			
		return true;	
	}
	
	public boolean add_goods_img() throws SQLException{// �ߺ� Ȯ���� ����� �߰������ �� ���� ��� �߰� ����� ��ȯ
		
		if(search_goods_name()!=false){
			
			//Command = String.format("update item_list set _img='%s' where _name='%s';",goods_img,goods_name);
			//stmt.executeUpdate(Command);		
				
			return true;
		}	
		return false;	
	}
	
	
	
	public void mak_filter_list(){
		int i=0;
		if(goods_Mod_3FSK!=null){mod_filter[i++]="MODE_3FSK";}
		if(goods_Mod_4FSK!=null){mod_filter[i++]="MODE_4FSK";}
		if(goods_Mod_FSK!=null){mod_filter[i++]="MODE_FSK";}
		if(goods_Mod_GFSK!=null){mod_filter[i++]="MODE_GFSK";}
		if(goods_Mod_MSK!=null){mod_filter[i++]="MODE_MSK";}
		if(goods_Mod_GMSK!=null){mod_filter[i++]="MODE_GMSK";}
		if(goods_Mod_OOK!=null){mod_filter[i++]="MODE_OOK";}
	}
	
	
	/*
	 * makCommand�Լ��� sql�˻���ɾ ������ش�
	 * filter���� ���θ� �ϳ��� �˾ƺ��� sql�� �� command�� �ۼ��Ѵ�. �ݵ�� mak_filter_�Լ��� ���� �ؾ� �Ѵ�
	 */
	public String makCommand(){
		/*goods_name, goods_mark, 
	goods_Frequency_low, goods_Frequency_high,
	goods_DataRate_low,goods_DataRate_high,
	goods_BW_low,goods_BW_high,
	goods_Sensitivity_num,goods_Sensitivity_k,
	goods_RFmax;
	Frequency_low_checkbox,Frequency_high_checkbox, DataRate_low_checkbox,DataRate_high_checkbox,BW_low_checkbox,BW_high_checkbox,RFmax_checkbox,
	Sensitivity_num_checkbox,Sensitivity_k_checkbox;
	*
	*/
		int i=0;
		Command = String.format("select *from item_list where ");//�ϴ� �⺻���� ��
		
		if(goods_Frequency_low!=""){
			CommandTemp[i++] = " frequency_low";
			CommandTemp[i++] = makCommandUpDown(goods_Frequency_low,Frequency_low_checkbox);
		}
		
		if(goods_Frequency_high!=""){
			CommandTemp[i++] = " frequency_high";
			CommandTemp[i++] = makCommandUpDown(goods_Frequency_high,Frequency_high_checkbox);
		}
		if(goods_DataRate_low!=""){
			CommandTemp[i++] = " DataRate_low";
			CommandTemp[i++] = makCommandUpDown(goods_DataRate_low,DataRate_low_checkbox);
		}
		if(goods_DataRate_high!=""){
			CommandTemp[i++] = " DataRate_high";
			CommandTemp[i++] = makCommandUpDown(goods_DataRate_high,DataRate_high_checkbox);
		}
		if(goods_BW_low!=""){
			CommandTemp[i++] = " BW_low";
			CommandTemp[i++] = makCommandUpDown(goods_BW_low,BW_low_checkbox);
		}
		if(goods_BW_high!=""){
			CommandTemp[i++] = " BW_high";
			CommandTemp[i++] = makCommandUpDown(goods_BW_high,BW_high_checkbox);
		}
		if(goods_RFmax!=""){
			CommandTemp[i++] = " RF_max";
			CommandTemp[i++] = makCommandUpDown(goods_RFmax,RFmax_checkbox);
		}
		if(goods_Sensitivity_num!=""){
			CommandTemp[i++] = " Sensitivity_num";
			CommandTemp[i++] = makCommandUpDown(goods_Sensitivity_num,Sensitivity_num_checkbox);
		}
		if(goods_Sensitivity_k!=""){
			CommandTemp[i++] = " Sensitivity_k";
			CommandTemp[i++] = makCommandUpDown(goods_Sensitivity_k,Sensitivity_k_checkbox);
		}
		if(goods_mark!=""){
			CommandTemp[i++] = " Mark";
			CommandTemp[i++] = "='"+goods_mark+"'";
		}
		if(goods_name!=""){
			CommandTemp[i++] = " name";
			CommandTemp[i++] = "='"+goods_name+"'";
		}
	
		
		
		for(int n = 0; mod_filter[n]!=null ; n++){
		CommandTemp[i++] = mod_filter[n]; 
		CommandTemp[i++] = "='1'"; 
		}
		/*
		if(filter_name!=null &&  filter_name!=""){ Command += " AND _name like '%"+filter_name+"%'";}
		Command += ";";
		*/
		
		
		i=0;
		System.out.println(CommandTemp[0]+"커맨드 탬프"); //첫번째 조건을 커멘드에 붙임
		if(CommandTemp[i]!=null)Command +=CommandTemp[i++];
		if(CommandTemp[i]!=null)Command +=CommandTemp[i++];
		
		while(CommandTemp[i]!=null){	//두번째 조건부터는 &&와 함께 커멘드에 붙인다
			Command +="&&"+CommandTemp[i++];
			Command +=CommandTemp[i];
			//System.out.println(CommandTemp[i]+"커맨드 템프");
			i++;
		}
		Command +=";";
		System.out.println("완성된 커맨드"+Command);
		return Command;
	}
	
	public String makCommandUpDown(String s, boolean b){
		String temp = "";
		if(s!=null){
			if(b){temp += " >= "+s;}//작성값 이상
			else{temp += " <= "+s;}
		}
		return temp; 	
	}
	
	public boolean isnullString(String ss){
		if(ss==null){return false;}
		return true;	
	}
	
	public boolean isnull(){
		return filter_name.equals(null);
	}
	public boolean isemty(){
		return filter_name.equals("");
	}
	public boolean isnull2(){
		return filter_food.equals(null);
	}
	public boolean isemty2(){
		return filter_food.equals("");
	}
	public void ininit(){
		filter_name ="";
	}

	public boolean goods_filter_search() throws SQLException{
		if(Command.startsWith("select *from item_list where  frequency_low&&")){return false;}
		rs = stmt.executeQuery(Command);  //��� result�� ��ü rs�� ��ȯ
		return rs.next();
	}
	
	public boolean goods_name_search(String name) throws SQLException{
		rs = stmt.executeQuery("select *from item_list where name ='"+name+"'");  //��� result�� ��ü rs�� ��ȯ
		return rs.next();
	}
	
	public boolean is_info_exist() throws SQLException{
		return rs.next();
	}
	
	public String next_goods_name() throws SQLException{
		return rs.getString("name");
	}
	public String next_goods_frequency() throws SQLException{
		String temp = rs.getString("frequency_low")+" ~ "+rs.getString("frequency_high");
		return temp;
	}
	public String next_goods_DataRate() throws SQLException{
		return rs.getString("DataRate_low")+" ~ "+rs.getString("DataRate_high");
	}
	public String next_goods_BW() throws SQLException{
		return rs.getString("BW_low")+" ~ "+rs.getString("BW_high");
	}
	public String next_goods_RFmax() throws SQLException{
		return rs.getString("RF_max");
	}
	public String next_goods_Sensitivity() throws SQLException{
		return rs.getString("Sensitivity_num")+" @ "+rs.getString("Sensitivity_k")+"k";
	}
	public String next_goods_mark() throws SQLException{
		return rs.getString("mark");
	}
	
	public String next_goods_mod() throws SQLException{
		String temp="";
		String result="";
		for(int i=0; i< mod_list.length; i++){
			temp=rs.getString(mod_list[i]);
			System.out.println(i+"문자열"+temp);
			if(temp!=null){result += mod_list[i]+" "; System.out.println("진입");} 
		}
		System.out.println("최종반환"+result);
		return result;
	}
	

	public String getGoods_name() {
		return goods_name;
	}

	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	
	public String getFilter_food() {
		return filter_food;
	}

	public void setFilter_food(String filter_food) {
		this.filter_food = filter_food;
	}

	public String getFilter_alcohol() {
		return filter_alcohol;
	}

	public void setFilter_alcohol(String filter_alcohol) {
		this.filter_alcohol = filter_alcohol;
	}

	public String getFilter_forKid() {
		return filter_forKid;
	}

	public void setFilter_forKid(String filter_forKid) {
		this.filter_forKid = filter_forKid;
	}

	public String getFilter_cargoods() {
		return filter_cargoods;
	}

	public void setFilter_cargoods(String filter_cargoods) {
		this.filter_cargoods = filter_cargoods;
	}

	public String getFilter_kitchen() {
		return filter_kitchen;
	}

	public void setFilter_kitchen(String filter_kitchen) {
		this.filter_kitchen = filter_kitchen;
	}

	public String getFilter_office() {
		return filter_office;
	}

	public void setFilter_office(String filter_office) {
		this.filter_office = filter_office;
	}

	public String getFilter_interior() {
		return filter_interior;
	}

	public void setFilter_interior(String filter_interior) {
		this.filter_interior = filter_interior;
	}

	public String getFilter_under() {
		return filter_under;
	}

	public void setFilter_under(String filter_under) {
		this.filter_under = filter_under;
	}

	public String getFilter_pet() {
		return filter_pet;
	}

	public void setFilter_pet(String filter_pet) {
		this.filter_pet = filter_pet;
	}

	public String getFilter_living() {
		return filter_living;
	}

	public void setFilter_living(String filter_living) {
		this.filter_living = filter_living;
	}

	public String getFilter_toy() {
		return filter_toy;
	}

	public void setFilter_toy(String filter_toy) {
		this.filter_toy = filter_toy;
	}

	public String getFilter_name() {
		return filter_name;
	}

	public void setFilter_name(String filter_name) {
		this.filter_name = filter_name;
	}

	public void setGoods_mark(String goods_mark) {
		this.goods_mark = goods_mark;
	}

	public void setGoods_Frequency_low(String goods_Frequency_low) {
		this.goods_Frequency_low = goods_Frequency_low;
	}

	public void setGoods_Frequency_high(String goods_Frequency_high) {
		this.goods_Frequency_high = goods_Frequency_high;
	}

	public void setGoods_DataRate_low(String goods_DataRate_low) {
		this.goods_DataRate_low = goods_DataRate_low;
	}

	public void setGoods_DataRate_high(String goods_DataRate_high) {
		this.goods_DataRate_high = goods_DataRate_high;
	}

	public void setGoods_BW_low(String goods_BW_low) {
		this.goods_BW_low = goods_BW_low;
	}

	public void setGoods_BW_high(String goodsBW_high) {
		this.goods_BW_high = goodsBW_high;
	}

	public void setGoods_Sensitivity_num(String goods_Sensitivity_num) {
		this.goods_Sensitivity_num = goods_Sensitivity_num;
	}

	public void setGoods_Sensitivity_k(String goods_Sensitivity_k) {
		this.goods_Sensitivity_k = goods_Sensitivity_k;
	}

	public void setGoods_RFmax(String goods_RFmax) {
		this.goods_RFmax = goods_RFmax;
	}

	public void setFilter(String[] filter) {
		this.mod_filter = filter;
	}

	public void setJdbcURL(String jdbcURL) {
		this.jdbcURL = jdbcURL;
	}

	public void setDbID(String dbID) {
		this.dbID = dbID;
	}

	public void setDbPW(String dbPW) {
		this.dbPW = dbPW;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}

	public void setPstmt(PreparedStatement pstmt) {
		this.pstmt = pstmt;
	}

	public void setCommand(String command) {
		Command = command;
	}

	public void setStmt(Statement stmt) {
		this.stmt = stmt;
	}

	public void setRs(ResultSet rs) {
		this.rs = rs;
	}

	public void setGoods_Mod_3FSK(String goods_Mod_3FSK) {
		this.goods_Mod_3FSK = goods_Mod_3FSK;
	}

	public void setGoods_Mod_4FSK(String goods_Mod_4FSK) {
		this.goods_Mod_4FSK = goods_Mod_4FSK;
	}

	public void setGoods_Mod_FSK(String goods_Mod_FSK) {
		this.goods_Mod_FSK = goods_Mod_FSK;
	}

	public void setGoods_Mod_GFSK(String goods_Mod_GFSK) {
		this.goods_Mod_GFSK = goods_Mod_GFSK;
	}

	public void setGoods_Mod_MSK(String goods_Mod_MSK) {
		this.goods_Mod_MSK = goods_Mod_MSK;
	}

	public void setGoods_Mod_GMSK(String goods_Mod_GMSK) {
		this.goods_Mod_GMSK = goods_Mod_GMSK;
	}

	public void setGoods_Mod_OOK(String goods_Mod_OOK) {
		this.goods_Mod_OOK = goods_Mod_OOK;
	}

	public void setFilter_d(String filter_d) {
		this.filter_d = filter_d;
	}

	public void setMod_filter(String[] mod_filter) {
		this.mod_filter = mod_filter;
	}

	public void setFrequency_low_checkbox(boolean frequency_low_checkbox) {
		Frequency_low_checkbox = frequency_low_checkbox;
	}

	public void setFrequency_high_checkbox(boolean frequency_high_checkbox) {
		Frequency_high_checkbox = frequency_high_checkbox;
	}

	public void setDataRate_low_checkbox(boolean dataRate_low_checkbox) {
		DataRate_low_checkbox = dataRate_low_checkbox;
	}

	public void setDataRate_high_checkbox(boolean dataRate_high_checkbox) {
		DataRate_high_checkbox = dataRate_high_checkbox;
	}

	public void setBW_low_checkbox(boolean bW_low_checkbox) {
		BW_low_checkbox = bW_low_checkbox;
	}

	public void setBW_high_checkbox(boolean bW_high_checkbox) {
		BW_high_checkbox = bW_high_checkbox;
	}

	public void setRFmax_checkbox(boolean rFmax_checkbox) {
		RFmax_checkbox = rFmax_checkbox;
	}

	public void setSensitivity_num_checkbox(boolean sensitivity_num_checkbox) {
		Sensitivity_num_checkbox = sensitivity_num_checkbox;
	}

	public void setSensitivity_k_checkbox(boolean sensitivity_k_checkbox) {
		Sensitivity_k_checkbox = sensitivity_k_checkbox;
	}

}
