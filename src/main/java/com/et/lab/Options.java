package com.et.lab;
	
import java.sql.*;
import java.io.*;
import java.util.*;
	
/**	
This class represent data for the Options database and have all 
methods related to access Options object.
*/	
	
public class Options 
{	
private int formId;
private int queId;
private int oid;
private int answerOption;
private String optionFirstLangText;
private String optionSecondLangText;
	
	/**
		Options constructor
	*/
	public Options(){
	
	}
	/**
		pass all parameter , instansiate object also setting option into Database
	*/
	public Options(int formId,int queId,int oid,int answerOption,String optionFirstLangText,String optionSecondLangText){
		this.formId=formId;
		this.queId=queId;
		this.oid=oid;
		this.answerOption=answerOption;
		this.optionFirstLangText=optionFirstLangText;
		this.optionSecondLangText=optionSecondLangText;
	}
/////////////////////////////////////////////////////////////////////////////
/// get methods for options
/////////////////////////////////////////////////////////////////////////////

	public int getFormId(){
		return formId;
	}

	public int getQueId(){
		return queId;
	}
	
	public int getOid(){
		return oid;
	}
	
	public int getAnswerOption(){
		return answerOption;
	}

	public String getOptionFirstLangText(){
		return optionFirstLangText;
	}

	public String getOptionSecondLangText(){
		return optionSecondLangText;
	}
////////////////////////////////////////////////////////////////////////////

	/**
		create options into Database
	*/	
	public void createOptions(){
		try{
			DBConnect dbc=new DBConnect();
			Connection con=dbc.getConnection();
			Statement st=con.createStatement();
	
			String query="insert into options(formid,qid,oid,answeroption,optionfirstlangtext,optionsecondlangtext) values ("+formId+","+queId+","+oid+","+answerOption+",'"+optionFirstLangText+"','"+optionSecondLangText+"')";
			st.executeUpdate(query);
			st.close();
			con.close();
			dbc.closeConnection();
			}catch(Exception e){
				System.out.println("Error in createOption:"+e);
			}
	}

	/**
		Update options into Database
	*/	
	public void updateOptions(){
		try{
			DBConnect dbc=new DBConnect();
			Connection con=dbc.getConnection();
			Statement st=con.createStatement();
			String query="update options set answeroption="+answerOption+",optionfirstlangtext='"+optionFirstLangText+"',optionsecondlangtext='"+optionSecondLangText+"' where formid="+formId+" and qid="+queId+" and oid="+oid+"";
			st.executeUpdate(query);
			st.close();
			con.close();
			dbc.closeConnection();
			}catch(Exception e){
				System.out.println("Error in updateOptions:"+e);
			}
	}

	/**
		Delete options from database
	*/	
	public void deleteOptions(int formid,int queid){
		try{
			DBConnect dbc=new DBConnect();
			Connection con=dbc.getConnection();
			Statement st=con.createStatement();
			String query="delete from options where formid="+formid+" and qid="+queid+"";
			st.executeUpdate(query);
			st.close();
			con.close();
			dbc.closeConnection();
			}catch(Exception e){
				System.out.println("Error in deleteOptions:"+e);
			}
	}
	
	public static void main(String[] args) 
	{
		System.out.println("Hello World!");
	}
}	
