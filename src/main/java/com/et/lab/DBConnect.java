package com.et.lab;

import java.sql.*;
import java.io.*;
import java.util.*;
	
/**		
This program is used to connect data bases it reads Driver name ,Url,SQL server username 
and password from properties file.
*/	
	
public class DBConnect
{	
    Connection con=null;
	
	/**
		DBConnect constructor
	*/
	public DBConnect(){}
	
	/**
		Get Connection object for the database specified in local.properties
		Using local.properties file for getting Driver and URL
		CSDriver=com.mysql.jdbc.Driver
		CSURL=jdbc:mysql://localhost/duke
	*/
	public Connection getConnection()
	{
		try{
	
		String driver="";
		String url="";
		//String userid="";
		//String password="";
	
		String srbName="locale";
		ResourceBundle rbConnect;
		rbConnect = ResourceBundle.getBundle(srbName);
		driver=rbConnect.getString("CSDriver");
		url=rbConnect.getString("CSURL");
		//userid=rbConnect.getString("CSUID");
		//password=rbConnect.getString("CSPass");
	
		Class.forName(driver);
		con=DriverManager.getConnection(url);   
//		System.out.println("Connection done");
		}catch(Exception sq)
		 { 
			sq.printStackTrace();
		}
	
	return con;
	}	
	
	/**
		Close Connection 
	*/
	public void closeConnection()
	{
	try{
	 con.close();
	 }catch(Exception sq1){ 
	 	sq1.printStackTrace();
	   }
	}	
	
	/**
		Checking existence of Form in Database
	*/
	public boolean isExisting(String tableName,String fieldName,String fieldValue)throws Exception{

		String query="select * from "+tableName+" where "+fieldName+"="+fieldValue+"";
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(query);
		return rs.next(); 
//		}catch(Exception ee){
//		ee.printStackTrace();
//		}
//		return false;
	}
	
	/**
		Checking existence of Question's tag in Database
	*/
	public boolean isExisting(String tableName,String fieldName1,String fieldValue1,String fieldName2,String fieldValue2)throws Exception{
		String query="select * from "+tableName+" where "+fieldName1+"='"+fieldValue1+"' and "+fieldName2+"='"+fieldValue2+"'";
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(query);
		return (rs.next()); 
	}
	
	/**
		Use for local testing and debugging
	*/
	public static void main(String[] args){
	try{
			DBConnect dbc=new DBConnect();
//			boolean retFlag=dbc.isExisting("lab_users","username","'admin'");
//			dbc.closeConnection();
//			System.out.println("create:"+retFlag);
	}catch(Exception e){
		e.printStackTrace();
	}
	
	}
	
}	
	
	
	
	
