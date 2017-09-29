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
document.myform.userName.focus();
}

function checkValue(){
	var pno=document.myform.userName.value;
	
	if(pno==""|| pno==null || pno.charAt(0) == ' '){
		alert("Please Enter User name !");
		document.myform.userName.focus();
		return false;
	}

	pno=document.myform.userPassword.value;
	
	if(pno==""|| pno==null || pno.charAt(0) == ' '){
		alert("Please Enter User password !");
		document.myform.userPassword.focus();
		return false;
	}

	var pno1=document.myform.reEnterPassword.value;

	if(pno1!=pno){
		alert("Please re-enter password correctly !");
		document.myform.reEnterPassword.value="";
		document.myform.reEnterPassword.focus();
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
      <table width="87%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr> 
          <td class="sitetext" valign="bottom" height="21"> 
            <p>&nbsp;</p>
          </td>
        </tr>
        <tr> 
          <td class="sitetext" valign="middle" height="42"> 
            <form name="myform" method="post" action="usercontroller.jsp" onSubmit="return checkValue();">
              <table width="60%" border="1" cellpadding="0" bordercolor="#336699" bgcolor="#EBEBEB" height="244">
                <tr bgcolor="#336699" bordercolor="#336699"> 
                  <td colspan="2" class="sitetext" height="28"><b><font color="#E1F0FF">&nbsp;Quick 
                    Registration ::</font></b></td>
                </tr>
                <tr bordercolor="#336699"> 
                  <td colspan="2" class="sitetext" height="16">&nbsp; </td>
                </tr>
                <tr> 
                  <td width="38%" class="sitetext" height="28" bordercolor="#336699"> 
                    <b>&nbsp;User Name </b></td>
                  <td width="62%" class="sitetext" height="28" bordercolor="#336699"> 
                    <input type="text" name="userName">
                  </td>
                </tr>
                <tr> 
                  <td width="38%" height="28"><b>&nbsp;Password</b></td>
                  <td width="62%" height="28"> 
                    <input type="password" name="userPassword">
                  </td>
                </tr>
                <tr> 
                  <td width="38%" height="28"><b>&nbsp;Re-Type Password</b></td>
                  <td width="62%" height="28"> 
                    <input type="password" name="reEnterPassword">
                  </td>
                </tr>
                <tr> 
                  <td width="38%" class="sitetext" height="24"> <b>&nbsp;User 
                    Type</b></td>
                  <td width="62%" class="sitetext" height="28"> 
                    <select name="userType">
                      <option value="Admin" selected>Admin</option>
                      <option value="User">User</option>
                    </select>
                  </td>
                </tr>
                <tr> 
                  <td colspan="2" align="center" height="16">&nbsp; </td>
                </tr>
                <tr> 
                  <td colspan="2" align="center" height="28"> 
                    <input type="submit" name="Submit" value="Submit">
                  </td>
                </tr>
              </table>
            </form>
            <p>&nbsp; </p>
          </td>
        </tr>
      </table>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
    </td>
  </tr>
</table>
</body>
</html>
