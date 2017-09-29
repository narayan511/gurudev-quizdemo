<%@ page import="java.util.*,com.et.lab.*" %>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy 

String user=(String)session.getAttribute("user");
String userType=(String)session.getAttribute("userType");
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
<script language="JavaScript">

function placeFocus(){
document.myform.formName.focus();
}

function isNumerical(name) {
var theField = eval("myform." +name).value;

	if(isNaN(theField))	{
		alert("Please enter only numeric values, 0-9.");
		eval("myform." +name).value="";
		eval("myform." +name).focus();
		return false;
  	}
}


function checkValue(){
	var pno=document.myform.language.value;

	if(pno==""|| pno==null || pno.charAt(0) == ' '){
		alert("Please Enter Country !");
		document.myform.country.focus();
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
      <table width="98%" border="0" cellspacing="0" cellpadding="0" align="center" height="45">
        <tr> 
          <td class="sitetext" valign="bottom" height="21">&nbsp;</td>
        </tr>
        <tr> 
          <td class="sitetext" valign="middle" height="137"> 
            <%
	String formName=(request.getParameter("formName")==null)?"null":request.getParameter("formName");
	Form formbean=new Form();			
	formbean=formbean.getForm(formName);
	Question quebean=new Question();
	DataCollection dc=new DataCollection();
	int number=dc.getNextId(formName);
	String[] queList=quebean.getQuestionCollection(formName); 
	ArrayList queTagList=new ArrayList();
	for(int i=0;i<queList.length;i++)
		queTagList.add(queList[i]);
	session.setAttribute("queTagList",queTagList);
	session.setAttribute("totalque",new Integer(queTagList.size()));
	session.setAttribute("number",new String(""+number));
%>
            <form name="myform" method="post" action="viewquestion.jsp">
              <input type="hidden" name="formName" value="<%=formName%>">
              <table width="70%" border="1" cellspacing="0" cellpadding="5" bordercolor="#336699" bgcolor="#336699">
                <tr> 
                  <td valign="top" height="347"> <b><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="3">Data 
                    Collection : Step - 2 of 2</font><font color="#FFFFFF"> ::</font></b> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="5">
                      <tr> 
                        <td bgcolor="#336699"> 
                          <table width="100%" border="0" cellpadding="0" cellspacing="5" bgcolor="#E8E8E8">
                            <tr> 
                              <td colspan="3" align="right"> 
                                <div align="left"><b><font color="#0099CC" face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                  </font></b></div>
                              </td>
                            </tr>
                            <tr> 
                              <td width="33%" align="right"><b><font color="#0099CC" face="Verdana, Arial, Helvetica, sans-serif" size="2">Select 
                                Language</font></b></td>
                              <td colspan="2"> <font color="#0099CC"> 
                                <select name="language">
                                  <option value="one" selected><%=formbean.getLanguage1()%></option>
                                  <%		
								
						String lang2=formbean.getLanguage2();						  
						if(!(lang2.equalsIgnoreCase("none"))){
%>
                                  <option value="two"><%=lang2%></option>
                                  <%						} 
%>
                                </select>
                                </font></td>
                            </tr>
                            <tr align="center"> 
                              <td colspan="3"><font color="#0099CC"><b><font color="#666666">Provide 
                                your initial Information</font></b></font></td>
                            </tr>
                            <tr> 
                              <td width="33%" align="right"><b><font color="#0099CC" face="Verdana, Arial, Helvetica, sans-serif" size="2">Age(Yrs)</font></b></td>
                              <td colspan="2"> <font color="#0099CC"> 
                                <input type="text" name="age" value="" maxlength="2" size="3" onChange="isNumerical('age');">
                                </font></td>
                            </tr>
                            <tr> 
                              <td width="33%" align="right"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#0099CC">Experience(Yrs)</font></b></td>
                              <td colspan="2"> <font color="#0099CC"> <b> 
                                <input type="text" name="year" value="" maxlength="2" size="3" onChange="isNumerical('year');">
                                </b></font></td>
                            </tr>
                            <tr> 
                              <td width="33%" align="right"><b><font color="#0099CC" face="Verdana, Arial, Helvetica, sans-serif" size="2">Gender</font></b></td>
                              <td width="29%"> <font color="#0099CC"> 
                                <input type="radio" name="gender" value="Male" checked>
                                <b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Male</font></b></font></td>
                              <td width="38%"> <font color="#0099CC"> 
                                <input type="radio" name="gender" value="Female">
                                <b><font face="Verdana, Arial, Helvetica, sans-serif" size="2">Female</font></b></font></td>
                            </tr>
                            <tr> 
                              <td width="33%" align="right"><b><font color="#0099CC" face="Verdana, Arial, Helvetica, sans-serif" size="2">Country</font></b></td>
                              <td colspan="2"> <font color="#0099CC"> 
                                <input type="text" name="country" value="">
                                </font></td>
                            </tr>
                            <tr> 
                              <td width="33%" align="right"><b><font color="#0099CC" face="Verdana, Arial, Helvetica, sans-serif" size="2">Specialty</font></b></td>
                              <td colspan="2"> <font color="#0099CC"> 
                                <input type="text" name="speciality" value="">
                                </font></td>
                            </tr>
                            <tr align="center"> 
                              <td colspan="3"><b><font color="#0099CC" face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                No. of articles published by you in peer-reviewed</font></b></td>
                            </tr>
                            <tr> 
                              <td width="33%" align="right"><b><font color="#0099CC" face="Verdana, Arial, Helvetica, sans-serif" size="2"> 
                                journals </font></b></td>
                              <td colspan="2"> <font color="#0099CC"> 
                                <input type="text" name="noOfArticle" value="" maxlength="3" size="5" onChange="isNumerical('noOfArticle');">
                                </font></td>
                            </tr>
                            <tr> 
                              <td colspan="3"> 
                                <div align="center"> <font color="#0099CC"> 
                                  <input type="submit" name="Submit" value="Start Data Collection">
                                  </font></div>
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
