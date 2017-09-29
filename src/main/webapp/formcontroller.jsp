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
String fileName=(String)session.getAttribute("fileName");
session.setAttribute("fileName","");

if(user==null)
	response.sendRedirect("login.jsp");

//know activity
String activityName=(request.getParameter("activityname")==null)?"null":request.getParameter("activityname");

if(activityName.equalsIgnoreCase("createform")){
String formName=(request.getParameter("formName")==null)?"":request.getParameter("formName");
String language2=(request.getParameter("language2")==null)?"":request.getParameter("language2");
String button=(request.getParameter("button")==null)?"":request.getParameter("button");

	if(button.equalsIgnoreCase("Remove Form")){
	formbean=formbean.getForm(formName);
	formbean.deleteForm();
%>
	<jsp:forward page="selectform.jsp" />
<%
	}

	if(button.equalsIgnoreCase("Add Question")){
%>
	
	<jsp:forward page="addquestion.jsp">
		<jsp:param name="formName" value="<%=formName%>"/>
	</jsp:forward>
	
<%
	}

	if(button.equalsIgnoreCase("Modify Language")){
%>

	<jsp:forward page="modifylanguage.jsp">
		<jsp:param name="formName" value="<%=formName%>"/>
	</jsp:forward>


<%
	}
	//now we can set formbean property
%>
	<jsp:setProperty name="formbean" property="*" />
<% 
	//if modify click then first modify form's language and forward to selectform page
	if(button.equalsIgnoreCase("Modify")){
		formbean.modifyFormLanguage();
%>
		<jsp:forward page="selectform.jsp"/>
<%
	}//end of modify

	//now allow to create new form
	String result=formbean.createForm();
	if(result.equalsIgnoreCase("created")){ 
%>
	<jsp:forward page="selectform.jsp" />

<% 
	}else{ //else i.e form is existing 
%>

	<jsp:forward page="createform.jsp">
		<jsp:param name="msg" value="existing"/>
		<jsp:param name="formName" value="<%=formName%>"/>
	</jsp:forward>
<%	
	} //end of else 
}//end of create form activity

if(activityName.equalsIgnoreCase("createquestion")){
	String button=(request.getParameter("button")==null)?"":request.getParameter("button");
	String formName=(request.getParameter("formName")==null)?"":request.getParameter("formName");
	String queTag=(request.getParameter("queTag")==null)?"":request.getParameter("queTag");

	if(queTag.length()==0 && (!button.equalsIgnoreCase("Quit Without Saving"))){ %>
	<jsp:forward page="formmessage.jsp?msg=one" />
<%
	}

	if(button.equalsIgnoreCase("Remove Question")){
	formque=formque.getQuestion(formName,queTag);
	formque.deleteQuestion();
%>
	<jsp:forward page="modifycreateque.jsp">
	<jsp:param name="formName" value="<%=formName%>"/>
	</jsp:forward>
<%
	}//end of Remove question

	if(button.equalsIgnoreCase("Modify Question")){
%>
	<jsp:forward page="modifyquestion.jsp">
	<jsp:param name="formName" value="<%=formName%>"/>
	<jsp:param name="queTag" value="<%=queTag%>"/>
	<jsp:param name="activityname" value="createquestion"/>
	</jsp:forward>
<%
	}	

	if(button.equalsIgnoreCase("Add Question")){
%>
	<jsp:forward page="addquestion.jsp?formName=<%=formName%>" />
<%
	}//end of add question
	
	if(button.equalsIgnoreCase("Update Question")){
%>
	<jsp:setProperty name="formque" property="*" />
<% 
	if(!(fileName==null || fileName.equals(""))){
		formque.reNameUploadedFileName(path,fileName);
//		System.out.println("update image:"+fileName);
	}

	String result=formque.updateQuestion();
	
	if(result.equalsIgnoreCase("updated")){
%>
	<jsp:forward page="modifycreateque.jsp">
	<jsp:param name="formName" value="<%=formName%>"/>
	<jsp:param name="msg" value="Question has been modified. You may select another question !!"/>
	</jsp:forward>
<%	
	}//end of updated if
	
	}//end of update question
	
	if(button.equalsIgnoreCase("Quit Without Saving")){
%>
	<jsp:forward page="modifycreateque.jsp?formName=<%=formName%>" />
<%
	}//end of quit w/o saving
%>

	<jsp:setProperty name="formque" property="*" />

<% 
	if(!(fileName==null || fileName.equals(""))){
		formque.reNameUploadedFileName(path,fileName);
	}

	String result=formque.createQuestion();

	if(button.equalsIgnoreCase("Add More Question")&& result.equalsIgnoreCase("created")){
%>
	<jsp:forward page="addquestion.jsp">
	<jsp:param name="formName" value="<%=formque.getFormName()%>"/>
	<jsp:param name="formId" value="<%=formque.getFormId()%>"/>
	</jsp:forward>
<%	
	}else if(result.equalsIgnoreCase("existing")){ %>
	<jsp:forward page="formmessage.jsp?msg=one" />
<%	
	}else{//quit with saving and show all quetag for further modification
%>
	<jsp:forward page="modifycreateque.jsp" >
	<jsp:param name="formName" value="<%=formque.getFormName()%>"/>
	<jsp:param name="msg" value="Form is saved !!"/>
	</jsp:forward>
<%	}//end of else

}//end of create question activity


if(activityName.equalsIgnoreCase("updatequestion")){
%>
<jsp:setProperty name="formque" property="*" />
<% 
	if(!(fileName==null || fileName.equals(""))){
		formque.reNameUploadedFileName(path,fileName);
//		System.out.println("update image:"+fileName);
	}

	String result=formque.updateQuestion();
	
	if(result.equalsIgnoreCase("updated")){
%>
	<jsp:forward page="modifyselectque.jsp">
	<jsp:param name="formName" value="<%=formque.getFormName()%>"/>
	<jsp:param name="msg" value="Question has been modified. You may select another question !!"/>
	</jsp:forward>
<%	
	}//end of updated if
}//end of update question activity
%>