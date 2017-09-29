<%@ page import="java.util.*,com.et.lab.*" %>
<jsp:useBean id = "databean" class="com.et.lab.DataCollection" scope="page" />

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy 

//Retriving information from session 
String user=(String)session.getAttribute("user");
ArrayList queTagList=(ArrayList)session.getAttribute("queTagList");
Integer totalQueTemp=(Integer)session.getAttribute("totalque");
int totalQue=totalQueTemp.intValue();
String number=(String)session.getAttribute("number");

//getting request parameter
String formName=(request.getParameter("formName")==null)?"":request.getParameter("formName");
String button=(request.getParameter("Submit")==null)?"":request.getParameter("Submit");
String queTag=(request.getParameter("queTag")==null)?"":request.getParameter("queTag");
String language=(request.getParameter("language")==null)?"null":request.getParameter("language");
String flag=(request.getParameter("flag")==null)?"true":request.getParameter("flag");

//following variables are used for first time insert only..
String country="";
String age="";
String gender="";
String year="";
String speciality="";
String noOfArticle="";

if(flag.equals("true")){
	age=(request.getParameter("age")==null)?"":request.getParameter("age");
	year=(request.getParameter("year")==null)?"":request.getParameter("year");
	gender=(request.getParameter("gender")==null)?"":request.getParameter("gender");
	country=(request.getParameter("country")==null)?"":request.getParameter("country");
	speciality=(request.getParameter("speciality")==null)?"":request.getParameter("speciality");
	noOfArticle=(request.getParameter("noOfArticle")==null)?"":request.getParameter("noOfArticle");
}

if(button.equalsIgnoreCase("Confirm Answer")){
%>
<jsp:setProperty name="databean" property="*" />
<%
String result=databean.doDataCollection();
//System.out.println("Result:"+result);
}

if(user==null || formName.equals("null") || language.equals("null"))
	response.sendRedirect("login.jsp");
else
	session.setAttribute("user",user);

//getting qid to remove from que tag list collection
int queId=(request.getParameter("queId")==null)?-1:Integer.parseInt(request.getParameter("queId"));

if(queTagList.size()==1){
	if(queTagList.contains(queTag)){ 
		queTagList.remove(queId);
		response.sendRedirect("formmessage.jsp?msg=testover");
		return;
	}
}

if(queId>-1){
	if(queTagList.contains(queTag)){ 
		queTagList.remove(queId);
	}
}

int queNumber=totalQue-queTagList.size()+1;
queId=(new Random()).nextInt(queTagList.size());
queTag=(String)queTagList.get(queId);

//setting question from queTag and formName
Question quebean=new Question();
quebean=quebean.getQuestion(formName,queTag);

%>

<html>
<head>
<title>ur Experimental Lab for CESO</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="backimages" type="text/css">
<link rel="stylesheet" href="images/text" type="text/css">
<link rel="stylesheet" href="images/text" type="text/css">
<link rel="stylesheet" href="images/backimages" type="text/css">
<STYLE type="text/css">
<!--
A:hover { color:FFFFFF }
a:hover { color:CCCCCC; text-decoration:underline }
a { color:FFFFFF; text-decoration:none }
-->
</STYLE>
<meta name="Description" content="CESO Duke,Ultimate Research,Ricardo Pietrobon,Center for Excellence in Surgical Outcomes">
<meta name="Keywords" content="CESO Duke,Ultimate Research,Ricardo Pietrobon,Center for Excellence in Surgical Outcomes">
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form method="POST" action="viewquestion.jsp">
<input type="hidden" name="formName" value="<%=formName%>"> 
<input type="hidden" name="language" value="<%=language%>"> 
<input type="hidden" name="queId" value="<%=queId%>"> 
<input type="hidden" name="number" value="<%=number%>">	
<input type="hidden" name="queTag" value="<%=queTag%>">	
<input type="hidden" name="flag" value="false">	

<% 
if(flag.equalsIgnoreCase("true")){
%>
<input type="hidden" name="age" value="<%=age%>">	
<input type="hidden" name="year" value="<%=year%>">	
<input type="hidden" name="gender" value="<%=gender%>">	
<input type="hidden" name="country" value="<%=country%>">	
<input type="hidden" name="speciality" value="<%=speciality%>">	
<input type="hidden" name="noOfArticle" value="<%=noOfArticle%>">	
<% }//end of if..flag

%>

  <table border="0" cellspacing="0" cellpadding="0" align="center" width="100%" height="100%">
    <tr valign="top"> 
      <td class="header" height="64" colspan="2"> <font color="#FFFFFF"><img src="images/duke.gif" width="400" height="59"></font></td>
    </tr>
    <tr> 
      <td class="butbkimag" valign="top" width="15%"> 
        <table width="98%" border="0" cellspacing="2" cellpadding="2" align="center">
        </table>
      </td>
      <td height="95%" valign="top" bgcolor="#E2EDFE" width="992"> 
        <table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
          <tr> 
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td bgcolor="#336699" align="right"><font color="#FFFFFF"><%=queNumber%> 
              of <%=totalQue%></font></td>
          </tr>
          <tr> 
            <td width="85%" height="95%"> 
              <table width="100%" bordercolor="#336699" cellpadding="1" border="1">
                <tr> 
                  <td width="11%" class="sitetext" bgcolor="#336699" height="30"> 
                    <font color="#FFFFFF">Question # </font></td>
                  <td colspan="2" class="sitetext" width="89%" height="30"> <%=queNumber%> 
                  </td>
                </tr>
                <tr> 
                  <td colspan="3" class="sitetext" bgcolor="#FFFFFF"> 
                    <pre><%=(language.equals("one")?quebean.getQueInFirstLang():quebean.getQueInSecondLang())%></pre>
                  </td>
                </tr>
                <% 
String uploadFileName=quebean.getUploadFileName();
if(!(uploadFileName.equals("null") || uploadFileName.equals("")))
	{
%>
                <tr> 
                  <td colspan="3" class="sitetext">&nbsp;</td>
                </tr>
                <tr> 
                  <td colspan="3" class="sitetext" bgcolor="#FFFFFF" align="center"><IMG SRC="upload/<%=uploadFileName%>" BORDER="0" ALT="No Image"></td>
                </tr>
                <% 
	} //end of if
%>
                <tr> 
                  <td colspan="3" class="sitetext">&nbsp;</td>
                </tr>
                <%
String answerChoice=quebean.getAnswerChoice();
boolean choice=(answerChoice.equals("S")||answerChoice.equals("M"));
String[] optionText=new String[5];

if(choice && language.equals("one"))
	optionText=quebean.getOptionFirstLangText();

if(choice && language.equals("two"))
	optionText=quebean.getOptionSecondLangText();

%>
                <tr> 
                  <td colspan="3" class="sitetext" bgcolor="#336699"><font color="#FFFFFF"> 
                    <%= choice ?" Select your Answer":" Type your Answer"%> </font></td>
                </tr>
                <%
// System.out.println("optiontextlength:"+optionText[0]);
if(choice){
	for(int i=0;i<optionText.length;i++){
		if(optionText[i].length()>0){
%>
                <tr bgcolor="#F8FAE7"> 
                  <td width="11%" class="sitetext" align="center" bgcolor="#F7F5EA"> 
                    <%=(i+1)%>.&nbsp;&nbsp; 
                    <% if(answerChoice.equals("S")){ %>
                    <input type="radio" name="answerText" value="<%=(i+1)%>">
                    <%}else{%>
                    <input type="checkbox" name="answerOption" value="<%=(i+1)%>">
                    <input type="hidden" name="answerPattern" value="<%=(i+1)%>">
                    <%}//end of else%>
                  </td>
                  <td colspan="2" class="sitetext" width="89%" bgcolor="#F7F5EA"> 
                    <%=optionText[i]%></td>
                </tr>
                <%
		}//end of if
	}//end of for loop
}//end of choice if

if(answerChoice.equals("T")){

%>
                <tr align="center"> 
                  <td colspan="3" class="sitetext"> 
                    <textarea name="answerText" wrap="VIRTUAL" cols="100" rows="10"></textarea>
                  </td>
                </tr>
                <%
}//end of text option
%>
                <tr> 
                  <td colspan="3">&nbsp; </td>
                </tr>
                <tr align="center"> 
                  <td colspan="3" bgcolor="#336699"> 
                    <input type="submit" name="Submit" value="Confirm Answer">
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
