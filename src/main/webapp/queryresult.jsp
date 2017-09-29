<%@ page import="java.util.*,com.et.lab.*" %>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy 

String user=(String)session.getAttribute("user");
if(user==null){
		response.sendRedirect("login.jsp");
	}else{
		session.setAttribute("user",user);
	}

String formName=(request.getParameter("formName")==null)?"":request.getParameter("formName");

DataCollection dataCollection=new DataCollection();
int count=dataCollection.getTotalCount(formName);
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
          <td width="15"><img src="images/bul.gif" width="15" height="15"></td>
          <td class="buttons" colspan="2"><a href="login.jsp">Logout</a></td>
        </tr>
        <tr> 
          <td width="15"><img src="images/bul.gif" width="15" height="15"></td>
          <td class="buttons" colspan="2"><a href="userguide.htm" target="_blank">Help</a></td>
        </tr>
      </table>
    </td>
    <td height="95%" valign="top" class="mainbk" width="85%"> 
      <p>&nbsp;</p>
      <table width="97%" border="0" cellspacing="0" cellpadding="1" align="center" height="61" bgcolor="#336699">
        <tr> 
          <td class="sitetext" valign="top" height="83" bordercolor="#336699"> 
            <table width="100%" border="1" cellspacing="0" cellpadding="0" bgcolor="#D8E4F1">
              <tr> 
                <td colspan="2" height="20" bgcolor="#336699"><font size="2" face="Verdana, Arial, Helvetica, sans-serif" color="#D8E4F1"><b>QUERY 
                  RESULT :</b></font></td>
              </tr>
              <tr> 
                <td width="36%" height="20"><font face="Verdana, Arial, Helvetica, sans-serif" size="3">&nbsp;Form 
                  Name</font></td>
                <td width="64%" height="20"> <font face="Verdana, Arial, Helvetica, sans-serif" size="3">&nbsp;<%=formName%></font></td>
              </tr>
              <tr> 
                <td width="36%" height="20"><font face="Verdana, Arial, Helvetica, sans-serif" size="3">&nbsp;Total 
                  Number of people</font></td>
                <td width="64%" height="20"><font face="Verdana, Arial, Helvetica, sans-serif" size="3">&nbsp;<%=count%></font></td>
              </tr>
              <tr> 
                <td colspan="2" height="20"><font size="2" face="Verdana, Arial, Helvetica, sans-serif" color="#D8E4F1"><A HREF="queryonform.jsp"><b><font color="#336699">&lt;&lt;BACK</font></b></a></font></td>
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
