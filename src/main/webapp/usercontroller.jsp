<%@ page import="java.util.*" %>
<jsp:useBean id = "userbean" class="com.et.lab.Users" scope="page" />

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy 

//checking session 
String user=(String)session.getAttribute("user");

if(user==null)
	response.sendRedirect("login.jsp");

String button=(request.getParameter("Submit")==null)?"":request.getParameter("Submit");
String userName=(request.getParameter("userName")==null)?"":request.getParameter("userName");

if(button.equalsIgnoreCase("Submit")){
%>
<jsp:setProperty name="userbean" property="*" />
<% 
String result=userbean.createUser();
	if(result.equalsIgnoreCase("created")){
%>

 <jsp:forward page="usermgt.jsp" > 
          <jsp:param name="msg" value="created" /> 
          <jsp:param name="userName" value="<%=userName%>" />
 </jsp:forward>
 <% 
	}else{ 
%>

<jsp:forward page="usermgt.jsp" > 
          <jsp:param name="msg" value="existing" /> 
          <jsp:param name="userName" value="<%=userName%>" />
 </jsp:forward>

<%
	} //end of else

}//end of create new user

if(button.equalsIgnoreCase("Create New User")){
%>
	<jsp:forward page="createnewuser.jsp" />
<%
}

if(button.equalsIgnoreCase("Delete User")){
String result=userbean.deleteUser(userName);
	if(result.equals("deleted")){	
%>

<jsp:forward page="usermgt.jsp" > 
          <jsp:param name="msg" value="deleted" /> 
          <jsp:param name="userName" value="<%=userName%>" />
 </jsp:forward>

<%
	}else{
%>
	<jsp:forward page="error.jsp" />
<%
	}
}

if(button.equalsIgnoreCase("reset")){
String password=(request.getParameter("newPassword")==null)?"":request.getParameter("newPassword");
String result=userbean.setPassword(userName,password);
%>
	<jsp:forward page="usermgt.jsp"> 
	<jsp:param name="msg" value="reset"/>
	<jsp:param name="userName" value="<%=userName%>"/>
	<jsp:param name="result" value="<%=result%>"/>
	</jsp:forward>

<%
}

if(button.equalsIgnoreCase("Reset Password")){
userbean=userbean.getUser(userName);
String password=userbean.getUserPassword();
%>
	<jsp:forward page="resetpassword.jsp"> 
	<jsp:param name="userName" value="<%=userName%>"/>
	<jsp:param name="userPassword" value="<%=password%>"/>
	</jsp:forward>
<%
}

if(button.equalsIgnoreCase("Get Password")){
userbean=userbean.getUser(userName);
String password=userbean.getUserPassword();
%>
	<jsp:forward page="usermgt.jsp"> 
	<jsp:param name="msg" value="password"/>
	<jsp:param name="userName" value="<%=userName%>"/>
	<jsp:param name="userPassword" value="<%=password%>"/>
	</jsp:forward>
<%
}

%>