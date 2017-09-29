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
    <td class="butbkimag" valign="top" width="15%">&nbsp; </td>
    <td height="95%" valign="top" class="mainbk" width="85%"> 
      <p>&nbsp;</p>
      <table width="96%" border="0" cellspacing="0" cellpadding="1" align="center" height="8">
        <tr> 
          <td bgcolor="#336699"> 
            <table width="100%" border="0" cellspacing="1" cellpadding="1" align="center" bgcolor="#D8E4F1" height="73">
              <tr> 
                <td valign="top" bgcolor="#336699"><span class="sitetext"><b><font color="#D8E4F1" face="Verdana, Arial, Helvetica, sans-serif" size="3"> 
                  &nbsp;Message : </font></b></span></td>
              </tr>
              <tr> 
                <td valign="top"> 
                  <p class="mainbk" align="left"> 
                    <% 
String msg=(request.getParameter("msg")==null)?"":request.getParameter("msg");

	if(msg.equals("one")){
%>
                  </p>
                  <table width="80%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td> <font color="#000099" face="Verdana, Arial, Helvetica, sans-serif" size="3"> 
                        Please change your question tag,It already exists for 
                        this form or it is blank.</font> </td>
                    </tr>
                    <tr> 
                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="3">Click 
                        <a href="#" onClick="window.history.go(-1);"><font color=#FF0000>here</font></a> 
                        to change question tag or Use Browser back button.</font></td>
                    </tr>
                  </table>
                  <% 
	} 
	
	if(msg.equals("testover")){
%>
                  <table width="80%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td> <font color="#000099" face="Verdana, Arial, Helvetica, sans-serif" size="3"> 
                        This evaluation is over. Thanks for your time. </font> 
                      </td>
                    </tr>
                    <tr> 
                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="3">Click 
                        <a href="login.jsp"><font color=#FF0000>here</font></a> 
                        to signout.</font></td>
                    </tr>
                  </table>
                  <%
	}//testover
%>
                </td>
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
