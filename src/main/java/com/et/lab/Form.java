package com.et.lab;

import java.sql.*;
import java.io.*;
import java.util.*;
import java.sql.*;

/**
This class represent data for the Formmaster database and have all 
methods related to access Form object. 
*/
public class Form 
{
private int formId;
private String formName; 
private String language1;
private String language2;

	/**
		Form constructor
	*/
	public Form(){
	}
	
	public Form(String formName,String language2){
		this.formName=formName.toLowerCase();
		this.language2=language2.toLowerCase();
	}

	public void setForm(String formname){
	
	
	}
///////////////////////////////////////////////////////////
// get-set methods for the bean 
///////////////////////////////////////////////////////////

	public int getFormId() {
		return formId;
	}
	
	public void setFormId(int formId) {
		this.formId =formId;
	}

	public String getFormName() {
		return formName;
	}
	
	public void setFormName(String formName) {
		this.formName = formName.toLowerCase();
	}

	public String getLanguage1() {
		return language1;
	}
	
	public void setLanguage1(String language1) {
		this.language1 =language1.toLowerCase();
	}

	public String getLanguage2() {
		return language2;
	}
	
	public void setLanguage2(String language2) {
		this.language2 = language2.toLowerCase();
	}

	/**
	Making data compitible with Database
	*/	
	private void setData(){
		formName = getCompitibleString(formName);
		language1 = getDBCompitibleString(language1);
		language2 = getDBCompitibleString(language2);
	}
///////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////
/// Business methods
///////////////////////////////////////////////////////////////

	/**
		Method used to create a Form and inserting data into database.
		Setting formId.
	*/
	public String createForm(){
		String retString="";
		try{
			setData();//making data compitible with Database.
			DBConnect dbc=new DBConnect();
			Connection con=dbc.getConnection();
			Statement st=con.createStatement();
			if(!dbc.isExisting("formmaster","formname","'"+formName+"'")){
				String query="insert into formmaster(formName,language2) values ('"+formName+"','"+language2+"')";
				st.executeUpdate(query);
				//creating table as per the formname
				String createFormTable="create table "+formName+" (number int not null auto_increment primary key,age varchar(10) default '',year varchar(10) default '',gender varchar(10) default '',country varchar(20) default '',specialty varchar(50) default '',noofarticle varchar(5) default '',language varchar(20) not null)";
				st.executeUpdate(createFormTable);
				retString="created";
			}else{
				retString="existing";
			}
			String formIdQuery="select formid from formmaster where formname='"+formName+"'";
			ResultSet rs=st.executeQuery(formIdQuery);
			formId=(rs.next())?rs.getInt("formid"):0;
			st.close();
			con.close();
			dbc.closeConnection();
			}catch(Exception e){
				System.out.println("Error in createForm:"+e);
			}
		return retString;
	}

	/**
		Method used to Modify Form's Language.
	*/
	public void modifyFormLanguage(){
		try{
			setData();//making data compitible with Database.
			DBConnect dbc=new DBConnect();
			Connection con=dbc.getConnection();
			Statement st=con.createStatement();
			if(dbc.isExisting("formmaster","formname","'"+formName+"'")){
				String query="update formmaster set language2='"+language2+"' where formname='"+formName+"'";
				st.executeUpdate(query);
			}

			String formIdQuery="select formid from formmaster where formname='"+formName+"'";
			ResultSet rs=st.executeQuery(formIdQuery);
			formId=(rs.next())?rs.getInt("formid"):0;
			st.close();
			con.close();
			dbc.closeConnection();
			}catch(Exception e){
				System.out.println("Error in modifyFormLanguage:"+e);
			}

	}


	/**
		Get Form collection to display all existing form.
	*/
	public String[] getFormCollection(){
		ArrayList arrayList=new ArrayList();
		try{
			DBConnect dbc=new DBConnect();
			Connection con=dbc.getConnection();
			String query="select formname from formmaster";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(query);
			while(rs.next()){
				arrayList.add(new String(rs.getString("formname")));
			}
			con.close();
			dbc.closeConnection();
			}catch(Exception e){
				System.out.println("Error in createForm:"+e);
			}
			String [] a = new String [0];
		return ((String[])arrayList.toArray(a));
	}

	/**
		setting form object from formName and retrive Form object.
	*/
	public Form getForm(String formname){
		try{
			DBConnect dbc=new DBConnect();
			Connection con=dbc.getConnection();
			String query="select * from formmaster where formname='"+formname+"'";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(query);
			while(rs.next()){
				this.formId=rs.getInt("formid");
				this.formName=formname;
				this.language1=rs.getString("language1");
				this.language2=rs.getString("language2");
			}
			con.close();
			dbc.closeConnection();
			}catch(Exception e){
				System.out.println("Error in createForm:"+e);
			}
		return this;
	}

	/**
		Method used to delete a form.
		1)drop dynamic created form table
		2)Delete all options for the Form from options table
		3)Delete all questions for the Form from questions table
		4)Delete form from formmaster table.
	*/
	public void deleteForm(){

		try{
			DBConnect dbc=new DBConnect();
			Connection con=dbc.getConnection();
			Statement st=con.createStatement();

		//1)drop dynamic created Form table
			String dropForm="drop table "+formName+"";
			st.executeUpdate(dropForm);

		//2)Delete all options for the Form from options table
			String deleteQuery="delete from options where formid="+formId+"";
			st.executeUpdate(deleteQuery);

		//3)Delete all questions for the Form from questions table
			deleteQuery="delete from questions where formid="+formId+"";
			st.executeUpdate(deleteQuery);
		
		//4)Delete form from formmaster table.
			deleteQuery="delete from formmaster where formid="+formId+"";
			st.executeUpdate(deleteQuery);

			st.close();
			con.close();
			dbc.closeConnection();
			}catch(Exception e){
				System.out.println("Error in deleteForm:"+e);
//				e.printStackTrace();
			}

	}

	/**
		To delete all data From dynamically created Form table.
	*/
	public void deleteFormData(String formname){
	
		try{
			DBConnect dbc=new DBConnect();
			Connection con=dbc.getConnection();
			Statement st=con.createStatement();

		//1)delete all data From Form table
			String deleteQuery="delete from "+formname+"";
			st.executeUpdate(deleteQuery);
	
			st.close();
			con.close();
			dbc.closeConnection();
			}catch(Exception e){
				System.out.println("Error in deleteFormData:"+e);
//				e.printStackTrace();
			}
	
	}
	/**
		this allow single quote(') as a input data.Replacing ' with /' 
	*/
	private String getDBCompitibleString(String query){
		if((query!=null)&& (query.length()>=1)){
			StringTokenizer st=new StringTokenizer(query,"'");
			String tempQuery="";
			while (st.hasMoreTokens()) {
			   tempQuery+=(String)st.nextToken()+"\\'";
			}
			return tempQuery.substring(0,tempQuery.length()-2); 
		}else{
			return "";
		}
	}
	/**
		this remove single quote(') and if there is any white space then it will be replaced by underscore '_' 
	*/
	private String getCompitibleString(String query){
		if((query!=null)&& (query.length()>=1)){
			StringTokenizer st=new StringTokenizer(query,"'");
			String tempQuery="";
			while (st.hasMoreTokens()) {
			   tempQuery+=(String)st.nextToken();
			}
			query=tempQuery;
			tempQuery="";
			st=new StringTokenizer(query);
			while(st.hasMoreTokens()){
				tempQuery+=(String)st.nextToken()+"_";
			}
			return tempQuery.substring(0,tempQuery.length()-1); 
		}else{
			return "";
		}
	}

/**
	for testing and debugging only
*/
	public static void main(String[] args) 
	{
		Form f=new Form("form2","french");
		f=f.getForm("form10");
		String[] al=f.getFormCollection();
		for(int i=0;i<al.length;i++)
			System.out.println("contet :"+al[i]);
		System.out.println("formid:"+f.getFormId());
	}

}
