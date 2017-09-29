<%@ page  language="java" import="java.util.*"%>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy 
session.invalidate(); 
%>

<html>
<head>
<title>ur Experimental Lab for CESO</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="backimages" type="text/css">
<link rel="stylesheet" href="images/text" type="text/css">
<link rel="stylesheet" href="images/text" type="text/css">
<link rel="stylesheet" href="images/backimages" type="text/css">
<script language="JavaScript">
function placeFocus(){
document.form1.user.focus();
}
</script>

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
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="placeFocus();">
<table border="0" cellspacing="0" cellpadding="0" align="center" width="100%" height="100%">
  <tr valign="top"> 
    <td class="header" height="64" colspan="2"> <font color="#FFFFFF"><img src="images/duke.gif" width="400" height="59"></font></td>
  </tr>
  <tr> 
    <td class="butbkimag" valign="top" width="15%" height="531"> 
      <table width="100%" border="0" cellspacing="2" cellpadding="2" align="left">
        <tr> 
          <td width="15"><img src="images/bul.gif" width="15" height="15"></td>
          <td class="buttons" colspan="2"><a href="usermgt.jsp">User Mgt</a></td>
        </tr>
        <tr> 
          <td width="15"><img src="images/bul.gif" width="15" height="15"></td>
          <td class="buttons"><a href="prepareform.jsp">Prepare Form</a></td>
        </tr>
        <tr> 
          <td width="15" height="23"><img src="images/bul.gif" width="15" height="15"></td>
          <td class="buttons" height="23"><a href="modify.jsp">Modify Form</a> 
          </td>
        </tr>
        <tr> 
          <td width="15"><img src="images/bul.gif" width="15" height="15"></td>
          <td class="buttons"><a href="datacollection.jsp">Data Collection</a></td>
        </tr>
        <tr> 
          <td width="15"><img src="images/bul.gif" width="15" height="15"></td>
          <td class="buttons"><a href="queryonform.jsp">Query on Form</a></td>
        </tr>
        <tr> 
          <td width="15"><img src="images/bul.gif" width="15" height="15"></td>
          <td class="buttons" colspan="2"><a href="userguide.htm" target="_blank">Help</a></td>
        </tr>
      </table>
    </td>
    <td valign="top" class="mainbk" width="85%" height="95%"> 
      <table width="59%" border="0" cellspacing="0" cellpadding="0" align="left">
        <tr> 
          <td class="sitetext" valign="bottom" height="21"> 
            <p>&nbsp;</p>
          </td>
        </tr>
        <tr> 
          <td class="sitetext" valign="middle" height="42"> 
            <form name="form1" method="post" action="prepareform.jsp">
              <table width="70%" border="1" cellspacing="0" cellpadding="5" bordercolor="#336699" background="images/tbg.gif" align="center">
                <tr> 
                  <td valign="top"> <font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="4">Login 
                    Page</font><b><font color="#FFFFFF"> <font color="#168FA9">::</font></font></b> 
                    <font color="#F1F874" face="Verdana, Arial, Helvetica, sans-serif" size="3"> 
                    <b> 
                    <% 
	String msg=(request.getParameter("msg")==null)?"":request.getParameter("msg");
	out.println(msg);
%>
                    </b> </font> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="5">
                      <tr> 
                        <td bgcolor="#AEC9E3"> 
                          <table width="100%" border="0" cellpadding="0" background="images/tbg.gif" cellspacing="5">
                            <tr> 
                              <td width="40%" align="right"><b><font color="#EFF8F8" face="Verdana, Arial, Helvetica, sans-serif" size="2">User 
                                Name</font></b></td>
                              <td width="60%"> 
                                <input type="text" name="user">
                              </td>
                            </tr>
                            <tr> 
                              <td width="40%" align="right"><b><font color="#EFF8F8" face="Verdana, Arial, Helvetica, sans-serif" size="2">Password</font></b></td>
                              <td width="60%"> 
                                <input type="password" name="password">
                              </td>
                            </tr>
                            <tr> 
                              <td width="40%">&nbsp;</td>
                              <td width="60%"> 
                                <input type="submit" name="Submit" value="Submit">
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
      <p>`</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p><br>
      </p>
    </td>
  </tr>
</table>
</body>
</html>
