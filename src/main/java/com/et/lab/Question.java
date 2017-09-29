package com.et.lab;

import java.sql.*;
import java.io.*;
import java.util.*;

/**
This class represent data for Questions database and have all 
methods related to access Questions object.Also seting Options 
database and have methods for the same. 
*/

public class Question 
{
private String formId;	//convert it to int before inserting into DB
private String formName;
private String queId;	//convert it to int before inserting into DB
private String queTag;
private String queInFirstLang;
private String queInSecondLang;
private String uploadFileName;
private String[] answerOption=new String[5];
private String[] optionFirstLangText;
private String[] optionSecondLangText;

/**
for internal purpose only used at the time of update question.
*/
private int optionLength=0; 

/**
answerChoice would be S/M/T 
S- single choice  
M- Miultiple choice 
T- Textual choice
*/
private String answerChoice;

	/**
		Constructor
	*/
	public Question(){
	}

/////////////////////////////////////////////////////////////////////////
// get-set methods for Bean's members
/////////////////////////////////////////////////////////////////////////

	public String getFormId(){
		return formId;
	}

	public void setFormId(String formId){
		this.formId=formId;
	}

	public String getFormName() {
		return formName;
	}
	
	public void setFormName(String formName) {
		this.formName = formName.toLowerCase();
//		System.out.println("name:"+formName);
	}

	public String getQueId(){
		return queId;
	}

	public void setQueId(String queId){
		this.queId=queId;
//		System.out.println("Queid:"+queId);
	}

	public String getQueTag(){
		return queTag;
	}

	public void setQueTag(String queTag){
		this.queTag=queTag.toLowerCase();
//		System.out.println("quetag:"+this.queTag);
	}

	public String getQueInFirstLang(){
		return queInFirstLang;
	}

	public void setQueInFirstLang(String queInFirstLang){
		this.queInFirstLang=queInFirstLang;
//		System.out.println("lang1:"+this.queInFirstLang);
	}

	public String getQueInSecondLang(){
		return queInSecondLang;
	}

	public void setQueInSecondLang(String queInSecondLang){
		this.queInSecondLang=queInSecondLang;
//		System.out.println("lang2:"+this.queInSecondLang);
	}

	public String getUploadFileName(){
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName){
		this.uploadFileName=uploadFileName;
	}

	public String getAnswerChoice(){
		return answerChoice;
	}

	public void setAnswerChoice(String answerChoice){
		this.answerChoice=answerChoice;
//		System.out.println("answerChoice:"+answerChoice);
	}

	public String[] getAnswerOption(){
		return answerOption;
	}

	public void setAnswerOption(String[] answerOption){
		this.answerOption=answerOption;
//		System.out.println("answerOption length:"+answerOption.length);
	}
	
	public String[] getOptionFirstLangText(){
		return optionFirstLangText;
	}
	
	public void setOptionFirstLangText(String[] text1){
		this.optionFirstLangText=text1;
//		System.out.println("Option text length:"+optionFirstLangText.length);
	}
	
	public String[] getOptionSecondLangText(){
		return optionSecondLangText;
	}

	public void setOptionSecondLangText(String[] text2){
		this.optionSecondLangText=text2;
//		System.out.println("Option text length:"+optionSecondLangText.length);
	}

	public int getOptionLength(){
		return optionLength;
	}

	/**
	Making data compitible with Database
	*/	
	private void setData(){
		try{
		queTag=getCompitibleString(queTag);
		queInFirstLang=getDBCompitibleString(queInFirstLang);
		queInSecondLang=getDBCompitibleString(queInSecondLang);
		optionFirstLangText=getDBCompitibleStringArray(optionFirstLangText);
		optionSecondLangText=getDBCompitibleStringArray(optionSecondLangText);
		}catch(Exception e){
		System.out.println("SET Data exception:"+e);
//		e.printStackTrace();
		}
	}
/////////////////////////////////////////////////////////////////////////
	 
/////////////////////////////////////////////////////////////////////////
/// Business methods
/////////////////////////////////////////////////////////////////////////

	/**
		Method used to create a Question and inserting data into database.
	*/
	public String createQuestion(){
		String retString="";
		try{
			setData();//Making class data compitible with database
			DBConnect dbc=new DBConnect();
			Connection con=dbc.getConnection();
			Statement st=con.createStatement();
			if(!dbc.isExisting("questions","qtag",queTag,"formname",formName)){
				queId=""+getNextQueId(formName);
				String query="insert into questions(formid,formname,qid,qtag,queinfirstlanguage,queinsecondlanguage,uploadfilename,answerchoice) values ("+formId+",'"+formName+"',"+queId+",'"+queTag+"','"+queInFirstLang+"','"+queInSecondLang+"','"+uploadFileName+"','"+answerChoice+"')";
				st.executeUpdate(query);
				
				if(!answerChoice.equalsIgnoreCase("T")){
					setOptions(answerOption,optionFirstLangText,optionSecondLangText);
				}

				if(answerChoice.equalsIgnoreCase("M")){
					String addColumn=getAddQuery(formName,"_"+queTag);
					st.executeUpdate(addColumn);
				}else{
					String addColumn="Alter table "+formName+" add( _"+queTag+" TEXT not null)";
					st.executeUpdate(addColumn);
				}
	
				retString="created";
			}else{
				retString="existing";
			}
			st.close();
			con.close();
			dbc.closeConnection();
			}catch(Exception e){
				System.out.println("Error in createQuestion:"+e);
//				e.printStackTrace();
			}
		return retString;
	}

	/**
		Method used to update a Question and updating data into database.
		previously - modify to -work to do 
			T			M		-drop textual column and adding more column for multiple choice
			S			M		-drop single choice column and adding column for mulitple choice
			M			S		-drop all multiple column and add for single
			M			T		-drop all multiple column and add for textual  
			S			T		-just modify varchar size
			T			S		-just modify varchar size

	*/
	public String updateQuestion(){
		String retString="";
		try{
			setData();//Making class data compitible with database
			DBConnect dbc=new DBConnect();
			Connection con=dbc.getConnection();
			Statement st=con.createStatement();

			//checking answer choice 
			String choiceQuery="select answerchoice from questions where formid="+formId+" and qid="+queId+"";
			ResultSet rs=st.executeQuery(choiceQuery);
			String choice="";
			if(rs.next())
				choice=rs.getString("answerchoice");

			if(!choice.equals(answerChoice)){
//				System.out.println("answerChoice:"+answerChoice);
//				System.out.println("Choice:"+choice);
					
				//if choice changes to M then First drop quetag and then add multiple columns...
				if(answerChoice.equals("M")&&(choice.equals("T")||choice.equals("S"))){
//					System.out.println("you have selected mulitple option");
					String dropQuery="Alter table "+formName+" drop _"+queTag+"";
					st.executeUpdate(dropQuery);
					String addQuery=getAddQuery(formName,"_"+queTag);
					st.executeUpdate(addQuery);
		
					if(choice.equalsIgnoreCase("T")){
						setOptions(answerOption,optionFirstLangText,optionSecondLangText);
					}

				}//end of if

				//if choice changes to S/T then First drop multiple columns and add quetag
				if(choice.equals("M")&&(answerChoice.equals("S")||answerChoice.equals("T"))){
//					System.out.println("you have selected other than mulitple option");
					String dropQuery="Alter table "+formName+" drop ";
					char text='a';
					for(int i=0;i<optionFirstLangText.length;i++){
						String value="_"+queTag+((char)(text+i));
						st.executeUpdate(dropQuery+value);
					}//end of for

					String addColumn="";
					if(answerChoice.equals("S")){
						addColumn="Alter table "+formName+" add( _"+queTag+" varchar(5) default '')";
					}else if(answerChoice.equals("T")){
						addColumn="Alter table "+formName+" add( _"+queTag+" TEXT not null)";
					}
					
					st.executeUpdate(addColumn);

				}//end of if
				
				//if choice changes to T from M/S then delete all options 
				if(answerChoice.equals("T")&&(choice.equals("S")||choice.equals("M"))){
						deleteOptions(formId,queId);
				}

				//if choice changes to S from T then set new options 
				if(answerChoice.equals("S")&&choice.equals("T")){
						setOptions(answerOption,optionFirstLangText,optionSecondLangText);
				}

			}//end of if

			String query="update questions set queinfirstlanguage='"+queInFirstLang+"',queinsecondlanguage='"+queInSecondLang+"',uploadfilename='"+uploadFileName+"',answerchoice='"+answerChoice+"' where formid="+formId+" and qid="+queId+"";
			st.executeUpdate(query);
			//work here..
			if(!answerChoice.equalsIgnoreCase("T")){
				updateOptions(answerOption,optionFirstLangText,optionSecondLangText);
			}

			retString="updated";
			st.close();
			con.close();
			dbc.closeConnection();
			}catch(Exception e){
				System.out.println("Error in updateQuestion:"+e);
//				e.printStackTrace();
			}
		return retString;
	}
	
	/**
		Method used to delete a Question and deleting data into database.
	*/
	public void deleteQuestion(){
		try{
			setData();//Making class data compitible with database
			DBConnect dbc=new DBConnect();
			Connection con=dbc.getConnection();
			Statement st=con.createStatement();

			//checking answer choice 
			String choiceQuery="select answerchoice from questions where formid="+formId+" and qid="+queId+"";
			ResultSet rs=st.executeQuery(choiceQuery);
			String choice="";
			if(rs.next())
				choice=rs.getString("answerchoice");

//				System.out.println("answerChoice:"+answerChoice);
//				System.out.println("Choice:"+choice);
//			1) according to choice drop columns.					
				//if choice T / S --drop columns of dynamic Form table..
				if(choice.equals("T")||choice.equals("S")){
//					System.out.println("you have selected mulitple option");
					String dropQuery="Alter table "+formName+" drop _"+queTag+"";
					st.executeUpdate(dropQuery);

				}//end of if

				//if choice M -- drop colums from dynamic Form table
				if(choice.equals("M")){
//					System.out.println("you have selected other than mulitple option");
					String dropQuery="Alter table "+formName+" drop ";
					char text='a';
					for(int i=0;i<optionFirstLangText.length;i++){
						String value="_"+queTag+((char)(text+i));
						st.executeUpdate(dropQuery+value);
					}//end of for

				}//end of if
				
			//2)Delete all options for choice M / S  
				if(choice.equals("S")||choice.equals("M")){
						deleteOptions(formId,queId);
				}

			//3)Delete question from questions table
			String deleteQuery="delete from questions where formid="+formId+" and qid="+queId+"";
			st.executeUpdate(deleteQuery);

			st.close();
			con.close();
			dbc.closeConnection();
			}catch(Exception e){
				System.out.println("Error in deleteQuestion:"+e);
//				e.printStackTrace();
			}
	}


	/**
		Rename uploaded file 
	*/
	public void reNameUploadedFileName(String path,String fileName){
		try{		
		String separator = System.getProperty("file.separator");
//		File file=new File(".."+separator+".."+separator+"upload"+separator+fileName);
		File file=new File(path+separator+"upload"+separator+fileName);
	    StringTokenizer st=new StringTokenizer(fileName,".");
		String extension="";
		while(st.hasMoreTokens()){
			extension=(String)st.nextToken();
		}
		
//		File newFile=new File(".."+separator+".."+separator+"upload"+separator+"formtest."+temp);
		String newFilename=formName+"_"+queTag+"."+extension;
		File newFile=new File(path+separator+"upload"+separator+newFilename);
		if(newFile.exists()){
			System.out.println("deleted:"+newFile.delete());
		} 

		file.renameTo(newFile); 
		setUploadFileName(newFilename);
//		System.out.println("new file name:"+newFilename);
		}catch(Exception e){
			System.out.println("Error :"+e);
		}
		
	}

	/**
		setting Question object from formName and question's tag.
	*/
	public Question getQuestion(String formname,String quetag){
		try{
			DBConnect dbc=new DBConnect();
			Connection con=dbc.getConnection();
			String query="select * from questions where formname='"+formname+"' and qtag='"+quetag+"'";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(query);

			if(rs.next()){
				this.formId=""+rs.getInt("formid");
				this.formName=formname;
				this.queId=""+rs.getInt("qid");
				this.queTag=quetag;
				this.queInFirstLang=rs.getString("queinfirstlanguage");
				this.queInSecondLang=rs.getString("queinsecondlanguage");
				this.uploadFileName=rs.getString("uploadfilename");
				this.answerChoice=rs.getString("answerchoice");
				
				ArrayList ar=getOptions(Integer.parseInt(formId),Integer.parseInt(queId));
				this.optionLength=ar.size();
				this.answerOption=new String[optionLength];
				this.optionFirstLangText=new String[optionLength];
				this.optionSecondLangText=new String[optionLength];

				for(int i=0;i<optionLength;i++){
					Options opt=(Options)ar.get(i);
					this.answerOption[i]=""+opt.getAnswerOption();
					this.optionFirstLangText[i]=opt.getOptionFirstLangText();
					this.optionSecondLangText[i]=opt.getOptionSecondLangText();
				}
//				System.out.println("Length :"+ar.size());
			}
			con.close();
			dbc.closeConnection();

			}catch(Exception e){
				System.out.println("Error in createForm:"+e);
//				e.printStackTrace();
			}
		return this;
	}
	
	/**
		Get Question collection to display all existing form.
	*/
	public String[] getQuestionCollection(String formname){
		ArrayList arrayList=new ArrayList();
		try{
			DBConnect dbc=new DBConnect();
			Connection con=dbc.getConnection();
			String query="select qtag from questions where formname='"+formname+"'";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(query);
			while(rs.next()){
				arrayList.add(new String(rs.getString("qtag")));
			}
			con.close();
			dbc.closeConnection();
			}catch(Exception e){
				System.out.println("Error in question collection:"+e);
//				e.printStackTrace();
			}
			String [] a = new String [0];
		return ((String[])arrayList.toArray(a));
	}

	/**
		Get Question collection which have answer choice like "M"- for muliple.
	*/
	public String[] getQuestionCollection(String formname,String choice){
		ArrayList arrayList=new ArrayList();
		try{
			DBConnect dbc=new DBConnect();
			Connection con=dbc.getConnection();
			String query="select qtag from questions where formname='"+formname+"' and answerchoice='"+choice+"'";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(query);
			while(rs.next()){
				arrayList.add(new String(rs.getString("qtag")));
			}
			con.close();
			dbc.closeConnection();
			}catch(Exception e){
				System.out.println("Error in question collection:"+e);
//				e.printStackTrace();
			}
			String [] a = new String [0];
		return ((String[])arrayList.toArray(a));
	}


	/**
		Method used to get next Question number for a Form.
	*/
	public int getNextQueId(String formName){
		int qid=0;
		try{
			DBConnect dbc=new DBConnect();
			Connection con=dbc.getConnection();
			Statement st=con.createStatement();
			String queIdQuery="select max(qid) qid from questions where formName='"+formName+"'";
			ResultSet rs=st.executeQuery(queIdQuery);
			if(rs.next()){
				qid=rs.getInt("qid");
				qid=qid+1;		
			}
			st.close();
			con.close();
			dbc.closeConnection();
			}catch(Exception e){
				System.out.println("Error in getNextQueId :"+e);
				e.printStackTrace();
			}
		return qid;
	}


	/**
		setting options for the question.
	*/
	public void setOptions(String[] option,String[] optionText1,String[] optionText2){
		int n=0;
		if(answerChoice.equals("S")){
			option=new String[optionText1.length];
		}

		for(int i=0;i<optionText1.length;i++){
			String text1=optionText1[i];
			String text2=optionText2[i];
			int answerOpt=0; 
			if(n<option.length){
				option[n]=(option[n]==null)?"0":option[n];
				if((i+1)==Integer.parseInt(option[n])){
					answerOpt=i+1;
					n++;
				}
			}

/*	//for debugging	of options values		
			System.out.println("option for :"+(i+1)+" value :"+answerOpt);
			System.out.println("text1:"+text1);
			System.out.println("text2:"+text2);
*/
			Options op=new Options(Integer.parseInt(formId),Integer.parseInt(queId),i+1,answerOpt,text1,text2);
			op.createOptions();
		}

	}

	/**
		setting options for the question.
	*/
	public void updateOptions(String[] option,String[] optionText1,String[] optionText2){
		int n=0;
		if(answerChoice.equals("S")){
			option=new String[optionText1.length];
		}

		for(int i=0;i<optionText1.length;i++){
			String text1=optionText1[i];
			String text2=optionText2[i];
			int answerOpt=0; 
			if(n<option.length){
				option[n]=(option[n]==null)?"0":option[n];
				if((i+1)==Integer.parseInt(option[n])){
					answerOpt=i+1;
					n++;
				}
			}

/*	//for debugging	of options values		
			System.out.println("option for :"+(i+1)+" value :"+answerOpt);
			System.out.println("text1:"+text1);
			System.out.println("text2:"+text2);
*/
			Options op=new Options(Integer.parseInt(formId),Integer.parseInt(queId),i+1,answerOpt,text1,text2);
			op.updateOptions();
		}

	}

	/**
		getting option collection objects for a question.
	*/
	private ArrayList getOptions(int formid,int qid){
		ArrayList optionArray=new ArrayList();
		try{
			DBConnect dbc=new DBConnect();
			Connection con=dbc.getConnection();
			Statement st=con.createStatement();
			String queIdQuery="select * from options where formid="+formid+" and qid="+qid+" order by oid";
			ResultSet rs=st.executeQuery(queIdQuery);

			while(rs.next()){
				int oid=rs.getInt("oid");
				int answerOpt=rs.getInt("answeroption");
				String text1=rs.getString("optionfirstlangtext");
				String text2=rs.getString("optionsecondlangtext");
  				Options op=new Options(formid,qid,oid,answerOpt,text1,text2);
				optionArray.add(op);

/*	//for debugging	of options values		
				System.out.println("option value :"+answerOpt);
				System.out.println("text1:"+text1);
				System.out.println("text2:"+text2);
*/
			}
			st.close();
			con.close();
			dbc.closeConnection();
			}catch(Exception e){
				System.out.println("Error in getOptions :"+e);
//				e.printStackTrace();
			}
		return optionArray;
	}
	
	/**
		delete options from database for the specified formid and queid
	*/
	private void deleteOptions(String formid,String queid){
		Options option=new Options();
		option.deleteOptions(Integer.parseInt(formid),Integer.parseInt(queid));
	}

	/**
		to get alter query for multiple option 
	*/
	public String getAddQuery(String formname,String quetag){
		String retQuery="Alter table "+formname+" add (";
		char text='a';
		for(int i=0;i<optionFirstLangText.length;i++){
			if(i<optionFirstLangText.length-1){
				retQuery+=quetag+((char)(text+i))+" varchar(5) default '',";
			}else{
				retQuery+=quetag+((char)(text+i))+" varchar(5) default '')";
			}
		}//end of for
		return retQuery;
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
		Allow single quote(') for Array  
	*/
	private String[] getDBCompitibleStringArray(String[] query){
		String[] retString=new String[query.length];
		for(int i=0;i<retString.length;i++)
			retString[i]=getDBCompitibleString(((query[i].length()>=1)?query[i]:""));

		return retString; 
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
		Local testing,debuging only
	*/
	public static void main(String[] args) 
	{
		Question que=new Question();
		try{
		que.reNameUploadedFileName("path","narayan.java");
		}catch(Exception e){
		System.out.println("error:"+e);
		}

	}
}
