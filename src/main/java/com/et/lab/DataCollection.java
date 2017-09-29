package com.et.lab;

import java.sql.*;
import java.io.*;
import java.util.*;
import java.sql.*;

/**
This class represent data for the Formmaster database and have all 
methods related to access Form object. 
*/
public class DataCollection 
{
private String formName;
private String number; 
private String language;

private String age;
private String year;
private String gender;
private String country;
private String speciality;
private String noOfArticle;

private String queTag;
private String answerText;
private String[] answerOption=new String[0]; 
private String[] answerPattern;
private int totalCount;
private int existingCount;
private boolean flag=true;//'true' then go for totalCount calculation
	/**
		DataCollection constructor
	*/
	public DataCollection(){
	}
	
	public DataCollection(String formName,String language2){
	}

///////////////////////////////////////////////////////////
// get-set methods for the bean 
///////////////////////////////////////////////////////////
	public String getFormName() {
		return formName;
	}
	
	public void setFormName(String formName) {
		this.formName =formName.toLowerCase();
//		System.out.println("name:"+formName);
	}

	public String getNumber() {
		return number;
	}
	
	public void setNumber(String number) {
		this.number = number.toLowerCase();
	}

	public String getLanguage() {
		return language;
	}
	
	public void setLanguage(String language) {
		this.language = language.toLowerCase();
	}

	public String getAge() {
		return age;
	}
	
	public void setAge(String age) {
		this.age = age.toLowerCase();
	}

	public String getYear() {
		return year;
	}
	
	public void setYear(String year) {
		this.year = year.toLowerCase();
	}

	public String getGender() {
		return gender;
	}
	
	public void setGender(String gender) {
		this.gender = gender.toLowerCase();
	}

	public String getCountry() {
		return country;
	}
	
	public void setCountry(String country) {
		this.country = country.toLowerCase();
	}

	public String getSpeciality() {
		return speciality;
	}
	
	public void setSpeciality(String speciality) {
		this.speciality = speciality.toLowerCase();
	}

	public String getNoOfArticle() {
		return noOfArticle;
	}
	
	public void setNoOfArticle(String noOfArticle) {
		this.noOfArticle = noOfArticle.toLowerCase();
	}

	public String getQueTag(){
		return queTag;
	}

	public void setQueTag(String queTag){
		this.queTag=queTag.toLowerCase();
//		System.out.println("quetag:"+queTag);
	}

	public String getAnswerText(){
		return answerText;
	}

	public void setAnswerText(String answerText){
		this.answerText=answerText.toLowerCase();
	}

	public String[] getAnswerOption(){
		return answerOption;
	}

	public void setAnswerOption(String[] answerOption){
		this.answerOption=answerOption;
//		System.out.println("answerOption length:"+answerOption.length);
	}

	public String[] getAnswerPattern(){
		return answerOption;
	}

	public void setAnswerPattern(String[] answerPattern){
		this.answerPattern=answerPattern;
//		System.out.println("answerPattern length:"+answerPattern.length);
	}

	public int getTotalCount(){
		return totalCount;
	}

	public int getExistingCount(){
		return existingCount;
	}

///////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////
/// Business methods
///////////////////////////////////////////////////////////////

	/**
		Method used to create a Form and inserting data into database.
		Setting formId.
	*/
	public String doDataCollection(){
		String retString="";
		try{
			DBConnect dbc=new DBConnect();
			Connection con=dbc.getConnection();
			Statement st=con.createStatement();
			
			//First know answerChoice for the Question
			String answerChoice="";
			String answerChoiceQuery="select answerchoice from questions where formname='"+formName+"' and qtag='"+queTag+"'";
			ResultSet rs=st.executeQuery(answerChoiceQuery);

			if(rs.next()){
				answerChoice=rs.getString("answerchoice");
			}

			String query="";
			if(dbc.isExisting(formName,"number",number)){

				if(answerChoice.equals("M")){
					query=getUpdateQuery();
				}else{
					query="update "+formName+" set _"+queTag.trim()+"='"+getDBCompitibleString(answerText)+"' where number="+number+"";
				}
				retString="existing";
			}else{

				if(answerChoice.equals("M")){
					query=getInsertQuery();
				}else{
					query="insert into "+formName+" (age,year,gender,country,specialty,noofarticle,language,_"+queTag.trim()+") values ('"+getDBCompitibleString(age)+"','"+getDBCompitibleString(year)+"','"+getDBCompitibleString(gender)+"','"+getDBCompitibleString(country)+"','"+getDBCompitibleString(speciality)+"','"+getDBCompitibleString(noOfArticle)+"','"+getDBCompitibleString(getLanguage(language))+"','"+getDBCompitibleString(answerText)+"')";
				}
				retString="created";
			}
//			System.out.println("insert/update :"+query);
			st.executeUpdate(query);
			st.close();
			con.close();
			dbc.closeConnection();
			}catch(Exception e){
				System.out.println("Error in dodataCollection:"+e);
//				e.printStackTrace();
			}
		return retString;
	}

	/**
		Method used to get next Question number for a Form.
	*/
	public int getNextId(String formName){
		int number=0;
		try{
			DBConnect dbc=new DBConnect();
			Connection con=dbc.getConnection();
			Statement st=con.createStatement();
			String queIdQuery="select max(number) number from "+formName+"";
			ResultSet rs=st.executeQuery(queIdQuery);
			if(rs.next()){
				number=rs.getInt("number");
				number=number+1;		
			}
			st.close();
			con.close();
			dbc.closeConnection();
			}catch(Exception e){
				System.out.println("Error in getNextId :"+e);
//				e.printStackTrace();
			}
		return number;
	}
	/**

	*/
	public int getTotalCount(String formname){
		try{
			DBConnect dbc=new DBConnect();
			Connection con=dbc.getConnection();
			Statement st=con.createStatement();
			String queIdQuery="select count(*) count from "+formname+"";
			ResultSet rs=st.executeQuery(queIdQuery);
			if(rs.next()){
				totalCount=rs.getInt("count");
			}

			st.close();
			con.close();
			dbc.closeConnection();
			}catch(Exception e){
				System.out.println("Error in setQuery :"+e);
//				e.printStackTrace();
			}
	return totalCount;
	}

	/**
	set query result for query mech. part
	*/
	public void setQuery(String formname,String quetag){
		try{
			DBConnect dbc=new DBConnect();
			Connection con=dbc.getConnection();
			Statement st=con.createStatement();
			if(flag){
			String queIdQuery="select count(*) count from "+formname+"";
			ResultSet rs=st.executeQuery(queIdQuery);
				if(rs.next()){
					totalCount=rs.getInt("count");
				}
			flag=false;
			}//end of flag
			Question question=new Question();
			question=question.getQuestion(formname,quetag);
			//All quetag prefix with underscore(_) are stored into database
			String selectQuery=getSelectQuery(question.getAnswerOption(),question.getOptionFirstLangText(),formname,"_"+quetag);
//			System.out.println("query:"+selectQuery);
			ResultSet rs=st.executeQuery(selectQuery);
			if(rs.next()){
				existingCount=rs.getInt("count");
			}
//			System.out.println("total :"+totalCount+" and true :"+existingCount);
			st.close();
			con.close();
			dbc.closeConnection();
			}catch(Exception e){
				System.out.println("Error in setQuery :"+e);
//				e.printStackTrace();
			}
	}
	
	/**	
		getting Query result from que tag list.
	*/
	public String[]	getQueryResult(String formName,String[] queList){
		this.formName=formName;
		String[] result=new String[queList.length];
		for(int i=0;i<queList.length;i++){
			setQuery(formName,queList[i]);
			result[i]=""+getExistingCount();
		}	
		return result;
	}
	/**
		creating insert query for dynamically created Form database.
	*/
	private String getInsertQuery(){
		String column="";
		String values="";
		char text='a';
		int n=0;
		
	//if there is no answerOption then just to avoid null pointer exception,initialise answerOption
		if(answerOption.length==0){
			answerOption=new String[answerPattern.length];
			for(int j=0;j<answerOption.length;j++)
				answerOption[j]="0";
		}

		for(int i=0;i<answerPattern.length;i++){
			column+=",_"+queTag+((char)(text+i));
			if((n<answerOption.length)&&(answerOption[n].equals(answerPattern[i]))){
					values+=",'1'";
					n++;
				}else{
					values+=",'0'";
			}
		}//end of for

		String query="insert into "+formName+" (age,year,gender,country,specialty,noofarticle,language"+column+") values ('"+getDBCompitibleString(age)+"','"+getDBCompitibleString(year)+"','"+getDBCompitibleString(gender)+"','"+getDBCompitibleString(country)+"','"+getDBCompitibleString(speciality)+"','"+getDBCompitibleString(noOfArticle)+"','"+getDBCompitibleString(getLanguage(language))+"'"+values+")";
	return query;
	}
	
	/**
			creating update query for dynamically created Form database.
	*/
	private String getUpdateQuery(){
		String query="update "+formName+" set ";
		String column="";
		char text='a';
		int n=0;

	/*
	if there is no answerOption then just to avoid null pointer exception,
	here we are initialising answerOption.Normally it will be checked at client side.
	*/
		if(answerOption.length==0){
			answerOption=new String[answerPattern.length];
			for(int j=0;j<answerOption.length;j++)
				answerOption[j]="0";
		}

		for(int i=0;i<answerPattern.length;i++){
			column="_"+queTag+((char)(text+i));
			if((n<answerOption.length)&&(answerOption[n].equals(answerPattern[i]))){
				query+=column+"='1',";
				n++;
			}else{
				query+=column+"='0',";
			}
		}
		query=query.trim();
		query=query.substring(0,query.length()-1);	
		query+=" where number="+number+"";	
		return query;
	}
	
	/**
		select query to know answer pattern
	*/
	private String getSelectQuery(String[] answer,String[] answerText,String formname,String quetag){
		String query="select count(*) count from "+formname+" where ";
		char text='a';
		for(int i=0;i<answer.length;i++){

			if(answerText[i].length()>0){
				if(i==answer.length-1){
					query+=quetag+((char)(text+i))+"=";
					query+=answer[i].equals(new String(""+(i+1)))?"'1'":"'0'";
				}else{
					query+=quetag+((char)(text+i))+"=";
					query+=answer[i].equals(new String(""+(i+1)))?"'1'":"'0'";
					query+=" and ";
				}
			}else{
			query=query.substring(0,query.length()-4);
			break;
			}
		}
		return query;	
	}
	/**
		Getting language as per the language value(one/two) passed 
	*/
	private String	getLanguage(String languageValue){
		
		String retString="";
		Form formbean=new Form();			
		formbean=formbean.getForm(formName);
		if(languageValue.equals("one")){
			retString=formbean.getLanguage1();		
		}else{
			retString=formbean.getLanguage2();
		}
	return retString;
	}//end of function..

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
	for testing and debugging only
*/
	public static void main(String[] args) 
	{
		DataCollection f=new DataCollection();
		f.setQuery("datas_colle","que_2");

	}

}
