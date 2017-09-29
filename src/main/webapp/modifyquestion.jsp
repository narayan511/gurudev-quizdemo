<%@ page import="java.util.*,com.et.lab.*" %>
<%
String formName=(request.getParameter("formName")==null)?"null":request.getParameter("formName");
String queTag=(request.getParameter("queTag")==null)?"null":request.getParameter("queTag");
String activityName=(request.getParameter("activityname")==null)?"updatequestion":request.getParameter("activityname");
Form formbean=(new Form()).getForm(formName);
Question quebean=(new Question()).getQuestion(formName,queTag);
%>
<html>
<head>
<title>ur Experimental Lab for CESO</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="backimages" type="text/css">
<link rel="stylesheet" href="images/text" type="text/css">
<link rel="stylesheet" href="images/text" type="text/css">
<link rel="stylesheet" href="images/backimages" type="text/css">
<script  LANGUAGE="JavaScript">
<!--
function placeFocus(){
document.myform.queInFirstLang.focus();
}

function getSelectedRadio(buttonGroup) {
   // returns the array number of the selected radio button or -1 if no button is selected
   // if the button group is an array (one button is not an array)
	
   if (buttonGroup[0]) { 
      for (var i=0; i< buttonGroup.length; i++) {
         if (buttonGroup[i].checked) {
            return i
         }
      }
   } else {
      if (buttonGroup.checked) { return 0; } 
	  // if the one button is checked, return zero
   }
   // if we get to this point, no radio button is selected
   return -1;
} // Ends the "getSelectedRadio" function

function getSelectedRadioValue(buttonGroup) {
   
   // returns the value of the selected radio button or "" if no button is selected
   var i = getSelectedRadio(buttonGroup);
   if (i == -1) {
      return "";
   } else {
      if (buttonGroup[i]) { // Make sure the button group is an array (not just one button)
         return buttonGroup[i].value;
      } else { // The button group is just the one button, and it is checked
         return ""+buttonGroup.value;
      }
   }
} // Ends the "getSelectedRadioValue" function

//for checking textual option
function checkingAnswerOption(){
	var value = getSelectedRadioValue(document.myform.answerChoice);
	group1=document.myform.answerOption;
	textgroup1=document.myform.optionFirstLangText;
	textgroup2=document.myform.optionSecondLangText;
	var flag=true;

	if(value=="T"){
		for (var i=0; i< group1.length; i++) {
			if(group1[i].checked || textgroup1[i].value.length>0 || textgroup2[i].value.length>0){
				if(flag){
					alert("you can not have options for Textual choice");			
					flag=false;
				}
			}		
			group1[i].checked=false;
			textgroup1[i].value="";
			textgroup2[i].value="";
      }//end of for

	}	
}

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
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
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" OnLoad="placeFocus();">
<table border="0" cellspacing="0" cellpadding="0" align="center" width="100%" height="100%">
  <tr valign="top"> 
    <td class="header" colspan="2"> <font color="#FFFFFF"><img src="images/duke.gif" width="400" height="59"></font></td>
  </tr>
  <tr> 
    <td class="butbkimag" valign="top" width="15%">&nbsp; </td>
    <td valign="top" class="mainbk" width="85%" height="95%"> 
      <table width="98%" border="0" cellspacing="1" cellpadding="1" align="center">
        <tr> 
          <td> 
            <form name="myform" method="GET" action="formcontroller.jsp" >
              <input type="hidden" name="activityname" value="<%=activityName%>">
              <table border="0" cellpadding="2" align="center" cellspacing="2" class="sitetext">
                <tr> 
                  <td colspan="2" class="buttons">&nbsp;</td>
                  <td width="399" class="buttons">&nbsp;</td>
                </tr>
                <tr> 
                  <input type="hidden" name="formId" value="<%=formbean.getFormId()%>">
                  <td colspan="2" class="buttons" bgcolor="#336699">FORM NAME</td>
                  <td width="399" class="buttons" bgcolor="#336699"> <%=formbean.getFormName()%> 
                    <input type="hidden" name="formName" value="<%=formbean.getFormName()%>">
                  </td>
                </tr>
                <tr> 
                  <td colspan="3" bgcolor="#F0F0F0"><img src="images/line.gif" width="100" height="1"></td>
                </tr>
                <tr> 
                  <td colspan="2" bgcolor="#336699" class="buttons">1. Question 
                    Number : </td>
                  <td bgcolor="#336699" width="399" class="buttons"> <font face="Verdana" size="2"> 
                    <%=quebean.getQueId()%></font> 
                    <input type="hidden" name="queId" value="<%=quebean.getQueId()%>">
                  </td>
                </tr>
                <tr> 
                  <td colspan="3" bgcolor="#F0F0F0"><img src="images/line.gif" width="100" height="1"></td>
                </tr>
                <tr> 
                  <td colspan="2" bgcolor="#336699" class="buttons">2. Question 
                    Tag : </td>
                  <td bgcolor="#336699" width="399" class="buttons"> <font face="Verdana" size="2"> 
                    <%=quebean.getQueTag()%> </font> 
                    <input type="hidden" name="queTag" value='<%=quebean.getQueTag()%>'>
                  </td>
                </tr>
                <tr> 
                  <td colspan="3" bgcolor="#F0F0F0"><img src="images/line.gif" width="100" height="1"></td>
                </tr>
                <tr> 
                  <td colspan="3" bgcolor="#336699"><span class="buttons">3</span><span class="buttons">. 
                    Type your questions :<font size="2"></font></span></td>
                </tr>
                <tr> 
                  <td colspan="2" bgcolor="#CCCCCC"> 
                    <div align="center"><font face="Verdana" size="2"><b><%=formbean.getLanguage1()%></b></font></div>
                  </td>
                  <td width="399" bgcolor="#CCCCCC"> 
                    <div align="center"><font face="Verdana" size="2"><b><%=formbean.getLanguage2()%></b></font></div>
                  </td>
                </tr>
                <tr> 
                  <td colspan="2" align="center" bgcolor="#F0F0F0"> <font face="Verdana" size="2"> 
                    <textarea name="queInFirstLang" cols="40" rows="5"><%=quebean.getQueInFirstLang()%></textarea>
                    </font></td>
                  <td align="center" width="399" bgcolor="#F0F0F0"> <font face="Verdana" size="2"> 
                    <textarea name="queInSecondLang" cols="40" rows="5"><%=quebean.getQueInSecondLang()%></textarea>
                    </font></td>
                </tr>
                <tr> 
                  <td colspan="3" bgcolor="#CCCCCC"><img src="images/line.gif" width="100" height="1"></td>
                </tr>
                <tr> 
                  <td colspan="2" bgcolor="#336699" class="buttons" height="43">4. 
                    Upload File </td>
                  <td width="399" bgcolor="#336699" class="buttons" height="43"> 
                    <input type="hidden" name="uploadFileName" value="<%=quebean.getUploadFileName()%>">
                    <a href="#" onClick="MM_openBrWindow('attachment.jsp','Attachment','width=500,height=300')"><b><font color="#FFFF00">&nbsp;Click 
                    Here </font></b></a> <b>to attach Image File</b></td>
                </tr>
                <tr> 
                  <td colspan="3" bgcolor="#F0F0F0"><img src="images/line.gif" width="100" height="1"></td>
                </tr>
                <tr> 
                  <td colspan="3" bgcolor="#336699"><span class="buttons">5. </span><span class="buttons"> 
                    Select your choice for answer :</span></td>
                </tr>
                <tr> 
                  <%
String answerChoice=quebean.getAnswerChoice();
%>
                  <td width="131" bgcolor="#F0F0F0"> <font face="Verdana" size="2"> 
                    <input type="radio" name="answerChoice" value="S" <%=answerChoice.equals("S")?"checked":""%> >
                    Single choice</font></td>
                  <td width="260" bgcolor="#F0F0F0"> <font face="Verdana" size="2"> 
                    <input type="radio" name="answerChoice" value="M" <%=answerChoice.equals("M")?"checked":""%> >
                    Multiple choice</font></td>
                  <td width="399" bgcolor="#F0F0F0"> <font face="Verdana" size="2"> 
                    <input type="radio" name="answerChoice" value="T" <%=answerChoice.equals("T")?"checked":""%> onClick="checkingAnswerOption();">
                    Textual</font></td>
                </tr>
                <tr> 
                  <td colspan="3" checked="checked" bgcolor="#CCCCCC"><img src="images/line.gif" width="100" height="1"></td>
                </tr>
                <tr> 
                  <td colspan="3" checked="checked" bgcolor="#336699"><span class="buttons">6. 
                    </span><span class="buttons">Enter your option Text : (Enter 
                    your option Text in respective language and check correct 
                    answer pattern for multiple choice only )</span> </td>
                </tr>
                <tr> 
                  <td width="131" checked="checked" bgcolor="#CCCCCC"> 
                    <div align="center"><font face="Verdana" size="2"><b>Correct 
                      Answer Pattern</b></font></div>
                  </td>
                  <td width="260" checked="checked" bgcolor="#CCCCCC"> 
                    <div align="center"><b><font face="Verdana, Arial, Helvetica, sans-serif"><font face="Verdana"><font size="2"></font></font></font></b></div>
                    <div align="center"><font face="Verdana" size="2"><b><%=formbean.getLanguage1()%> 
                      </b></font></div>
                  </td>
                  <td width="399" bgcolor="#CCCCCC"> 
                    <div align="center"><font face="Verdana" size="2"><b><%=formbean.getLanguage2()%></b></font></div>
                  </td>
                </tr>
                <% 
int optionLength=quebean.getOptionLength();
String[] answerOption=(optionLength>=1)?quebean.getAnswerOption():new String[5];
String[] optionFirstLangText=(optionLength>=1)?quebean.getOptionFirstLangText():new String[5];
String[] optionSecondLangText=(optionLength>=1)?quebean.getOptionSecondLangText():new String[5];

for(int i=0;i<optionFirstLangText.length;i++){
%>
                <tr> 
                  <td width="131" checked="checked" align="center" bgcolor="#F0F0F0"> 
                    <input type="checkbox" name="answerOption" value="<%=(i+1)%>" <%= ((answerOption[i]==null)?"0":answerOption[i]).equals(""+(i+1))?"checked":""%> onClick="checkingAnswerOption();">
                  </td>
                  <td width="260" checked="checked" align="center" bgcolor="#F0F0F0"> 
                    <input type="text" name="optionFirstLangText" value="<%= (optionFirstLangText[i]==null)?"":optionFirstLangText[i]%>"  onChange="checkingAnswerOption();">
                  </td>
                  <td align="center" width="399" bgcolor="#F0F0F0"> 
                    <input type="text" name="optionSecondLangText" value="<%= (optionSecondLangText[i]==null)?"":optionSecondLangText[i]%>" onChange="checkingAnswerOption();">
                  </td>
                </tr>
                <%
					  } //end of for
%>
                <tr> 
                  <td colspan="3" checked="checked" bgcolor="#F0F0F0"><img src="images/line.gif" width="100" height="1"></td>
                </tr>
                <tr> 
                  <td checked="checked" align="left" bgcolor="#336699"> <A HREF="#" onClick="window.history.back();"> 
                    &nbsp;&nbsp;Back</A> </td>
                  <td colspan="2" checked="checked" align="center" bgcolor="#336699"> 
                    <input type="submit" name="button" value="Update Question">
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
