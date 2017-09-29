<%@ page import="java.util.*,com.et.lab.*" %>
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
var clicks = 0;
var works = false;
function checkclicks()
{
	works = true;
	clicks++;
	works=checkValue();
	if(!works){
		clicks=0;
	}
	if(clicks > 1)
		works = false;



return works;
}

function placeFocus(){
document.myform.queTag.focus();
}

function checkValue(){
	var pno=document.myform.queTag.value;

	if(pno==""|| pno==null || pno.charAt(0) == ' '){
		alert("Please Enter Quetion Tag Name !");
		document.myform.queTag.focus();
		return false;
	}
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
<table border="0" cellspacing="0" cellpadding="0" align="center" width="100%">
  <tr valign="top"> 
    <td class="header" height="64" colspan="2"> <font color="#FFFFFF"><img src="images/duke.gif" width="400" height="59"></font></td>
  </tr>
  <tr> 
    <td class="butbkimag" valign="top" width="15%" height="656"> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td>&nbsp;</td>
        </tr>
      </table>
    </td>
    <td height="656" valign="top" class="mainbk" width="85%"> 
      <table width="98%" border="0" cellspacing="1" cellpadding="1" align="center">
        <tr> 
          <td> 
            <%
	String formName=(request.getParameter("formName")==null)?"null":request.getParameter("formName");
	Form formbean=new Form();			
	formbean=formbean.getForm(formName);
%>
            <form name="myform" method="GET" action="formcontroller.jsp" >
              <input type="hidden" name="activityname" value="createquestion">
              <table border="0" cellpadding="2" align="center" cellspacing="2" class="sitetext" width="98%">
                <tr> 
                  <td colspan="3" class="buttons">&nbsp;</td>
                  <td width="395" class="buttons" colspan="2">&nbsp;</td>
                </tr>
                <tr> 
                  <input type="hidden" name="formId" value="<%=formbean.getFormId()%>">
                  <td colspan="3" class="buttons" bgcolor="#336699">FORM NAME</td>
                  <td width="395" class="buttons" colspan="2" bgcolor="#336699"> 
                    <%=formbean.getFormName()%> 
                    <input type="hidden" name="formName" value="<%=formbean.getFormName()%>">
                  </td>
                </tr>
                <tr> 
                  <td colspan="5" bgcolor="#F0F0F0"><img src="images/line.gif" width="100" height="1"></td>
                </tr>
                <tr> 
                  <td colspan="3" bgcolor="#336699" class="buttons">1. Question 
                    Number : (Auto generated)</td>
                  <td bgcolor="#336699" width="395" class="buttons" colspan="2"> 
                    <%
Question que=new Question();
int qid=que.getNextQueId(formName);
%>
                    <font face="Verdana" size="2"> <%=qid%></font> 
                    <input type="hidden" name="queId" value="<%=qid%>">
                  </td>
                </tr>
                <tr> 
                  <td colspan="5" bgcolor="#F0F0F0"><img src="images/line.gif" width="100" height="1"></td>
                </tr>
                <tr> 
                  <td colspan="3" bgcolor="#336699" class="buttons">2. Question 
                    Tag : </td>
                  <td bgcolor="#336699" width="395" class="buttons" colspan="2"><font face="Verdana" size="2"> 
                    <input type="text" name="queTag">
                    </font> </td>
                </tr>
                <tr> 
                  <td colspan="5" bgcolor="#F0F0F0"><img src="images/line.gif" width="100" height="1"></td>
                </tr>
                <tr> 
                  <td colspan="5" bgcolor="#336699"><span class="buttons">3</span><span class="buttons">. 
                    Type your questions :<font size="2"></font></span></td>
                </tr>
                <tr> 
                  <td colspan="3" bgcolor="#CCCCCC"> 
                    <div align="center"><font face="Verdana" size="2"><b><%=formbean.getLanguage1()%></b></font></div>
                  </td>
                  <td width="395" bgcolor="#CCCCCC" colspan="2"> 
                    <div align="center"><font face="Verdana" size="2"><b><%=formbean.getLanguage2()%></b></font></div>
                  </td>
                </tr>
                <tr> 
                  <td colspan="3" align="center" bgcolor="#F0F0F0"> <font face="Verdana" size="2"> 
                    <textarea name="queInFirstLang" cols="40" rows="5"></textarea>
                    </font></td>
                  <td align="center" width="395" bgcolor="#F0F0F0" colspan="2"> 
                    <font face="Verdana" size="2"> 
                    <textarea name="queInSecondLang" cols="40" rows="5"></textarea>
                    </font></td>
                </tr>
                <tr> 
                  <td colspan="5" bgcolor="#CCCCCC"><img src="images/line.gif" width="99" height="2"></td>
                </tr>
                <tr> 
                  <td colspan="3" bgcolor="#336699" class="buttons">4. Upload 
                    File </td>
                  <td width="395" bgcolor="#336699" class="buttons" colspan="2"> 
                    <input type="hidden" name="uploadFileName" value="">
                    <a href="#" onClick="MM_openBrWindow('attachment.jsp','Attachment','width=500,height=300')"><b><font color="#FFFF00">&nbsp;Click 
                    Here</font></b></a> <b>to attach Image File</b></td>
                </tr>
                <tr> 
                  <td colspan="5" bgcolor="#F0F0F0"><img src="images/line.gif" width="99" height="1"></td>
                </tr>
                <tr> 
                  <td colspan="5" bgcolor="#336699"><span class="buttons">5. </span><span class="buttons"> 
                    Select your choice for answer :</span></td>
                </tr>
                <tr> 
                  <td bgcolor="#F0F0F0" colspan="2"> <font face="Verdana" size="2"> 
                    <input type="radio" name="answerChoice" value="S">
                    Single choice</font></td>
                  <td width="229" bgcolor="#F0F0F0"> <font face="Verdana" size="2"> 
                    <input type="radio" name="answerChoice" value="M" checked>
                    Multiple choice</font></td>
                  <td width="395" bgcolor="#F0F0F0" colspan="2"> <font face="Verdana" size="2"> 
                    <input type="radio" name="answerChoice" value="T" onClick="checkingAnswerOption();">
                    Textual</font></td>
                </tr>
                <tr> 
                  <td colspan="5" checked="checked" bgcolor="#CCCCCC"><img src="images/line.gif" width="99" height="2"></td>
                </tr>
                <tr> 
                  <td colspan="5" checked="checked" bgcolor="#336699"><span class="buttons">6. 
                    </span><span class="buttons">Enter your option Text : (Enter 
                    your option Text in respective language and check correct 
                    answer pattern for multiple choice)</span> </td>
                </tr>
                <tr> 
                  <td checked="checked" bgcolor="#CCCCCC" colspan="2"> 
                    <div align="center"><font face="Verdana" size="2"><b>Correct 
                      Answer Pattern</b></font></div>
                  </td>
                  <td width="229" checked="checked" bgcolor="#CCCCCC"> 
                    <div align="center"><b><font face="Verdana, Arial, Helvetica, sans-serif"><font face="Verdana"><font size="2"></font></font></font></b></div>
                    <div align="center"><font face="Verdana" size="2"><b><%=formbean.getLanguage1()%> 
                      </b></font></div>
                  </td>
                  <td width="395" bgcolor="#CCCCCC" colspan="2"> 
                    <div align="center"><font face="Verdana" size="2"><b><%=formbean.getLanguage2()%></b></font></div>
                  </td>
                </tr>
                <tr> 
                  <td checked="checked" align="center" bgcolor="#F0F0F0" width="61">1. 
                  </td>
                  <td checked="checked" align="center" bgcolor="#F0F0F0" width="99"> 
                    <input type="checkbox" name="answerOption" value="1" 
					onClick="checkingAnswerOption();"
					>
                  </td>
                  <td width="229" checked="checked" align="center" bgcolor="#F0F0F0"> 
                    <input type="text" name="optionFirstLangText" size="30" onChange="checkingAnswerOption();" >
                  </td>
                  <td align="center" width="395" bgcolor="#F0F0F0" colspan="2"> 
                    <input type="text" name="optionSecondLangText" size="30" onChange="checkingAnswerOption();">
                  </td>
                </tr>
                <tr> 
                  <td checked="checked" align="center" bgcolor="#F0F0F0" width="61">2. 
                  </td>
                  <td checked="checked" align="center" bgcolor="#F0F0F0" width="99"> 
                    <input type="checkbox" name="answerOption" value="2" onClick="checkingAnswerOption();">
                  </td>
                  <td width="229" checked="checked" align="center" bgcolor="#F0F0F0"> 
                    <input type="text" name="optionFirstLangText" size="30" onChange="checkingAnswerOption();">
                  </td>
                  <td align="center" width="395" bgcolor="#F0F0F0" colspan="2"> 
                    <input type="text" name="optionSecondLangText" size="30" onChange="checkingAnswerOption();">
                  </td>
                </tr>
                <tr> 
                  <td checked="checked" align="center" bgcolor="#F0F0F0" width="61">3. 
                  </td>
                  <td checked="checked" align="center" bgcolor="#F0F0F0" width="99"> 
                    <input type="checkbox" name="answerOption" value="3" onClick="checkingAnswerOption();">
                  </td>
                  <td width="229" checked="checked" align="center" bgcolor="#F0F0F0"> 
                    <input type="text" name="optionFirstLangText" size="30" onChange="checkingAnswerOption();">
                  </td>
                  <td align="center" width="395" bgcolor="#F0F0F0" colspan="2"> 
                    <input type="text" name="optionSecondLangText" size="30" onChange="checkingAnswerOption();">
                  </td>
                </tr>
                <tr> 
                  <td checked="checked" align="center" bgcolor="#F0F0F0" width="61">4. 
                  </td>
                  <td checked="checked" align="center" bgcolor="#F0F0F0" width="99"> 
                    <input type="checkbox" name="answerOption" value="4" onClick="checkingAnswerOption();">
                  </td>
                  <td width="229" checked="checked" align="center" bgcolor="#F0F0F0"> 
                    <input type="text" name="optionFirstLangText" size="30" onChange="checkingAnswerOption();">
                  </td>
                  <td align="center" width="395" bgcolor="#F0F0F0" colspan="2"> 
                    <input type="text" name="optionSecondLangText" size="30" onChange="checkingAnswerOption();">
                  </td>
                </tr>
                <tr> 
                  <td checked="checked" align="center" bgcolor="#F0F0F0" width="61">5. 
                  </td>
                  <td checked="checked" align="center" bgcolor="#F0F0F0" width="99"> 
                    <input type="checkbox" name="answerOption" value="5" onClick="checkingAnswerOption();">
                  </td>
                  <td width="229" checked="checked" align="center" bgcolor="#F0F0F0"> 
                    <input type="text" name="optionFirstLangText" size="30" onChange="checkingAnswerOption();">
                  </td>
                  <td align="center" width="395" bgcolor="#F0F0F0" colspan="2"> 
                    <input type="text" name="optionSecondLangText" size="30" onChange="checkingAnswerOption();">
                  </td>
                </tr>
                <tr> 
                  <td colspan="5" checked="checked" bgcolor="#F0F0F0"><img src="images/line.gif" width="99" height="1"></td>
                </tr>
                <tr> 
                  <td colspan="3" checked="checked" align="center" bgcolor="#336699"> 
                    <input type="submit" name="button" value="Add More Question" onClick="return checkclicks();">
                  </td>
                  <td width="196" checked="checked" align="center" bgcolor="#336699"> 
                    <input type="submit" name="button" value="Quit With Saving" onClick="return checkclicks();">
                  </td>
                  <td width="197" checked="checked" align="center" bgcolor="#336699"> 
                    <input type="submit" name="button" value="Quit Without Saving">
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
