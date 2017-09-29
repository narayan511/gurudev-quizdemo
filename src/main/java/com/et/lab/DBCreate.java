package com.et.lab;

import java.sql.*;
import java.io.*;
import java.util.*;

/**
This program is used to connect data bases and create tabes for Experimental lab project.it reads Driver name ,Url,SQL server username 
and password from properties file.
*/

public class DBCreate
{
	String result;
    Connection con=null;
	String[] dbstr={"create table formmaster(formid int not null auto_increment primary key,formname varchar(50) not null,language1 varchar(20) default 'english',language2 varchar(20))",
		"create table questions(formid int not null,formname varchar(50) not null,qid int not null,primary key(formid,qid),qtag varchar(50) not null,queinfirstlanguage text,queinsecondlanguage text, uploadfilename varchar(100) default '', answerchoice varchar(5) not null)",
		"create table options(formid int not null,qid int not null,oid int not null,primary key(formid,qid,oid),answeroption int not null,optionfirstlangtext varchar(200),optionsecondlangtext varchar(200))",
		"create table lab_users(uno int not null auto_increment primary key,username varchar(20) not null,password varchar(20) not null,usertype varchar(5) not null)"
		};

	/**
		DBConnect constructor
	*/
	public DBCreate(){
	
		DBConnect dbc=new DBConnect();
		con=dbc.getConnection();
		result=createTable(dbstr);
	}

	/**
		get result
	*/
	public String getResult(){
		return result;
	}
	
	/**
		Create Multiple Tables
	*/
		public String createTable(String[] query){
			String str="";
			try{
			Statement st=con.createStatement();
			for(int i=0;i<query.length;i++)
				st.executeUpdate(query[i]);
			st.close();
			str="created";
			return str;
			}catch(Exception e){
			System.out.println("Create Error:"+e);
			str="Create Error:"+e;
			return str;
			}
	}


	/**
		Create Table
	*/
		public void createTable(String query){
		try{
				DBConnect dbc=new DBConnect();
				con=dbc.getConnection();
				Statement st=con.createStatement();
				st.executeUpdate(query);
				st.close();
				con.close();
			}catch(Exception e){
				System.out.println("Create Error:"+e);
			}
		}


	/**
		Use for local testing 
	*/
	public static void main(String[] args){

	try{
		DBCreate dbc=new DBCreate();
	}catch(Exception e){
		e.printStackTrace();
	}

}
	
}



	

