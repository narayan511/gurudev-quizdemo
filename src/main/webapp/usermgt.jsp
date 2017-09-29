<%@ page import="com.et.lab.*" %>
<jsp:useBean id = "userbean" class="com.et.lab.Users" scope="page" />

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy 

//checking session 
String user=(String)session.getAttribute("user");

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
          <td class="sitetext" valign="bottom" height="21"> 
            <p>&nbsp;</p>
          </td>
        </tr>
        <tr> 
          <td class="sitetext" valign="top" height="42"> 
            <form name="form1" method="post" action="usercontroller.jsp">
              <table width="77%" border="1" cellspacing="0" cellpadding="5" bordercolor="#336699" background="images/tbg.gif">
                <tr> 
                  <td valign="top"> <font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="4">User 
                    Management</font><b><font color="#FFFFFF"> <font color="#168FA9">::</font></font></b> 
                    <font color="#F1F874" face="Verdana, Arial, Helvetica, sans-serif" size="3"> 
                    <% 
	String userName=(request.getParameter("userName")==null)?"":request.getParameter("userName");
	String password=(request.getParameter("userPassword")==null)?"LOCHA":request.getParameter("userPassword");
	String msg=(request.getParameter("msg")==null)?"":request.getParameter("msg");

	if(msg.equalsIgnoreCase("created")){
		msg="User name - <b>"+userName+"</b> is created successfully !!";
	}

	if(msg.equalsIgnoreCase("reset")){
		String result=(request.getParameter("result")==null)?"":request.getParameter("result");
		msg="For User - <b>"+userName+"</b>, password is "+result+" !!";
	}

	if(msg.equalsIgnoreCase("existing")){
		msg="User name - <b>"+userName+"</b> already exists !!";
	}
	
	if(msg.equalsIgnoreCase("deleted")){
		msg="User name - <b>"+userName+"</b> is deleted successfully !!";
	}
	
	if(msg.equalsIgnoreCase("password")){
		msg="For User <b>"+userName+"</b>, password is <b>"+password+"</b>." ;	
	}
	out.println(msg);
%>
                    </font> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="5">
                      <tr> 
                        <td bgcolor="#AEC9E3"> 
                          <table width="100%" border="0" cellpadding="0" background="images/tbg.gif" cellspacing="5">
                            <tr> 
                              <td width="31%" align="right"><b><font color="#EFF8F8" face="Verdana, Arial, Helvetica, sans-serif" size="2">Select 
                                User Name</font></b></td>
                              <td colspan="3"> 
                                <select name="userName">
                                  <% 
String[] userList=userbean.getUserCollection(); 
for(int i=0;i<userList.length;i++){
%>
                                  <option value="<%=userList[i]%>" selected><%=userList[i]%></option>
                                  <% }//end of for loop
%>
                                </select>
                              </td>
                            </tr>
                            <tr> 
                              <td width="31%" align="right"><b></b></td>
                              <td colspan="3">&nbsp; </td>
                            </tr>
                            <tr align="center"> 
                              <td width="31%"> 
                                <input type="submit" name="Submit" value="Create New User">
                              </td>
                              <td width="19%"> 
                                <input type="submit" name="Submit" value="Delete User">
                              </td>
                              <td width="26%"> 
                                <input type="submit" name="Submit" value="Reset Password">
                              </td>
                              <td width="24%"> 
                                <input type="submit" name="Submit" value="Get Password">
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
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
