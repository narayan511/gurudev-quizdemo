<%@ page import="java.util.*" %>
<jsp:useBean id = "formbean" class="com.et.lab.Form" scope="page" />
<jsp:useBean id = "formque" class="com.et.lab.Question" scope="page" />

<%
//response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy 

//checking session 
String user=(String)session.getAttribute("user");
String path=getServletConfig().getServletContext().getRealPath("");

if(user==null)
	response.sendRedirect("login.jsp");

//know activity
String activityName=(request.getParameter("activityName")==null)?"null":request.getParameter("activityName");

if(activityName.equalsIgnoreCase("modifyform")){
String formName=(request.getParameter("formName")==null)?"":request.getParameter("formName");
String button=(request.getParameter("button")==null)?"":request.getParameter("button");

if(button.equalsIgnoreCase("Next >>")){
%>
	<jsp:forward page="modifyselectque.jsp">
	<jsp:param name="formName" value="<%=formName%>"/>
	</jsp:forward>
<%
	}//end of Next >>

if(button.equalsIgnoreCase("Remove Form")){
	formbean=formbean.getForm(formName);
	formbean.deleteForm();
%>
	<jsp:forward page="modify.jsp" />
<%
	}//end of Remove Form

}//end of modify form activity


if(activityName.equalsIgnoreCase("modifyquestion")){
	String button=(request.getParameter("button")==null)?"":request.getParameter("button");
	String formName=(request.getParameter("formName")==null)?"":request.getParameter("formName");
	String queTag=(request.getParameter("queTag")==null)?"":request.getParameter("queTag");

	if(button.equalsIgnoreCase("View Question")){
%>
	<jsp:forward page="modifyquestion.jsp">
	<jsp:param name="formName" value="<%=formName%>"/>
	<jsp:param name="queTag" value="<%=queTag%>"/>
	</jsp:forward>
<%
	}	

	if(button.equalsIgnoreCase("Remove Question")){
	formque=formque.getQuestion(formName,queTag);
	formque.deleteQuestion();
%>
	<jsp:forward page="modifyselectque.jsp">
	<jsp:param name="formName" value="<%=formName%>"/>
	<jsp:param name="activityName" value="modifyquestion"/>
	</jsp:forward>
<%
	}//end of Remove question
	
}//end of modify question activity

%>
