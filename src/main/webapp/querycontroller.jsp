<%@ page import="java.util.*,com.et.lab.Form" %>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy 

//checking session 
String user=(String)session.getAttribute("user");

if(user==null)
	response.sendRedirect("login.jsp");

//know activity

String formName=(request.getParameter("formName")==null)?"":request.getParameter("formName");
String button=(request.getParameter("button")==null)?"":request.getParameter("button");

if(button.equalsIgnoreCase("View Result")){
%>
	<jsp:forward page="queryresult.jsp">
	<jsp:param name="formName" value="<%=formName%>"/>
	</jsp:forward>
<%
	}//end of View Result

if(button.equalsIgnoreCase("Delete All Data")){
	Form formbean=new Form();
	formbean.deleteFormData(formName);
%>
	<jsp:forward page="queryonform.jsp" />
<%
	}//end of Delete All Data

%>
