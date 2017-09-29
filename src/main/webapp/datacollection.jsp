<%@ page import="java.util.*" %>
<jsp:useBean id = "formbean" class="com.et.lab.Form" scope="page" />

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy 

String user=(String)session.getAttribute("user");
//String userType=(String)session.getAttribute("userType");

String userType=((String)session.getAttribute("userType")==null)?"admin":(String)session.getAttribute("userType");

if(user==null)
		response.sendRedirect("login.jsp");

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
        <% 
	if(userType.equalsIgnoreCase("Admin")){
%>
        <tr> 
          <td width="15"><img src="images/bul.gif" width="15" height="15"></td>
          <td class="buttons" colspan="2"><a href="usermgt.jsp">User Mgt</a></td>
        </tr>
        <tr> 
          <td width="15"><img src="images/bul.gif" width="15" height="15"></td>
          <td class="buttons"><a href="prepareform.jsp">Prepare Form</a></td>
        </tr>
        <tr> 
          <td width="15"><img src="images/bul.gif" width="15" height="15"></td>
          <td class="buttons"><a href="modify.jsp">Modify Form</a> </td>
        </tr>
        <% } %>
        <tr> 
          <td width="15"><img src="images/bul.gif" width="15" height="15"></td>
          <td class="buttons"><a href="datacollection.jsp">Data Collection</a></td>
        </tr>
        <% 
	if(userType.equalsIgnoreCase("Admin")){
%>
        <tr> 
          <td width="15"><img src="images/bul.gif" width="15" height="15"></td>
          <td class="buttons"><a href="queryonform.jsp">Query on Form</a></td>
        </tr>
        <% } %>
        <tr> 
          <td width="15" height="21"><img src="images/bul.gif" width="15" height="15"></td>
          <td class="buttons" height="21"><a href="login.jsp">Logout</a></td>
        </tr>
        <tr> 
          <td width="15"><img src="images/bul.gif" width="15" height="15"></td>
          <td class="buttons" colspan="2"><a href="userguide.htm" target="_blank">Help</a></td>
        </tr>
      </table>
    </td>
    <td height="95%" valign="top" class="mainbk" width="85%"> 
      <table width="90%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr> 
          <td class="sitetext" valign="bottom" height="21">&nbsp;</td>
        </tr>
        <tr> 
          <td class="sitetext" valign="middle" height="178"> 
            <form name="form1" method="post" action="selectlanguage.jsp">
              <table width="60%" border="1" cellspacing="0" cellpadding="5" bordercolor="#336699" background="images/tbg.gif">
                <tr> 
                  <td valign="top" height="137"> <b><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="3">Data 
                    Collection: Step -1 of 2</font><font color="#FFFFFF"><font color="#168FA9"> 
                    ::</font></font></b> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="5">
                      <tr> 
                        <td bgcolor="#AEC9E3"> 
                          <table width="100%" border="0" cellpadding="0" background="images/tbg.gif" cellspacing="5">
                            <tr> 
                              <td width="49%" align="right"><b><font color="#EFF8F8" face="Verdana, Arial, Helvetica, sans-serif" size="2">Select 
                                Form </font></b></td>
                              <td width="51%"> 
                                <select name="formName">
                                  <% 
String[] formList=formbean.getFormCollection(); 
for(int i=0;i<formList.length;i++){
%>
                                  <option value="<%=formList[i]%>" selected><%=formList[i]%></option>
                                  <% }//end of for loop
%>
                                </select>
                              </td>
                            </tr>
                            <tr> 
                              <td width="49%" align="right"><b></b></td>
                              <td width="51%">&nbsp; </td>
                            </tr>
                            <tr> 
                              <td colspan="2"> 
                                <div align="center"> 
                                  <input type="submit" name="Submit" value="Next >>">
                                </div>
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
            <p>&nbsp; </p>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
