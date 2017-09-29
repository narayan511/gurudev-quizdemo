<%@ page import="java.util.*" %>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy 

String user=(String)session.getAttribute("user");
if(user==null){
user=(request.getParameter("user")==null)?"null":request.getParameter("user");
	if(user.equals("null")){
		response.sendRedirect("login.jsp");
	}else{
		session.setAttribute("user",user);
	}
}
String formName=(request.getParameter("formName")==null)?"":request.getParameter("formName");
String language2=(request.getParameter("language2")==null)?"":request.getParameter("language2");

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
document.myform.formName.focus();
}

function checkValue(){
	var pno=document.myform.formName.value;

	if(pno==""|| pno==null || pno.charAt(0) == ' '){
		alert("Please Enter Form Name !");
		document.myform.formName.focus();
		return false;
	}

	pno=document.myform.language2.value;
	if(pno==""|| pno==null || pno.charAt(0) == ' '){
		alert("Please Enter Language !");
		document.myform.language2.focus();
		return false;
	}
return true;
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
    <td class="butbkimag" valign="top" width="15%"> 
      <table width="100%%" border="0" cellspacing="2" cellpadding="2" align="left">
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
          <td class="sitetext" valign="top"> 
            <p>&nbsp;</p>
          </td>
        </tr>
        <tr> 
          <td class="sitetext" valign="middle"> 
            <form name="myform" method="post" action="formcontroller.jsp" onSubmit="return checkValue();">
              <table width="54%" border="1" cellspacing="0" cellpadding="5" bordercolor="#336699" background="images/tbg.gif">
                <tr> 
                  <td valign="top" height="158"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" height="20">
                      <tr> 
                        <td height="21"><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="4">Create 
                          New Form </font><b><font color="#FFFFFF"> <font color="#168FA9">::</font></font></b> 
                          <input type="hidden" name="activityname" value="createform">
                        </td>
                      </tr>
                    </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="5">
                      <tr> 
                        <td bgcolor="#AEC9E3"> 
                          <table width="100%" border="0" cellpadding="0" background="images/tbg.gif" cellspacing="5">
                            <tr align="left"> 
                              <td colspan="2"><font color=#FFFF99> <b> 
                                <% 
	String msg=(request.getParameter("msg")==null)?"":"Form name already exists !! ";
	out.println(msg);
%>
                                </b></font></td>
                            </tr>
                            <tr> 
                              <td width="45%" align="right"><b><font color="#EFF8F8" face="Verdana, Arial, Helvetica, sans-serif" size="2">Form 
                                Name </font></b></td>
                              <td width="55%"> 
                                <input type="text" name="formName" value="<%=formName%>">
                              </td>
                            </tr>
                            <tr> 
                              <td width="45%" align="right"><b><font color="#EFF8F8" face="Verdana, Arial, Helvetica, sans-serif" size="2">Second 
                                Language</font></b></td>
                              <td width="55%"> 
                                <input type="hidden" name="language1" value="english" >
                                <input type="text" name="language2" value="<%=language2%>">
                              </td>
                            </tr>
                            <tr> 
                              <td width="45%">&nbsp;</td>
                              <td width="55%"> 
                                <input type="submit" name="Submit" value="Create Form">
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
              <p>&nbsp;</p>
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
