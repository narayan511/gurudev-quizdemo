<%@ page import="java.util.*,com.et.lab.*" %>

<%
String user=(String)session.getAttribute("user");
if(user==null){
		response.sendRedirect("login.jsp");
	}else{
		session.setAttribute("user",user);
	}

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
          <td width="15"><img src="images/bul.gif" width="15" height="15"></td>
          <td class="buttons" colspan="2"><a href="userguide.htm" target="_blank">Help</a></td>
        </tr>
      </table>
    </td>
    <td height="95%" valign="top" class="mainbk" width="85%"> 
      <table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr> 
          <td class="sitetext" valign="bottom"> 
            <p>&nbsp;</p>
          </td>
        </tr>
        <tr> 
          <td class="sitetext" valign="middle"> 
            <form name="form1" method="post" action="formcontroller.jsp">
              <table width="70%" border="1" cellspacing="0" cellpadding="5" bordercolor="#336699" background="images/tbg.gif" height="143">
                <tr> 
                  <td valign="top" height="144"> <b><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="3"> 
                    <%
String formName=(request.getParameter("formName")==null)?"null":request.getParameter("formName");
Question quebean=new Question();
String[] queList=quebean.getQuestionCollection(formName); 
%>
                    For Form </font><font color="#FFFF66"><font color="#168FA9"> 
                    ::</font><%=formName%> </font></b> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="5">
                      <tr> 
                        <td bgcolor="#AEC9E3"> 
                          <table width="102%" border="0" cellpadding="0" background="images/tbg.gif" cellspacing="5" height="95">
                            <tr> 
                              <td colspan="3" align="right"> 
                                <div align="left"><font color=#FFFF99><b> 
                                  <%
String msg=(request.getParameter("msg")==null)?"":request.getParameter("msg");
out.println(msg);		  
%>
                                  </b> </font></div>
                              </td>
                            </tr>
                            <tr> 
                              <td width="40%" align="right"><b><font color="#EFF8F8" face="Verdana, Arial, Helvetica, sans-serif" size="2">Select 
                                Question tag</font></b></td>
                              <td colspan="2"> 
                                <select name="queTag">
                                  <% 
								for(int i=0;i<queList.length;i++){
								%>
                                  <option value="<%=queList[i]%>" selected><%=queList[i]%></option>
                                  <% 
									}//end of for loop
								%>
                                </select>
                                <input type="hidden" name="formName" value='<%=formName%>'>
                                <input type="hidden" name="activityname" value="createquestion">
                              </td>
                            </tr>
                            <tr> 
                              <td width="40%" align="right"><b></b></td>
                              <td colspan="2">&nbsp; </td>
                            </tr>
                            <tr align="center"> 
                              <td width="40%" height="5"> 
                                <input type="submit" name="button" value="Modify Question">
                              </td>
                              <td width="27%" height="5"> 
                                <input type="submit" name="button" value="Add Question">
                              </td>
                              <td width="33%" height="5"> 
                                <input type="submit" name="button" value="Remove Question">
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
