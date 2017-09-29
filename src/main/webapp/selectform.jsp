<%@ page import="java.util.*" %>
<jsp:useBean id = "formbean" class="com.et.lab.Form" scope="page" />
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
      <table width="98%" border="0" cellspacing="2" cellpadding="2" align="center">
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
          <td width="15"><img src="images/bul.gif" width="15" height="15"></td>
          <td class="buttons" colspan="2"><a href="userguide.htm" target="_blank">Help</a></td>
        </tr>
      </table>
    </td>
    <td height="95%" valign="top" class="mainbk" width="85%"> 
      <table width="98%" border="0" cellspacing="0" cellpadding="0" align="center" height="90">
        <tr> 
          <td class="sitetext" valign="bottom" height="21"> 
            <p>&nbsp;</p>
          </td>
        </tr>
        <tr> 
          <td class="sitetext" valign="middle" height="42"> 
            <form name="form1" method="post" action="formcontroller.jsp">
              <table width="54%" border="1" cellspacing="0" cellpadding="5" bordercolor="#336699" background="images/tbg.gif">
                <tr> 
                  <td valign="top" height="137"> 
                    <input type="hidden" name="activityname" value="createform">
                    <b><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="3">Select 
                    Existing Form</font><font color="#FFFFFF"><font color="#168FA9"> 
                    ::</font></font></b> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="5">
                      <tr> 
                        <td bgcolor="#AEC9E3"> 
                          <table width="100%" border="0" cellpadding="0" background="images/tbg.gif" cellspacing="5" height="100%">
                            <tr> 
                              <td width="34%" align="right"><b><font color="#EFF8F8" face="Verdana, Arial, Helvetica, sans-serif" size="2">Select 
                                Form </font></b></td>
                              <td colspan="2"> 
                                <select name="formName">
                                 <% 
	String[] formList=formbean.getFormCollection(); 
	for(int i=0;i<formList.length;i++){
%>
                                  <option value="<%=formList[i]%>" selected><%=formList[i]%></option>
                                  <%
	}//end of for loop
%>
                                </select>
                              </td>
                            </tr>
                            <tr> 
                              <td width="34%" align="right"><b></b></td>
                              <td colspan="2">&nbsp; </td>
                            </tr>
                            <tr> 
                              <td width="34%"> 
                                <div align="center"> 
                                  <input type="submit" name="button" value="Add Question">
                                </div>
                              </td>
                              <td align="center" width="39%"> 
                                <input type="submit" name="button" value="Modify Language">
                              </td>
                              <td align="center" width="27%"> 
                                <input type="submit" name="button" value="Remove Form">
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
            <p>&nbsp;</p>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
