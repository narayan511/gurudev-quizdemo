<%@ page import="java.util.*,com.et.lab.*" %>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy 

String user=(String)session.getAttribute("user");
if(user==null){
user=(request.getParameter("user")==null)?"null":request.getParameter("user");
String password=(request.getParameter("password")==null)?"":request.getParameter("password");
if(user.equalsIgnoreCase("dukeexplab") && password.equalsIgnoreCase("balpxeekud")){
		session.setAttribute("user",user);
		session.setAttribute("userType","Admin");
	}else{
		Users userbean=new Users();
		if(user.equals("null") || (!userbean.isExisting(user))){
%>
		<jsp:forward page="login.jsp?msg=Enter correct user name"/>
<%
		}else{
		userbean=userbean.getUser(user);
		String userType=userbean.getUserType();
		String pass=userbean.getUserPassword();
		
		if(!password.equalsIgnoreCase(pass)){
%>
	<jsp:forward page="login.jsp?msg=Enter correct password"/>
<%
	}//end of password if
		session.setAttribute("user",user);
		session.setAttribute("userType",userType);

		if(!userType.equalsIgnoreCase("Admin")){
			response.sendRedirect("datacollection.jsp");
		}//end of usertype if
	}//end of else
	}//end of upper else
}//end of upper if
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
<table border="0" cellspacing="0" cellpadding="0" align="center" width="100%" height="100%">
  <tr valign="top"> 
    <td class="header" height="64" colspan="2"> <font color="#FFFFFF"><img src="images/duke.gif" width="400" height="59"></font></td>
  </tr>
  <tr> 
    <td class="butbkimag" valign="top" width="15%"> 
      <table width="100%" border="0" cellspacing="2" cellpadding="2" align="left">
        <tr> 
          <td width="15"><img src="images/bul.gif" width="15" height="15"></td>
          <td class="buttons" colspan="2"><a href="usermgt.jsp">User Mgt</a></td>
        </tr>
        <tr> 
          <td width="15"><img src="images/bul.gif" width="15" height="15"></td>
          <td class="buttons" colspan="2"><a href="prepareform.jsp">Prepare Form</a></td>
        </tr>
        <tr> 
          <td width="15">&nbsp;</td>
          <td class="buttons" width="12" align="right" valign="top"><b>&gt;</b></td>
          <td class="buttons" width="122"> <a href="createform.jsp">Create New 
            Form</a></td>
        </tr>
        <tr> 
          <td width="15">&nbsp;</td>
          <td class="buttons" width="12" align="right" valign="top"><b>&gt;</b></td>
          <td class="buttons" width="122"><a href="selectform.jsp">Select Existing 
            Form</a></td>
        </tr>
        <tr> 
          <td width="15"><img src="images/bul.gif" width="15" height="15"></td>
          <td class="buttons" colspan="2"><a href="modify.jsp">Modify Form</a> 
          </td>
        </tr>
        <tr> 
          <td width="15"><img src="images/bul.gif" width="15" height="15"></td>
          <td class="buttons" colspan="2"><a href="datacollection.jsp">Data Collection</a></td>
        </tr>
        <tr> 
          <td width="15"><img src="images/bul.gif" width="15" height="15"></td>
          <td class="buttons" colspan="2"><a href="queryonform.jsp">Query on Form</a></td>
        </tr>
        <tr> 
          <td width="15" height="23"><img src="images/bul.gif" width="15" height="15"></td>
          <td class="buttons" colspan="2" height="23"><a href="login.jsp">Logout</a></td>
        </tr>
        <tr> 
          <td width="15" height="23"><img src="images/bul.gif" width="15" height="15"></td>
          <td class="buttons" colspan="2" height="23"><a href="userguide.htm" target="_blank">Help</a></td>
        </tr>
      </table>
    </td>
    <td height="95%" valign="top" class="mainbk" width="85%"> 
      <p>&nbsp;</p>
      <table width="97%" border="0" cellspacing="0" cellpadding="1" align="center" height="8">
        <tr> 
          <td bgcolor="#336699"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#D8E4F1">
              <tr valign="middle"> 
                <td class="sitetext" height="20" bgcolor="#336699" width="23%"> 
                  <p><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#D8E4F1">&nbsp;PREPARE 
                    FORM</font></b></p>
                </td>
                <td class="sitetext" height="16" bgcolor="#336699" width="77%"><font color=#FFFF99> 
                  <b> 
                  <%
	String msg=(request.getParameter("msg")==null)?"":"Your Form is saved !! ";
	out.println(msg);		  
%>
                  </b></font></td>
              </tr>
              <tr> 
                <td class="sitetext" valign="bottom" colspan="2">&nbsp; </td>
              </tr>
              <tr valign="middle"> 
                <td class="sitetext" colspan="2"> 
                  <p><font face="Verdana, Arial, Helvetica, sans-serif" size="3">Step 
                    :</font></p>
                </td>
              </tr>
              <tr valign="middle"> 
                <td class="sitetext" colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="3">1)Create 
                  a new Form or Select existing Form</font></td>
              </tr>
              <tr valign="middle"> 
                <td class="sitetext" colspan="2">&nbsp;</td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
