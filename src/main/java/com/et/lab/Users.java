package com.et.lab;

import java.sql.*;
import java.io.*;
import java.util.*;
import java.sql.*;

/**
This class represent data for the lab_users database and have all 
methods related to access Users object. 
*/
public class Users 
{
private int uno;
private String userName; 
private String userPassword;
private String userType;

	/**
		Users constructor
	*/
	public Users(){
	}
	
	public Users(String userName,String userPassword,String userType){
		this.userName=userName;
		this.userPassword=userPassword;
		this.userType=userType;
		createUser();
	}

	public void setUsers(String userName){
	
	
	}
///////////////////////////////////////////////////////////
// get-set methods for the bean 
///////////////////////////////////////////////////////////

	public int getUno() {
		return uno;
	}
	
	public void setUno(int uno) {
		this.uno =uno;
	}

	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}
	
	public void setUserPassword(String userPassword) {
		this.userPassword =userPassword;
	}

	public String getUserType() {
		return userType;
	}
	
	public void setUserType(String userType) {
		this.userType = userType;
	}


	/**
	Making data compitible with Database
	*/	
	private void setData(){
		userName = getCompitibleString(userName);
		userPassword = getDBCompitibleString(userPassword);
		userType = getDBCompitibleString(userType);
	}

///////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////
/// Business methods
///////////////////////////////////////////////////////////////

	/**
		Method used to create a User and inserting data into database.
		Setting uno.
	*/
	public String createUser(){
		String retString="";
		try{
			setData();//making data compitible with Database.
			DBConnect dbc=new DBConnect();
			Connection con=dbc.getConnection();
			Statement st=con.createStatement();
			if(!dbc.isExisting("lab_users","username","'"+userName+"'")){
				String query="insert into lab_users(username,password,usertype) values ('"+userName+"','"+userPassword+"','"+userType+"')";
				st.executeUpdate(query);
				retString="created";
			}else{
				retString="existing";
			}

			st.close();
			con.close();
			dbc.closeConnection();
			}catch(Exception e){
				System.out.println("Error in createUser:"+e);
			}
		return retString;
	}

	public String setPassword(String username,String password){
		String retString="";
		userPassword=password;
		userName=username;
		try{
			DBConnect dbc=new DBConnect();
			Connection con=dbc.getConnection();
			Statement st=con.createStatement();
			String query="update lab_users set password='"+userPassword+"' where username='"+userName+"'";
			int update=st.executeUpdate(query);
			retString=(update>0)?"reset successfully":"not reset,try again"; 
			st.close();
			con.close();
			dbc.closeConnection();
			}catch(Exception e){
				System.out.println("Error in setPassword:"+e);
			}
		return retString;
	
	
	}
	/**
		Method used to check existing User.
	*/
	public boolean isExisting(String username){
		boolean retFlag=false;
		try{
			DBConnect dbc=new DBConnect();
			Connection con=dbc.getConnection();
			retFlag=dbc.isExisting("lab_users","username","'"+username+"'");
			con.close();
			dbc.closeConnection();
			}catch(Exception e){
				System.out.println("Error in isExisting :"+e);
				e.printStackTrace();
			}
		return retFlag;
	}

	/**
		Get User collection to display all existing form.
	*/
	public String[] getUserCollection(){
		ArrayList arrayList=new ArrayList();
		try{
			DBConnect dbc=new DBConnect();
			Connection con=dbc.getConnection();
			String query="select username from lab_users";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(query);
			while(rs.next()){
				arrayList.add(new String(rs.getString("username")));
			}
			con.close();
			dbc.closeConnection();
			}catch(Exception e){
				System.out.println("Error in getUserCollection:"+e);
			}
			String [] a = new String [0];
		return ((String[])arrayList.toArray(a));
	}

	/**
		setting User object from userName and retrive user object.
	*/
	public Users getUser(String username){
		try{
			DBConnect dbc=new DBConnect();
			Connection con=dbc.getConnection();
			String query="select * from lab_users where username='"+username+"'";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(query);
			while(rs.next()){
				this.uno=rs.getInt("uno");
				this.userName=username;
				this.userPassword=rs.getString("password");
				this.userType=rs.getString("usertype");
			}
			con.close();
			dbc.closeConnection();
			}catch(Exception e){
				System.out.println("Error in getuser:"+e);
			}
		return this;
	}

	/**
		setting User object from userName and retrive user object.
	*/
	public String deleteUser(String username){
		String retString="";
		try{
			DBConnect dbc=new DBConnect();
			Connection con=dbc.getConnection();
			String query="delete from lab_users where username='"+username+"'";
			Statement st=con.createStatement();
			st.executeUpdate(query);
			con.close();
			dbc.closeConnection();
			retString="deleted";
			}catch(Exception e){
				retString="error in delete";
				System.out.println("Error in getuser:"+e);
			}
		return retString;
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
		Users f=new Users();
		System.out.println("user existi:"+f.setPassword("narayan","narayan"));
	}

}
